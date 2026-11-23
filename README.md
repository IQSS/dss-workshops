# dss-workshops

The workshops of IQSS Data Science Services as one Quarto website: R, Python,
Stata, and the tools around them, one page per workshop with materials to
download and exercises with solutions. Rebuilt in 2026 from the 2021
materials on current R, Positron, Python, and Stata. For the DSS team that
writes and teaches them, and for anyone who wants to build the site.

## Build

```sh
quarto preview                      # or quarto render; needs Quarto 1.9+
Rscript scripts/derive.R r/intro.qmd  # regenerate a workshop's download files after editing its page
```

R chapters execute through `renv` (`renv::restore()` once, after cloning).
`_freeze/` holds the render cache and `_quarto.yml` sets `freeze: true`, so
a plain `quarto render` never executes code and needs no language runtime.
After changing a chapter's code, render that page on its own
(`quarto render r/intro.qmd`) to refresh its freeze, and commit `_freeze/`.
