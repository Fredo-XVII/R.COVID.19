# Functions Roxygen format
#' @title COVID-19 Counts for US States from The New York Times
#'
#' @description This functions pulls death COVID-19 confirmed and death data
#'   for US states from The New York Times GitHub repository downloads it.
#'   No data is stored within the package, so the data should continuously
#'   update over time as long as the links do not change.
#'
#' @return A datarame/tibble
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::us_states_daily()
#' }
#'
#' @importFrom readr read_csv
#' @importFrom dplyr arrange
#' @importFrom  rlang .data
#'
#' @export


us_states_daily <- function() {
  # Get confirmed cases
  url_states <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"
  covid_data <- readr::read_csv(url(url_states)) %>%
    dplyr::arrange(.data$state,.data$date)

  return(invisible(covid_data))
}
