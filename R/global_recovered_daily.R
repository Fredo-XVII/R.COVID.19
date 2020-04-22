# Functions Roxygen format
#' @title COVID-19 Global Recovered Counts from John Hopkins
#'
#' @description
#'   This functions pulls global recovered COVID-19 data from John Hopkins
#'   GitHub repository downloads it and transpose it so that it is tidy.  No
#'   data is stored within the package, so the data should continuously update
#'   over time as long as the links do not change.
#'
#' @details
#'   Website:
#'    - https://github.com/CSSEGISandData/COVID-19
#'    - https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv
#'
#' @return A dataframe/tibble
#'
#' @examples
#' recovered <- R.COVID.19::global_recovered_daily()
#' head(recovered)
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


global_recovered_daily <- function() {
  # Get confirmed cases
  url_confirmed <- url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")
  covid19_confirm_wide <- readr::read_csv(url_confirmed)

  # From wide to long
  covid19_df <- covid19_confirm_wide %>%
    tidyr::pivot_longer(
      cols = .data$`1/22/20`:dplyr::last(colnames(covid19_confirm_wide)),
      names_to = "greg_d",
      values_to = "recovered_cases"
    )

  return(invisible(covid19_df))
}
