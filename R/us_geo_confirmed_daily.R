# Functions Roxygen format
#' @title COVID-19 US Confirmed Counts from John Hopkins
#'
#' @description
#'   This functions pulls US confirmed COVID-19 data from John Hopkins
#'   GitHub repository downloads it and transpose it so that it is tidy.  No
#'   data is stored within the package, so the data should continuously update
#'   over time as long as the links do not change.
#'
#' @return A datarame/tibble
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::us_geo_confirmed_daily()
#' }
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


us_geo_confirmed_daily <- function() {
  # Get confirmed cases
  url_confirmed <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
  covid19_confirm_wide <- readr::read_csv(url(url_confirmed))

  # From wide to long
  covid19_df <- covid19_confirm_wide %>%
    tidyr::pivot_longer(
      cols = .data$`1/22/20`:dplyr::last(colnames(covid19_confirm_wide)),
      names_to = "greg_d",
      values_to = "confirmed_cases"
    )

  return(invisible(covid19_df))
}
