#!/usr/bin/env Rscript
# derive.R: from one workshop page, the files learners download.
#
#   Rscript scripts/derive.R r/intro.qmd
#
# Writes into the page's materials directory (r/intro/), which is also the code's working directory:
#   intro.qmd            the notes, standalone: no site plumbing, images alongside, renderable in RStudio
#   intro_BLANK.qmd      the same with the code removed and the comments kept, to type along in
#   intro_SOLUTIONS.qmd  the exercise solutions only
#   intro.R              the code, with the prose as comments
#   intro.ipynb          a notebook (nbformat 4, written here)
#   images/              the page's images, so the standalone files render
# and dist/materials-<lang>-<slug>.zip: the materials directory, zipped (dist/ is gitignored).
#
# Rules, taken from the 2021 hand-made files: the BLANK drops every solution block and every code line,
# keeps comment lines, promotes a trailing comment (`x <- 1  # note`) to a line of its own, drops the bare
# `##` placeholders, and leaves one blank line where code was, to type into. Base R plus zip.

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) stop("usage: Rscript scripts/derive.R <lang>/<slug>.qmd")
page <- args[1]
if (!file.exists(page)) stop("no such page: ", page)
lang <- basename(dirname(page))
slug <- sub("\\.qmd$", "", basename(page))
mat <- file.path(lang, slug)
if (!dir.exists(mat)) stop("no materials directory: ", mat)
site_url <- "https://iqss.github.io/dss-workshops"

x <- readLines(page, warn = FALSE)

# --- front matter -------------------------------------------------------------------------------------------
fm_end <- which(x == "---")[2]
front <- x[2:(fm_end - 1)]
title <- sub("^title:\\s*\"?(.*?)\"?\\s*$", "\\1", grep("^title:", front, value = TRUE)[1])
body <- x[(fm_end + 1):length(x)]

# --- drop the hidden setup chunk (site plumbing) ------------------------------------------------------------
drop_setup <- function(b) {
  i <- 1
  while (i <= length(b)) {
    if (grepl("^```\\{r\\}\\s*$", b[i])) {
      j <- i + 1
      while (j <= length(b) && !grepl("^```\\s*$", b[j])) j <- j + 1
      chunk <- b[i:j]
      if (any(grepl("^#\\| include: false", chunk)) && any(grepl("opts_knit|max\\.print", chunk))) {
        b <- b[-(i:j)]
        while (i <= length(b) && b[i] == "") b <- b[-i]
        return(b)
      }
      i <- j
    }
    i <- i + 1
  }
  b
}
body <- drop_setup(body)

# --- links: images alongside, materials files alongside, pages on the site --------------------------------
relink <- function(b) {
  b <- gsub(sprintf("](images/%s/", slug), "](images/", b, fixed = TRUE)
  b <- gsub(sprintf("](%s/", slug), "](", b, fixed = TRUE)
  b <- gsub("\\]\\(([a-z]+)\\.qmd(#[^)]*)?\\)", sprintf("](%s/%s/\\1.html\\2)", site_url, lang), b)
  b <- gsub("\\]\\(\\.\\./([a-z]+)/([a-z]+)\\.qmd(#[^)]*)?\\)", sprintf("](%s/\\1/\\2.html\\3)", site_url), b)
  b
}
body <- relink(body)

# --- split into solution blocks and the rest ----------------------------------------------------------------
sol_open <- grepl("^::: \\{\\.callout-tip collapse=\"true\" title=\"Exercise", body)
is_fence <- grepl("^:::\\s*$", body)
in_sol <- logical(length(body))
open <- FALSE
for (i in seq_along(body)) {
  if (sol_open[i]) open <- TRUE
  in_sol[i] <- open
  if (open && is_fence[i]) open <- FALSE
}
solutions <- body[in_sol]
without <- body[!in_sol]

# --- the BLANK: code out, comments in --------------------------------------------------------------------------
blank_chunk <- function(lines) {
  out <- character()
  pending_gap <- FALSE
  for (l in lines) {
    if (grepl("^\\s*#\\|", l)) { out <- c(out, l); next }
    if (grepl("^\\s*##\\s*$", l)) { pending_gap <- TRUE; next }
    if (grepl("^\\s*#", l)) { if (pending_gap) { out <- c(out, ""); pending_gap <- FALSE }; out <- c(out, l); next }
    if (grepl("^\\s*$", l)) { pending_gap <- TRUE; next }
    # a code line: keep a trailing comment, if the quotes before it are balanced
    m <- regmatches(l, regexec("^(.*?\\S)\\s+(#.*)$", l))[[1]]
    if (length(m) && nchar(gsub("[^\"]", "", m[2])) %% 2 == 0 && nchar(gsub("[^']", "", m[2])) %% 2 == 0) {
      if (pending_gap) { out <- c(out, ""); pending_gap <- FALSE }
      out <- c(out, m[3])
    } else {
      pending_gap <- TRUE
    }
  }
  if (pending_gap) out <- c(out, "")
  out
}
blank_body <- function(b) {
  out <- character(); i <- 1
  while (i <= length(b)) {
    if (grepl("^```\\{r\\}\\s*$", b[i])) {
      j <- i + 1
      while (j <= length(b) && !grepl("^```\\s*$", b[j])) j <- j + 1
      out <- c(out, b[i], blank_chunk(b[(i + 1):(j - 1)]), b[j])
      i <- j + 1
    } else {
      out <- c(out, b[i]); i <- i + 1
    }
  }
  out
}

# --- the script: prose as comments -----------------------------------------------------------------------------
script_of <- function(b) {
  out <- character(); in_code <- FALSE
  for (l in b) {
    if (!in_code && grepl("^```\\{r\\}\\s*$", l)) { in_code <- TRUE; out <- c(out, ""); next }
    if (in_code && grepl("^```\\s*$", l)) { in_code <- FALSE; out <- c(out, ""); next }
    if (in_code) { out <- c(out, l); next }
    if (grepl("^```", l)) next                    # other fences: drop the fence line itself
    if (grepl("^:::", l)) next                    # callout fences
    out <- c(out, if (l == "") "#" else paste("#", l))
  }
  # collapse runs of empty comment lines
  keep <- !(out == "#" & c(TRUE, head(out, -1) == "#"))
  out[keep]
}

compact <- function(b) { keep <- !(b == "" & c(TRUE, head(b, -1) == "")); b <- b[keep]; while (length(b) && b[1] == "") b <- b[-1]; b }

fm <- function(t) c("---", sprintf("title: \"%s\"", t), "format: html", "execute:", "  warning: false", "  message: false", "---", "")

# --- write ------------------------------------------------------------------------------------------------------
writeLines(c(fm(title), compact(body)), file.path(mat, paste0(slug, ".qmd")))
writeLines(c(fm(paste(title, "(BLANK)")), compact(blank_body(without))), file.path(mat, paste0(slug, "_BLANK.qmd")))

sol_out <- character()
for (i in which(sol_open)) {
  t <- sub("^.*title=\"(.*)\"\\}\\s*$", "\\1", body[i])
  j <- i + 1
  while (j <= length(body) && !is_fence[j]) j <- j + 1
  sol_out <- c(sol_out, paste("##", sub("^(.)", "\\U\\1", t, perl = TRUE)), "", body[(i + 1):(j - 1)], "")
}
writeLines(c(fm(paste(title, "(exercise solutions)")), compact(sol_out)), file.path(mat, paste0(slug, "_SOLUTIONS.qmd")))

writeLines(c(sprintf("# %s", title), "#", script_of(compact(body))), file.path(mat, paste0(slug, ".R")))

img_src <- file.path(lang, "images", slug)
if (dir.exists(img_src)) {
  dir.create(file.path(mat, "images"), showWarnings = FALSE)
  invisible(file.copy(list.files(img_src, full.names = TRUE), file.path(mat, "images"), overwrite = TRUE))
}

# The notebook, written directly (nbformat 4): quarto convert validates the kernel and this machine has no R
# kernelspec. Minimal metadata, as jupytext wrote in 2021; JupyterLab picks the R kernel on the learner's side.
json_str <- function(s) {
  s <- gsub("\\\\", "\\\\\\\\", s); s <- gsub("\"", "\\\\\"", s); s <- gsub("\t", "\\\\t", s); s <- gsub("\r", "", s); s <- gsub("\n", "\\\\n", s)
  paste0("\"", s, "\"")
}
nb_cell <- function(type, lines) {
  while (length(lines) && lines[1] == "") lines <- lines[-1]
  while (length(lines) && lines[length(lines)] == "") lines <- lines[-length(lines)]
  if (!length(lines)) return(NULL)
  src <- paste0(lines, c(rep("\n", length(lines) - 1), ""))
  src <- paste0("[", paste(json_str(src), collapse = ", "), "]")
  if (type == "code") sprintf('{"cell_type": "code", "execution_count": null, "metadata": {}, "outputs": [], "source": %s}', src)
  else sprintf('{"cell_type": "markdown", "metadata": {}, "source": %s}', src)
}
notebook_of <- function(b) {
  cells <- character(); buf <- character(); in_code <- FALSE
  for (l in b) {
    if (!in_code && grepl("^```\\{r\\}\\s*$", l)) { cells <- c(cells, nb_cell("markdown", buf)); buf <- character(); in_code <- TRUE; next }
    if (in_code && grepl("^```\\s*$", l)) { cells <- c(cells, nb_cell("code", buf)); buf <- character(); in_code <- FALSE; next }
    buf <- c(buf, l)
  }
  cells <- c(cells, nb_cell("markdown", buf))
  paste0('{"cells": [', paste(cells, collapse = ",\n"), '],\n',
         '"metadata": {"kernelspec": {"display_name": "R", "language": "R", "name": "ir"}, "language_info": {"name": "R"}},\n',
         '"nbformat": 4, "nbformat_minor": 4}')
}
writeLines(notebook_of(compact(body)), file.path(mat, paste0(slug, ".ipynb")))

dir.create("dist", showWarnings = FALSE)
zipfile <- file.path(getwd(), "dist", sprintf("materials-%s-%s.zip", lang, slug))
if (file.exists(zipfile)) unlink(zipfile)
old <- setwd(lang); on.exit(setwd(old), add = TRUE)
z <- system2("zip", c("-qr", shQuote(zipfile), slug, "-x", "'*.DS_Store'"), stdout = TRUE, stderr = TRUE)
setwd(old)
if (!file.exists(zipfile)) stop("zip failed:\n", paste(z, collapse = "\n"))

cat(sprintf("%s: %s.qmd, %s_BLANK.qmd (%d solution blocks removed), %s_SOLUTIONS.qmd, %s.R, %s.ipynb, images/; %s (%.1f MB)\n",
            mat, slug, slug, sum(sol_open), slug, slug, slug, basename(zipfile), file.size(zipfile) / 1048576))
