# Functions Roxygen format
#' @title COVID-19 US Death Counts from John Hopkins
#'
#' @description
#'   This functions pulls US deaths COVID-19 data from John Hopkins
#'   GitHub repository downloads it and transpose it so that it is tidy.  No
#'   data is stored within the package, so the data should continuously update
#'   over time as long as the links do not change.
#'
#' @details
#'   Website: https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv
#'
#' @return A dataframe/tibble
#'
#' @examples
#' deaths_daily <- R.COVID.19::us_geo_deaths_daily()
#' head(deaths_daily)
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


us_geo_deaths_daily <- function() {
  # Get death cases
  url_deaths <- url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv")
  covid19_deaths_wide <- readr::read_csv(url_deaths)

  covid19_df <- covid19_deaths_wide %>%
    tidyr::pivot_longer(
      cols = .data$`1/22/20`:dplyr::last(colnames(covid19_deaths_wide)),
      names_to = "greg_d",
      values_to = "deaths_cases"
    )

  covid19_df

}
