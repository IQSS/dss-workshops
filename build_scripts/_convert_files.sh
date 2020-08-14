#!/bin/sh

# Converts .Rmd files to other formats and zips them.

set -ev

base_path="/Users/sworthin/Documents/IQSS/dss-workshops"

# DataScienceTools
DataScienceTools_path="other_workshops/DataScienceTools"
cd $base_path/$DataScienceTools_path
jupytext --to R:bare DataScienceTools.Rmd
sed -i "" '1,6d' DataScienceTools.R # delete lines 1-6
jupytext --to notebook DataScienceTools.Rmd
cd ..
zip -r DataScienceTools.zip DataScienceTools -x "*.DS_Store"

# Rintro
Rintro_path="R/Rintro"
cd $base_path/$Rintro_path
jupytext --to R:bare Rintro.Rmd
sed -i "" '1,6d' Rintro.R # delete lines 1-6
jupytext --to notebook Rintro.Rmd
cd ..
zip -r Rintro.zip Rintro -x "*.DS_Store"

# Rmodels
Rmodels_path="R/Rmodels"
cd $base_path/$Rmodels_path
jupytext --to R:bare Rmodels.Rmd
sed -i "" '1,6d' Rmodels.R # delete lines 1-6
jupytext --to notebook Rmodels.Rmd
cd ..
zip -r Rmodels.zip Rmodels -x "*.DS_Store"

# Rgraphics
Rgraphics_path="R/Rgraphics"
cd $base_path/$Rgraphics_path
jupytext --to R:bare Rgraphics.Rmd
sed -i "" '1,6d' Rgraphics.R # delete lines 1-6
jupytext --to notebook Rgraphics.Rmd
cd ..
zip -r Rgraphics.zip Rgraphics -x "*.DS_Store"

# RDataWrangling
RDataWrangling_path="R/RDataWrangling"
cd $base_path/$RDataWrangling_path
jupytext --to R:bare RDataWrangling.Rmd
sed -i "" '1,6d' RDataWrangling.R # delete lines 1-6
jupytext --to notebook RDataWrangling.Rmd
cd ..
zip -r RDataWrangling.zip RDataWrangling -x "*.DS_Store"

# PythonIntro
PythonIntro_path="Python/PythonIntro"
cd $base_path/$PythonIntro_path
jupytext --to py:bare PythonIntro.Rmd
sed -i "" '1,4d' PythonIntro.py # delete lines 1-4
jupytext --to notebook PythonIntro.Rmd
cd ..
zip -r PythonIntro.zip PythonIntro -x "*.DS_Store"

# PythonWebScrape
PythonWebScrape_path="Python/PythonWebScrape"
cd $base_path/$PythonWebScrape_path
jupytext --to py:bare PythonWebScrape.Rmd
sed -i "" '1,4d' PythonWebScrape.py # delete lines 1-4
jupytext --to notebook PythonWebScrape.Rmd
cd ..
zip -r PythonWebScrape.zip PythonWebScrape -x "*.DS_Store"

# StataIntro
StataIntro_path="Stata/StataIntro"
cd $base_path/$StataIntro_path
jupytext --to R:bare StataIntro.Rmd  # convert to R 'bare' format option
mv StataIntro.R StataIntro.do  # change file suffix to .do
sed -i "" 's/#/*/' StataIntro.do # convert # to *
sed -i "" '1,7d' StataIntro.do # delete lines 1-7
# then change hash comments to astericks
cd ..
zip -r StataIntro.zip StataIntro -x "*.DS_Store"

# StataDataManage
StataDataManage_path="Stata/StataDataManage"
cd $base_path/$StataDataManage_path
jupytext --to R:bare StataDataManage.Rmd  # convert to R 'bare' format option
mv StataDataManage.R StataDataManage.do  # change file suffix to .do
sed -i "" 's/#/*/' StataDataManage.do # convert # to *
sed -i "" '1,7d' StataDataManage.do # delete lines 1-7
# then change hash comments to astericks
cd ..
zip -r StataDataManage.zip StataDataManage -x "*.DS_Store"

# StataModels
StataModels_path="Stata/StataModels"
cd $base_path/$StataModels_path
jupytext --to R:bare StataModels.Rmd  # convert to R 'bare' format option
mv StataModels.R StataModels.do  # change file suffix to .do
sed -i "" 's/#/*/' StataModels.do # convert # to *
sed -i "" '1,7d' StataModels.do # delete lines 1-7
cd ..
zip -r StataModels.zip StataModels -x "*.DS_Store"
cd ..

# StataGraphics
StataGraphics_path="Stata/StataGraphics"
cd $base_path/$StataGraphics_path
jupytext --to R:bare StataGraphics.Rmd  # convert to R 'bare' format option
mv StataGraphics.R StataGraphics.do  # change file suffix to .do
sed -i "" 's/#/*/' StataGraphics.do # convert # to *
sed -i "" '1,7d' StataGraphics.do # delete lines 1-7
cd ..
zip -r StataGraphics.zip StataGraphics -x "*.DS_Store"
cd ..
