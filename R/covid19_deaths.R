# Functions Roxygen format
#' @title COVID19 Death Counts
#'
#' @description death counts
#'
#' @details grabs the wide makes it long
#'
#> @param
#'
#>' @return
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::covid19_deaths()
#' }
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


covid19_deaths <- function() {
# Get death cases
url_deaths <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
covid19_deaths_wide <- readr::read_csv(url(url_deaths))

covid19_deaths <- covid19_deaths_wide %>%
  tidyr::pivot_longer(
    cols = .data$`1/22/20`:dplyr::last(colnames(covid19_deaths_wide)),
    names_to = "greg_d",
    values_to = "deaths_cases"
  )

  return(invisible(covid19_deaths))

}
