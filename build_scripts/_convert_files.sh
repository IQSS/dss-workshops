#!/bin/sh

# Converts .Rmd files to other formats and zips them.

set -ev

base_path="/Users/sworthin/Documents/IQSS/dss-workshops-redux"

# StataIntro
StataIntro_path="Stata/StataIntro"
cd $base_path/$StataIntro_path
jupytext --to r StataIntro.Rmd  
mv StataIntro.r StataIntro.do  # change file suffix to .do
sed -i "" 's/#/*/' StataIntro.do # convert # to *
sed -i "" '1,7d' StataIntro.do # delete lines 1-7
# then change hash comments to astericks
cd ..
zip -r StataIntro.zip StataIntro -x "*.DS_Store"

# Rintro
Rintro_path="R/Rintro"
cd $base_path/$Rintro_path
jupytext --to r Rintro.Rmd
sed -i "" '1,6d' Rintro.r # delete lines 1-6
jupytext --to notebook Rintro.Rmd
cd ..
zip -r Rintro.zip Rintro -x "*.DS_Store"

# Rmodels
Rmodels_path="R/Rmodels"
cd $base_path/$Rmodels_path
jupytext --to r Rmodels.Rmd
sed -i "" '1,6d' Rmodels.r # delete lines 1-6
jupytext --to notebook Rmodels.Rmd
cd ..
zip -r Rmodels.zip Rmodels -x "*.DS_Store"

# Rgraphics
Rgraphics_path="R/Rgraphics"
cd $base_path/$Rgraphics_path
jupytext --to r Rgraphics.Rmd
sed -i "" '1,6d' Rgraphics.r # delete lines 1-6
jupytext --to notebook Rgraphics.Rmd
cd ..
zip -r Rgraphics.zip Rgraphics -x "*.DS_Store"

# RDataWrangling
RDataWrangling_path="R/RDataWrangling"
cd $base_path/$RDataWrangling_path
jupytext --to r RDataWrangling.Rmd
sed -i "" '1,6d' RDataWrangling.r # delete lines 1-6
jupytext --to notebook RDataWrangling.Rmd
cd ..
zip -r RDataWrangling.zip RDataWrangling -x "*.DS_Store"

# PythonIntro
PythonIntro_path="Python/PythonIntro"
cd $base_path/$PythonIntro_path
jupytext --to py:light PythonIntro.Rmd
sed -i "" '1,4d' PythonIntro.py # delete lines 1-4
jupytext --to notebook PythonIntro.Rmd
cd ..
zip -r PythonIntro.zip PythonIntro -x "*.DS_Store"

# PythonWebScrape
PythonWebScrape_path="Python/PythonWebScrape"
cd $base_path/$PythonWebScrape_path
jupytext --to py:light PythonWebScrape.Rmd
sed -i "" '1,4d' PythonWebScrape.py # delete lines 1-4
jupytext --to notebook PythonWebScrape.Rmd
cd ..
zip -r PythonWebScrape.zip PythonWebScrape -x "*.DS_Store"
