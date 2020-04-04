# Functions Roxygen format
#' @title COVID-19 Country Death Counts
#'
#' @description This functions pulls death COVID-19 data from John Hopkins
#'   GitHub repository downloads it and transpose it so that it is tidy.  No
#'   data is stored within the package, so the data should continuously update
#'   over time as long as the links do not change.
#'
#' @return A datarame/tibble
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::country_deaths_daily()
#' }
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


country_deaths_daily <- function() {
# Get death cases
url_deaths <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
covid19_deaths_wide <- readr::read_csv(url(url_deaths))

covid19_df <- covid19_deaths_wide %>%
  tidyr::pivot_longer(
    cols = .data$`1/22/20`:dplyr::last(colnames(covid19_deaths_wide)),
    names_to = "greg_d",
    values_to = "deaths_cases"
  )

  return(invisible(covid19_df))

}
