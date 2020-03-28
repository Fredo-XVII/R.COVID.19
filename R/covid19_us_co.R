# Functions Roxygen format
#' @title COVID19 Confirmed Counts US counties
#'
#' @description confirmed counts
#'
#' @details grabs the wide makes it long
#'
#>' @param
#'
#>' @return
#'
#>' @examples
#'
#' @importFrom readr read_csv
#' @importFrom dplyr arrange
#' @importFrom  rlang .data
#'
#' @export


covid19_us_co <- function() {
  # Get confirmed cases
  url_confirmed <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
  covid19_us_co <- readr::read_csv(url(url_confirmed)) %>%
    dplyr::arrange(.data$state,.data$county,.data$date)

  return(invisible(covid19_us_co))
}
