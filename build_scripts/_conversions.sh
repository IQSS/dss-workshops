#!/bin/sh

# Converts .Rmd files to other formats and zips them.

set -ev

# StataIntro
jupytext --to r StataIntro.Rmd  
mv StataIntro.r StataIntro.do  # change file suffix to .do
sed -i "" 's/#/*/' StataIntro.do # convert # to *
sed -i "" '1,7d' StataIntro.do # delete lines 1-7
# then change hash comments to astericks
zip -r my-folder.zip my-folder -x "*.DS_Store"

# Rintro
jupytext --to r Rintro.Rmd
jupytext --to notebook Rintro.Rmd
zip -r my-folder.zip my-folder -x "*.DS_Store"

# Rmodels
jupytext --to r Rmodels.Rmd
jupytext --to notebook Rmodels.Rmd
zip -r my-folder.zip my-folder -x "*.DS_Store"

# Rgraphics
jupytext --to r Rgraphics.Rmd
jupytext --to notebook Rgraphics.Rmd
zip -r my-folder.zip my-folder -x "*.DS_Store"

# RDataWrangling
jupytext --to r RDataWrangling.Rmd
jupytext --to notebook RDataWrangling.Rmd
zip -r my-folder.zip my-folder -x "*.DS_Store"

# PythonIntro
jupytext --to py:light PythonIntro.Rmd
jupytext --to notebook PythonIntro.Rmd
zip -r my-folder.zip my-folder -x "*.DS_Store"

# PythonWebScrape
jupytext --to py:light PythonWebScrape.Rmd
jupytext --to notebook PythonWebScrape.Rmd
zip -r my-folder.zip my-folder -x "*.DS_Store"
