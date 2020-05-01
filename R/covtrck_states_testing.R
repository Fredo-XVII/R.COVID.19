# Functions Roxygen format
#' @title COVID-19 US Testing Counts from CovidTracking.com
#'
#' @description
#'   This functions pulls US confirmed COVID-19 data from John Hopkins
#'   GitHub repository downloads it and transpose it so that it is tidy.  No
#'   data is stored within the package, so the data should continuously update
#'   over time as long as the links do not change.
#'
#' @details
#'   Website: https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv
#'
#' @return A dataframe/tibble
#'
#' @examples
#' confirmed_daily <- R.COVID.19::us_geo_confirmed_daily()
#' head(confirmed_daily)
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export
