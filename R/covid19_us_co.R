# Functions Roxygen format
#' @title COVID19 Counts for US Counties
#'
#' @description This functions pulls death COVID-19 confirmed and death data
#'   for US counties from The New York Times GitHub repository downloads it.
#'   No data is stored within the package, so the data should continuously
#'   update over time as long as the links do not change.
#'
#' @return A datarame/tibble
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::covid19_us_co()
#' }
#'
#' @importFrom readr read_csv
#' @importFrom dplyr arrange
#' @importFrom  rlang .data
#'
#' @export


covid19_us_co <- function() {
  # Get confirmed cases
  url_counties <- "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
  covid19_us_co <- readr::read_csv(url(url_counties)) %>%
    dplyr::arrange(.data$state,.data$county,.data$date)

  return(invisible(covid19_us_co))
}
