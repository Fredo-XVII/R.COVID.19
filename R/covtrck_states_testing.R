# Functions Roxygen format
#' @title COVID-19 US Testing Counts from CovidTracking.com
#'
#' @description
#'   This functions pulls US testing counts of COVID-19 data from covidtracking.com.
#'   The data is tidyed so that it is more user friendly.  No data is stored
#'   within the package, so the data should continuously update over time as
#'   long as the links do not change.
#'
#' @details
#'   Website: https://covidtracking.com/api
#'
#'   Deprecated fields
#'   The following fields are deprecated and are no longer being updated with new data.
#'
#'   /api/v1/states/current.json:
#'
#'   positiveScore
#'   negativeScore
#'   negativeRegularScore
#'   commercialScore
#'   score
#'   grade - Use dataQualityGrade instead
#'   total
#'
#'   /api/v1/us/current.json
#'
#'   posNeg
#'   total
#'
#' @return A tsibble/dataframe/tibble
#'
#' @examples
#' confirmed_daily <- R.COVID.19::covtrck_states_testing()
#' head(covtrck_states_testing)
#'
#' @importFrom  magrittr %>%
#' @importFrom  tsibble as_tsibble difference
#' @import  dplyr
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export

covtrck_states_testing <- function() {
  # Download testing data
  test_url <- url("https://covidtracking.com/api/v1/states/daily.csv")
  test_df <- readr::read_csv(test_url)

  # Clean the data for users
  deprecated_cols <- c("total","posNeg")
  test_df <- test_df %>% dplyr::select(-deprecated_cols)

  # Convert to tsibble
  test_df <- test_df %>%
    dplyr::mutate(greg_d = lubridate::ymd(.data$date)) %>%
    tsibble::as_tsibble(key = state, index = greg_d)

  test_df <- test_df %>%
    replace(is.na(.), 0) %>%
    dplyr::mutate(pendingIncrease = tsibble::difference(pending),
                  recoveredIncrease = tsibble::difference(recovered),
                  total_tests = .data$positive + .data$negative + .data$pending,
                  total_tests_increase = tsibble::difference(total_tests)) %>%
    dplyr::select(
      # Dates & Demo
      greg_d,date,fips,state,
      # Total Tests
      total_tests,positive,negative,pending,total_tests_increase,pendingIncrease,
      # Total Tests with Results
      positiveIncrease,negativeIncrease,totalTestResults,totalTestResultsIncrease,
      # Death & Hospitalized
      recovered, recoveredIncrease, death, deathIncrease, hospitalized, hospitalizedIncrease,
      # everything else
      dplyr::everything())

  return(invisible(test_df))

}

