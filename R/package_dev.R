#0 Load essential packages 
if(!require(xfun)) install.packages("xfun")
pkgs <- c(
  "devtools", "usethis", "roxygen2", "sinew", "rmarkdown", "available"
)
xfun::pkg_attach2(pkgs)


#1 Pick a name
pkg <- "mocdata"
author <- "Piyayut Chitchumnong"
available(pkg)
edit_r_profile()


#2 One time modification
setwd("../..") #getwd()
create_package(pkg)
setwd(pkg)

## use git
use_git()
use_github()

## pick a license
use_mit_license(author)
use_gpl3_license()
use_apl2_license()
use_cc0_license()

## initial readme file
use_readme_rmd()
use_readme_md()

## continuous integration
use_travis()
use_appveyor()
use_coverage()

## test
use_testthat()

## data
use_data_raw()

## import requirements
use_pipe()
use_pkgdown()

# check setup
proj_sitrep()


#3 Write R functions
use_r("get_moc_price")
use_package("dplyr")

load_all()

makeOxyFile()
document()

check()

use_vignette()
use_version()


#4 Manage data
## put raw data on data-raw folder
## write R script in data-raw


#5 build website for sharing
build_site()

