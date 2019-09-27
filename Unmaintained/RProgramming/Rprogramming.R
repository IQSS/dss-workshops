## ------------------------------------------------------------------------
data_dir_files <- list.files("example_data/baby_names",
                             recursive = TRUE,
                             full.names = TRUE)

head(data_dir_files)

## ------------------------------------------------------------------------
## make up some example data
user.info <- c("Dexter Bacon dbacon@gmail.com 32",
               "Angelica Sampson not available 28",
               "Roberta Modela roberta.modela@harvard.edu 26"
               )
## regex that matches emails (simplified, not realistic)
##                                               
email.regex <- "([a-z0-9]+@[a-z0-9]+\\.[a-z]+)"

## ------------------------------------------------------------------------
str_detect(user.info, email.regex)

## ------------------------------------------------------------------------
str_subset(user.info, email.regex)

## ------------------------------------------------------------------------
str_extract(user.info, email.regex)

## ------------------------------------------------------------------------
str_replace(user.info, email.regex, "<a href='mailto:\\1'>\\1</a>")

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
library(tidyverse)

girl.names.1 <- read_csv(girl.file.names[1], na = "")
head(girl.names.1)

## ------------------------------------------------------------------------
example.int.1 <- c(10, 11, 12, 13, 14, 15)
str(example.int.1)

## ------------------------------------------------------------------------
names(example.int.1) # no names yet, lets add some

## ------------------------------------------------------------------------
names(example.int.1) <- c("a1", "a2", "b1", "b2", "c1", "c2")
names(example.int.1)

## ------------------------------------------------------------------------
## extract by position
example.int.1[1]
example.int.1[c(1, 3, 5)]

## ------------------------------------------------------------------------
## extract by name
example.int.1[c("c2", "a1")]

## ------------------------------------------------------------------------
## logical extraction 
(one.names <- str_detect(names(example.int.1), "1"))


## ------------------------------------------------------------------------
example.int.1[one.names]

## ------------------------------------------------------------------------
example.int.1[example.int.1 > 12]

## ------------------------------------------------------------------------
example.int.2 <- example.int.1

## replace by position
example.int.2[1] <- 100

## replace by name
example.int.2["a2"] <- 200
example.int.2

## ------------------------------------------------------------------------
## logical replacement
(lt14 <- example.int.2 < 14)

## ------------------------------------------------------------------------
example.int.2[lt14] <- 0
example.int.2

## ------------------------------------------------------------------------
## "replace" non-existing element
example.int.2[c("z1", "2")] <- -10 

## compare lists to see the changes we made
example.int.1
example.int.2

## ------------------------------------------------------------------------
boys <- list()
girls <- list()

boys[[1]] <- read_csv(boy.file.names[1], na = "")
boys[[2]] <- read_csv(boy.file.names[2], na = "")
## ...
girls[[1]] <- read_csv(girl.file.names[1], na = "")
girls[[2]] <- read_csv(girl.file.names[2], na = "")
## ...

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
## make up some example data
list.1 <- list(a = sample(1:5, 20, replace = TRUE),
               b = c(NA, sample(1:10, 20, replace = TRUE)),
               c = sample(10:15, 20, replace = TRUE))

## ------------------------------------------------------------------------
library(purrr)

map.1 <- map(list.1, mean)
str(map.1)

## ------------------------------------------------------------------------
map.1 <- map(list.1, mean, na.rm = TRUE)
str(map.1)

## ------------------------------------------------------------------------
map.2 <- map_dbl(list.1, mean)
str(map.2)

## ------------------------------------------------------------------------
map.3 <- map_chr(list.1, mean)

## ------------------------------------------------------------------------
map.4 <- map(list.1, summary)
str(map.4)

## ------------------------------------------------------------------------
## define new function that returns the lenght, mean, and standard deviation
my.summary <- function(x) {
  n <- length(x)
  avg <- mean(x)
  std.dev <- sd(x)
  return(c(N = n, Mean = avg, Standard.Deviation = std.dev))
}

## test it out
my.summary(list.1[[1]])

## ------------------------------------------------------------------------
map(list.1, my.summary)

## ------------------------------------------------------------------------
## improve our function by allowing arbitrary arguments to be passed into the body
my.summary <- function(x, ...) {
  n <- length(x)
  avg <- mean(x, ...)
  std.dev <- sd(x, ...)
  return(c(N = n, Mean = avg, Standard.Deviation = std.dev))
}

## ------------------------------------------------------------------------
my.summary(list.1[[1]])

## ------------------------------------------------------------------------
my.summary(list.1[[2]])

## ------------------------------------------------------------------------
my.summary(list.1[[2]], na.rm = TRUE) 

## ------------------------------------------------------------------------
## improve our function by removing missing values if they exist.
my.summary <- function(x, ...) {
  if(any(is.na(x))) {
    x <- na.omit(x)
  }
  n <- length(x)
  avg <- mean(x, ...)
  std.dev <- sd(x, ...)
  return(c(N = n, Mean = avg, Standard.Deviation = std.dev))
}

## ------------------------------------------------------------------------
my.summary <- function(x, mean.only = FALSE, ...) {
  if(!is.numeric(x)) {
    stop("x is not numeric.")
  }
  if(any(is.na(x))) {
    x <- na.omit(x)
  }
  if(mean.only) {
    stats <- c(N = length(x), Mean = mean(x))
  } else {
    stats <- c(N = length(x), Mean = mean(x), Standard.Deviation = sd(x))
  }
  return(stats)
}

## ------------------------------------------------------------------------
map(list.1, my.summary)

## ------------------------------------------------------------------------
map(list.1, my.summary, mean.only = TRUE)

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
str(girls.data, max.level = 1)

## ------------------------------------------------------------------------
girls.data.1 <- girls.data[[1]]
class(girls.data.1)

## ------------------------------------------------------------------------
methods(class = "data.frame")

## ------------------------------------------------------------------------
list(dim = dim(girls.data.1),
     rows = nrow(girls.data.1),
     cols = ncol(girls.data.1),
     names = names(girls.data.1),
     summary = summary(girls.data.1))

## ------------------------------------------------------------------------
str(girls.data[[1]])

## ------------------------------------------------------------------------
girls.data[[1]][["Year"]] <- names(girls.data[1])
##        ^                                  ^ 
## double brackets to extract data.frame   single brackets to extract a list containing a data.frame
str(girls.data[[1]])

## ------------------------------------------------------------------------
girls.data[[1]][["Year"]] <- as.integer(names(girls.data[1]))
str(girls.data[[1]])

## ------------------------------------------------------------------------
example.list.3 <- list(a = 1:3,
                       b = 4:6,
                       c = 7:9)
upper.name <- function(x, y) {
  y.upper <- str_to_upper(y)
  return(str_c(y.upper, x, sep = ": "))
}

example.list.4 <- map2(example.list.3, names(example.list.3), upper.name)
str(example.list.3)
str(example.list.4)

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
library(dplyr)

boys.data <- bind_rows(boys.data)
girls.data <- bind_rows(girls.data)

## ------------------------------------------------------------------------
girls.data[["Sex"]] <- "F"
boys.data[["Sex"]] <- "M"
baby.names <- bind_rows(girls.data, boys.data)
baby.names$Year <- as.integer(baby.names$Year)
baby.names$Location <- "England and Wales"

## ------------------------------------------------------------------------
str(baby.names)

## ------------------------------------------------------------------------
baby.names.path <- "example_data/baby_names/US" 
baby.names.url <- str_c(baby.names.path, "index.html", sep = "/")
baby.names.page <- read_lines(baby.names.url)

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
## 1. extract file names
file.names <- na.omit(str_extract(baby.names.page, "[A-Z]+\\.csv"))
file.locations <- str_c(baby.names.path, file.names, sep = "/")

## 2. read in the data
us.baby.names <- map(file.locations,
                     read_csv,
                     col_names = FALSE,
                     na = "",
                     col_types = "ccici")

## 3. collapse list of data.frames into a single data.frame
us.baby.names <- bind_rows(us.baby.names)

## 4. add column names
names(us.baby.names) <- c("Location", "Sex", "Year", "Name", "Count")

## 5. wrap it in a function
read.linked.files <- function(url,
                              pattern = "[A-z0-9]+\\.csv",
                              reader.fun = read_csv) {
  ## extract file names
  file.names <- na.omit(str_extract(read_lines(url), pattern))
  file.locations <- str_c(dirname(url), file.names, sep = "/")
  
  ## read in the data
  the.data <- map(file.locations,
                  reader.fun)
  
  ## collapse list of data.frames into a single data.frame
  return(bind_rows(the.data))
}

## test it out.
test <- read.linked.files("example_data/baby_names/US/index.html",
                          pattern = "[A-Z]+\\.csv",
                          reader.fun = function(x) {
                            read_csv(x, col_names = FALSE, na = "", col_types = "ccici")
                          })


## ------------------------------------------------------------------------
baby.names[["Rank"]] <- NULL

## ------------------------------------------------------------------------
baby.names <- bind_rows(baby.names, us.baby.names)
rm(us.baby.names)

## ------------------------------------------------------------------------
baby.names[["Name"]] <- str_to_lower(baby.names[["Name"]])

## ------------------------------------------------------------------------
## make up some example data
(example.df <- data.frame(id  = rep(letters[1:4], each = 4),
                          t   = rep(1:4, times = 4),
                          var1 = runif(16),
                          var2 = sample(letters[1:3], 16, replace = TRUE)))

## ------------------------------------------------------------------------
## summarize
summarize(example.df,
          var1 = sum(var1))

## ------------------------------------------------------------------------
## summarize by id
example.df %>%
  group_by(id) %>%
  summarize(var1 = sum(var1))

## ------------------------------------------------------------------------
## summarize by id and var2
example.df %>%
  group_by(id, var2) %>%
  summarize(var1 = sum(var1))

## ------------------------------------------------------------------------
group_by(baby.names, Year) %>%
  summarize(Total = sum(Count))

## ------------------------------------------------------------------------
group_by(baby.names, Year, Sex) %>%
  summarize(Total = sum(Count))

## ------------------------------------------------------------------------
## add new columns using mutate
(example.df <- example.df %>%
   mutate(n1 = n(),
          n2 = length(var1),
          var3 = var1/n1))

## ------------------------------------------------------------------------
## combine with group_by
(example.df <- example.df %>%
   group_by(id) %>%
   mutate(n3 = n(),
          var4 = var1/n3))

## ------------------------------------------------------------------------
## summarize by id and var2
(example.df.2 <- example.df %>%
   group_by(id, var2) %>%
   summarize(var1 = sum(var1)))

## ------------------------------------------------------------------------
## sort by var1
example.df.2 %>%
  arrange(var1)

## ------------------------------------------------------------------------
example.df.2 %>%
  arrange(desc(var1))

## ------------------------------------------------------------------------
## sort by var1 within id
(example.df.2 <- example.df.2 %>%
   arrange(id, desc(var1)))

## ------------------------------------------------------------------------
## select the top 2 var1's within each id group
example.df.2 %>%
  group_by(id) %>%
  slice(1:2)

## ------------------------------------------------------------------------
## create a percent column
baby.names <- baby.names %>%
  group_by(Location, Year, Sex) %>%
  mutate(Percent = (Count/sum(Count)) * 100)

## collapse across year and location to get the average percent for each each name by sex
baby.names.percent.overall <- baby.names %>%
  group_by(Sex, Name) %>%
  summarize(Percent = mean(Percent))

## arrange the data with the highest average percent first, and select the top 5
(top.names.overall <- baby.names.percent.overall %>%
   arrange(Sex, desc(Percent)) %>%
   group_by(Sex) %>%
   slice(1:5))

## ------------------------------------------------------------------------
baby.names.sex.decade <- baby.names %>%
  ## aggregate Year to Decade
  mutate(Decade = str_c(floor(Year/10)*10, "'s")) %>%
  ## calculate Percent by Location, Sex, and Year
  group_by(Location, Sex, Year) %>%
  mutate(Percent = (Count/sum(Count)) * 100) %>%
  ## summarize to the Sex/Decade/Name level
  group_by(Sex, Decade, Name) %>%
  summarize(Count = sum(Count),
            Percent = mean(Percent)) %>%
  ## order the names by overall popularity.
  group_by(Sex) %>%
  mutate(Name = reorder(Name, -1*Percent))

## plot
library(ggplot2)

ggplot(baby.names.sex.decade, aes(x = Name, y = Percent, fill = Sex, color = Sex)) +
  geom_bar(stat = "identity") +
  facet_grid(Decade ~ Sex, scales = "free_x") +
  theme(axis.text.x = element_blank())

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
##install.packages("phonics")
library(phonics)
spelling <- c(
"colour",   "color",       
"flavour",   "flavor",   
"behaviour", "behavior", 
"harbour",   "harbor",   
"honour",    "honor",    
"humour",    "humor",    
"labour",    "labor",    
"neighbour", "neighbor", 
"rumour",    "rumor")

(spelling.data <- data.frame(original = spelling, Sounds.like = nysiis(spelling, maxCodeLen = 15)))

## ------------------------------------------------------------------------
(spelling.data <- spelling.data %>%
   group_by(Sounds.like) %>%
   mutate(Alternative.spellings = str_c(sort(original), collapse = "/")))

## ------------------------------------------------------------------------
library(phonics)
baby.names <- baby.names %>%
  group_by(Sex) %>%
  mutate(Sounds.like = str_c(nysiis(Name, maxCodeLen = 10),
                             metaphone(Name, maxCodeLen = 10),
                             sep = "/")) %>%
  group_by(Sex, Sounds.like) %>%
  mutate(Alternative.spellings = str_c(sort(unique(Name)), collapse = "/")) %>%
  ungroup()
str(baby.names)

## ------------------------------------------------------------------------
month.name
str_sub(month.name, 1, 1)
str_sub(month.name, 1, 3)
str_sub(month.name, -1, -1)
str_sub(month.name, -3, -1)

## ------------------------------------------------------------------------

baby.names[["First.1"]] <- str_sub(baby.names[["Name"]], 1, 1)
baby.names[["First.2"]] <- str_sub(baby.names[["Name"]], 1, 2)
baby.names[["First.3"]] <- str_sub(baby.names[["Name"]], 1, 3)
baby.names[["Last.1"]] <- str_sub(baby.names[["Name"]], -1, -1)
baby.names[["Last.2"]] <- str_sub(baby.names[["Name"]], -2, -1)
baby.names[["Last.3"]] <- str_sub(baby.names[["Name"]], -3, -1)

## ------------------------------------------------------------------------
baby.names$Name.length <- str_length(baby.names$Name)

## ------------------------------------------------------------------------
.1 == .3/3

## ------------------------------------------------------------------------
all.equal(.1, .3/3)

## ------------------------------------------------------------------------
x <- c(1:10, NA, 12:20)
c(mean(x), sd(x), median(x), min(x), sd(x))

## ------------------------------------------------------------------------
# combining values coereces them to the most general type
(x <- c(TRUE, FALSE, 1, 2, "a", "b"))
str(x)

# comparisons convert arguments to most general type
1 > "a"

## ------------------------------------------------------------------------
mean(1, 2, 3, 4, 5)*5
sum(1, 2, 3, 4, 5)

## ------------------------------------------------------------------------
args(mean)
args(sum)

## ------------------------------------------------------------------------
(x <- factor(c(5, 5, 6, 6), levels = c(6, 5)))

str(x)

as.character(x)
# here is where people sometimes get lost...
as.numeric(x)
# you probably want
as.numeric(as.character(x))

