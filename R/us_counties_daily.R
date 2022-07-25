# Functions Roxygen format
#' @title COVID-19 Counts for US Counties from The New York Times
#'
#' @description This functions pulls death COVID-19 confirmed and death data
#'   for US counties from The New York Times GitHub repository downloads it.
#'   No data is stored within the package, so the data should continuously
#'   update over time as long as the links do not change.
#'
#' @details
#'   Website:
#'
#'     - https://github.com/nytimes/covid-19-data
#'
#'     - https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv
#'
#'     - https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-2020.csv
#'
#' @return A dataframe/tibble
#'
#' @examples
#' confirmed_daily <- R.COVID.19::us_counties_daily()
#' head(confirmed_daily)
#'
#' @importFrom readr read_csv
#' @importFrom dplyr arrange
#' @importFrom  rlang .data
#' @importFrom  lubridate year
#'
#' @export

us_counties_daily <- function() {

  # Set up URL over years
  current_year <- lubridate::year(Sys.Date())
  years <- seq(2020, current_year,1)
  url_vector <- sprintf("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-%s.csv", years)

  # Get confirmed cases
  covid_df <- data.frame()

  for (i in seq_along(url_vector)) {
    message(sprintf("Start Data Pull for Year: %s", years[i]))
    catch_url <- url(url_vector[i]) # Capture url for the year.
    covid_df_base <- readr::read_csv(catch_url)

    covid_df <- rbind(covid_df,covid_df_base)
  }

  # Return Sorted Data
  covid_df %>%
    dplyr::group_by(.data$state,.data$county,.data$date)%>%
    dplyr::arrange(.data$state,.data$county,.data$date, .by_group = TRUE)
}
