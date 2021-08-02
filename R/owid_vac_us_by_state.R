# Functions Roxygen format
#' @title Vaccinations for COVID-19 Counts for US States from Our World in Data
#'
#' @description This functions pulls COVID-19 vaccine data for US states from
#'   Our World in Data website GitHub repository and downloads it.
#'   No data is stored within the package, so the data should continuously
#'   update over time as long as the links do not change.
#'
#' @details
#'   Website:
#'
#'     - https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations
#'
#'     - https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/us_state_vaccinations.csv
#'
#' @return A dataframe/tibble
#'
#' @examples
#' confirmed_st_daily <- R.COVID.19::owid_vac_us_by_state()
#' head(confirmed_st_daily)
#'
#' @importFrom readr read_csv
#' @importFrom dplyr arrange
#' @importFrom  rlang .data
#'
#' @export


owid_vac_us_by_state <- function() {
  # Get confirmed cases
  url_states <- url("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/us_state_vaccinations.csv")
  vaccine_data <- readr::read_csv(url_states) %>%
    dplyr::arrange(.data$location,.data$date)

  vaccine_data
}
