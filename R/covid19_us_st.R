# Functions Roxygen format
#' @title COVID19 Confirmed Counts US states
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
  url_states <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"
  covid19_us_st <- readr::read_csv(url(url_states)) %>%
    dplyr::arrange(.data$state,.data$date)

  return(invisible(covid19_us_st))
}
