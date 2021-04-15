#0 Load essential packages 
if(!require(xfun)) install.packages("xfun")
pkgs <- c(
  "devtools", "usethis", "roxygen2", "sinew", "rmarkdown", 
  "available", "here", "fs"
)
xfun::pkg_attach2(pkgs)


#1 Pick a name
pkg <- "customdict"
author <- "Piyayut Chitchumnong"
available(pkg)
usethis::edit_r_profile()


#2 One time modification
usethis::create_package(pkg)
setwd(pkg)
here::set_here()

## use git
usethis::use_git()
usethis::use_github()

## pick a license
usethis::use_mit_license(author)
# use_gpl3_license()
# use_apl2_license()
# use_cc0_license()

## initial readme file
usethis::use_readme_rmd()
usethis::use_readme_md()

## continuous integration
usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage()

## test
usethis::use_testthat()

## data
usethis::use_data_raw()

## import requirements
usethis::use_pipe()
usethis::use_pkgdown()

# check setup
proj_sitrep()


#3 Write R functions
use_r("")
use_package("dplyr")

devtools::load_all()

sinew::makeOxyFile("path.to.R", overwrite = TRUE)
devtools::document()

devtools::check()

devtools::install()
usethis::use_vignette()
usethis::use_version()


# 4 Manage data
# # put raw data on data-raw folder
# # write R script in data-raw


# 5 build website for sharing

pkgdown::build_site()
# Metadata in _pkgdown.yml i.e.
# template:
#   params:
#     bootswatch: spacelab
#     ganalytics: 

pkgdown::build_home()
# create and update index.md or README.md

pkgdown::build_reference()
# update _pkgdown.yml
# reference:
# - title: "Connecting to Spark"
#   desc: >
#     Functions for installing Spark components and managing
#     connections to Spark
# - subtitle:
# - contents: 
#   - spark_config
#   - spark_connect

pkgdown::build_articles()
# update vignettes

pkgdown::build_news()
# update NEWS.md
