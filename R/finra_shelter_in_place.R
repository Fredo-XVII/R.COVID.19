# Functions Roxygen format
#' @title FINRA Shelter in Place Dates
#'
#' @description
#'   This functions pulls dates for shelter in place order by states with notes
#'   and start date and end dates, as well as, extention dates.
#'
#' @return A datarame/tibble
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::finra_shelter_in_place()
#' }
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


finra_shelter_in_place <- function() {
  # Get confirmed cases
  url_confirmed <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
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
