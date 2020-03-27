# Functions Roxygen format
#' @title COVID19 Confirmed Counts
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
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer last_col
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


covid19_confirmed <- function() {
# Get confirmed cases
url_confirmed <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
covid19_confirm_wide <- readr::read_csv(url(url_confirmed))

# From wide to long
covid19_confirmed <- covid19_confirm_wide %>%
  tidyr::pivot_longer(
    cols = .data$`1/22/20`:tidyr::last_col(colnames(covid19_confirm_wide)),
    names_to = "greg_d",
    values_to = "confirmed_cases"
  )

 return(invisible(covid19_confirmed))
}
