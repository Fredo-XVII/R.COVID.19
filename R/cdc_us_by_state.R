# Functions Roxygen format
#' @title Vaccinations for COVID-19 Counts for US States from Center for Disease Control (CDC)
#'
#' @description This functions pulls vaccine data for US states from the CDC.
#'   No data is stored within the package, so the data should continuously
#'   update over time as long as the links do not change.
#'
#' @details
#'   Website:
#'
#'     - CDC COVID Tracker: https://covid.cdc.gov/covid-data-tracker/#datatracker-home
#'
#'     - Data: https://data.cdc.gov/api/views/rh2h-3yt2/rows.csv?accessType=DOWNLOAD
#'
#' @return A dataframe/tibble
#'
#' @examples
#' vac_by_states <- R.COVID.19::cdc_vac_us_by_state()
#' head(vac_by_states)
#'
#' @importFrom vroom vroom
#' @importFrom dplyr arrange mutate select rename
#' @importFrom rlang .data
#'
#' @export


cdc_vac_us_by_state <- function() {
  # Get Vaccines
  vac_url <- "https://data.cdc.gov/api/views/rh2h-3yt2/rows.csv?accessType=DOWNLOAD"
  vaccine_data <- vroom::vroom(file = vac_url)

  vaccine_final <- vaccine_data %>%
    dplyr::mutate(Date = as.Date(.$Date, format = "%m/%d/%Y")) %>%
    dplyr::rename(State = .data$Location) %>%
    dplyr::arrange(.data$State, .data$Date)

  vaccine_final
}
