#!/bin/sh

# Compiles bookdown in HTML, pdf, and epub form.
# All R packages needed to be listed in the separate DESCRIPTION file to be installed.

set -ev

#cp -rp index.Rmd other_workshops/DataScienceTools/DataScienceTools.Rmd R/Rinstall/Rinstall.Rmd R/Rintro/Rintro.Rmd R/Rmodels/Rmodels.Rmd R/Rgraphics/Rgraphics.Rmd R/RDataWrangling/RDataWrangling.Rmd Python/PythonInstall/PythonInstall.Rmd Python/PythonIntro/PythonIntro.Rmd Python/PythonWebScrape/PythonWebScrape.Rmd Stata/StataIntro/StataIntro.Rmd Stata/StataDatMan/StataDatMan.Rmd Stata/StataModGraph/StataModGraph.Rmd .

# remove docs and _bookdown_files directories before re-compiling
rm -rf docs _bookdown_files

# remove previous .zip, .r, .py, .do, and .ipynb files throughout directory tree
find ./ -type f \( -iname \*.zip -o -iname \*.py \) -delete  #  -o -iname \*.r     #  -o -iname \*.do     # -o -iname \*.ipynb

Rscript -e "bookdown::render_book('rmd_files', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('rmd_files', 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('rmd_files', 'bookdown::epub_book')"

# copy .nojekyll into docs directory
cp .nojekyll docs/

# remove temp .rds and .log files
rm -rf *.rds *.log *.RData

# convert .Rmd files to .r, .py, .do, and .ipynb formats
chmod a+x build_scripts/_convert_files.sh
source build_scripts/_convert_files.sh  # this converts the files
