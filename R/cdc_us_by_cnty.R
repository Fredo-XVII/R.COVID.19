# Functions Roxygen format
#' @title Vaccinations for COVID-19 Counts for US Counties from Center for Disease Control (CDC)
#'
#' @description This functions pulls vaccine data for US counties from the CDC.
#'   No data is stored within the package, so the data should continuously
#'   update over time as long as the links do not change.
#'
#' @details
#'   Website:
#'
#'     - CDC COVID Tracker: https://covid.cdc.gov/covid-data-tracker/#datatracker-home
#'
#'     - Data: https://data.cdc.gov/api/views/8xkx-amqh/rows.csv?accessType=DOWNLOAD
#'
#' @return A dataframe/tibble
#'
#' @examples
#' vac_by_cnty <- R.COVID.19::cdc_vac_us_by_cnty()
#' head(vac_by_cnty)
#'
#' @importFrom vroom vroom
#' @importFrom dplyr arrange mutate select
#' @importFrom rlang .data
#'
#' @export


cdc_vac_us_by_cnty <- function() {
  # Get Vaccines
  vac_url <- "https://data.cdc.gov/api/views/8xkx-amqh/rows.csv?accessType=DOWNLOAD"
  vaccine_data <- vroom::vroom(file = vac_url)

  vaccine_final <- vaccine_data %>%
    dplyr::mutate(Date = as.Date(.$Date, format = "%m/%d/%Y")) %>%
    dplyr::arrange(.data$Recip_State, .data$Recip_County, .data$Date)

  vaccine_final
}
