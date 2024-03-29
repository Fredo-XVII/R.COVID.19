# Package Development Script

library(devtools)
library(roxygen2)
library(usethis)
library(testthat)

# Is the pkg_name available in github

library(available)
available("R_COVID_19")

# Create Package, versioning, and documentation

#tmp <- file.path("FILEPATH", "R.COVID.19")
usethis::create_package(path = "C:\\Users\\Z001C9V\\Target\\OneDrive_Data\\OneDrive - Target Corporation\\R.COVID.19")

usethis::use_tidy_description() # add `Roxygen: list(markdown = TRUE)` to use markdown in Roxygen comments

usethis::use_tidy_versions()

usethis::use_readme_rmd()

usethis::use_news_md()


#usethis::use_git()
#usethis::use_github()

#usethis::use_mit_license("Alfredo G Marquez")
#usethis::use_gpl3_license()
#usethis::use_apl2_license()
usethis::use_cc0_license("Alfredo G Marquez")

usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage(type = c("codecov"))
covr::codecov(token = Sys.getenv("CODECOV_TOKEN"))
usethis::use_cran_badge()
#usethis::use_badge(badge_name,href,src)

# Add Packages

## Imports

usethis::use_package("magrittr", type = "Import")

usethis::use_package( "tidyr", type = "Import")

usethis::use_package( "readr", type = "Import")

usethis::use_package( "dplyr", type = "Import")

usethis::use_package( "rlang", type = "Import")

usethis::use_package( "sf", type = "Import")

usethis::use_package( "purrr", type = "Import")

usethis::use_package( "rvest", type = "Import")

usethis::use_package( "tibble", type = "Import")

usethis::use_package( "xml2", type = "Import")

usethis::use_package( "stringr", type = "Import")

usethis::use_package( "tsibble", type = "Import")

usethis::use_package( "lubridate", type = "Import")

usethis::use_package( "vroom", type = "Import")

## Suggests

usethis::use_package( "roxygen2", type = "Suggests")

usethis::use_package( "kableExtra", type = "Suggests")

usethis::use_package( "remotes", type = "Suggests") #appveyor build


# Add Functions

usethis::use_r("global_confirmed_daily") # JHU

usethis::use_r("global_deaths_daily") # JHU

usethis::use_r("global_recovered_daily") # JHU

usethis::use_r("us_geo_confirmed_daily") # JHU

usethis::use_r("us_geo_deaths_daily") # JHU

usethis::use_r("us_counties_daily") # NYT

usethis::use_r("us_states_daily") # NYT

usethis::use_r("pub_hlth_status_by_cnty") # ESRI Open Data

usethis::use_r("pub_hlth_status_by_cnty_shp") # ESRI Open Data

usethis::use_r("pub_hlth_status_by_cnty_shp") # ESRI Open Data

usethis::use_r("finra_shelter_in_place") # FINRA Shelter in Place Orders

usethis::use_r("finra_sh_in_pl_df") # FINRA Shelter in Place Orders dataframe

usethis::use_r("covtrck_states_testing") # covidtracking state testing

usethis::use_r("owid_us_by_state") # Our World in Data

usethis::use_r("owid_us_by_cnty") # Our World in Data

usethis::use_r("cdc_us_by_cnty") # Our World in Data

usethis::use_r("cdc_us_by_state") # Our World in Data

#usethis::use_data_raw()
usethis::use_data(finra_sh_in_pl_df) # finra_sh_in_pl_df <- R.COVID.19::finra_shelter_in_place()

# After adding roxygen2 params to function in R folder

roxygen2::roxygenise()

devtools::load_all()

# Build Tests

usethis::use_testthat()
usethis::use_test("file_name")

# Build Vignettes - use package name for pkgdown build
usethis::use_vignette("pkg_name")

# Spell Check

usethis::use_spell_check()

# Update Version
usethis::use_version()

# Build pkgdown site
pkgdown::build_site()

# Buildignore: Add directory
usethis::use_build_ignore("docs")
usethis::use_build_ignore(".Rhistory")
usethis::use_build_ignore("pkg_dev")

# CRAN
usethis::use_cran_comments()
devtools::check_win_release() # checks for the current version of R.
devtools::check_win_devel() # checks for the development version of R.
devtools::submit_cran()
# if accepted, need to tag

# Functions Roxygen format
#' @title
#'
#' @description
#'
#' @details
#'
#' @param
#'
#' @return
#'
#' @examples
#'
#' @export
