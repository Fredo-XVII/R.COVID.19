#>' Functions Roxygen format
#' @title  COVID-19 US Testing Counts from CovidTracking.com
#'
#' @description
#'   This functions pulls US testing counts of COVID-19 data from covidtracking.com.
#'   The data is aggregated by FIPS and data, and is tidy so that it is more user friendly.
#'   No data is stored within the package, so the data should continuously update over time as
#'   long as the links do not change.
#'
#' @details
#'   Note: As of March 7, 2021, this data will not be updated.
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
#' \dontrun{
#' tests_daily <- R.COVID.19::covtrck_states_testing()
#' head(tests_daily)
#' }
#'
#' @importFrom magrittr %>%
#' @importFrom tsibble as_tsibble difference
#' @import dplyr
#' @importFrom readr read_csv
#' @importFrom rlang .data
#' @importFrom tidyr replace_na
#' @importFrom utils globalVariables
#'
#' @export

covtrck_states_testing <- function() {

  # Download testing data
  test_url <- url("https://covidtracking.com/api/v1/states/daily.csv")
  test_df <- readr::read_csv(test_url)

  # Clean the data for users
  deprecated_cols <- c("total","posNeg")
  test_df <- test_df %>% dplyr::select(-dplyr::all_of(deprecated_cols))

  # Convert to tsibble
  test_df <- test_df %>%
    dplyr::filter(trimws(.data$date) <= '20210307') %>%
    dplyr::mutate(greg_d = lubridate::ymd(trimws(.data$date))) %>%
    tsibble::as_tsibble(key = .data$fips, index = .data$greg_d)

  # Create new variables and re-align variables
  test_df <- test_df %>%
    dplyr::group_by(.data$fips) %>%
    dplyr::mutate_if(is.numeric, tidyr::replace_na, 0) %>%
    dplyr::mutate(pendingIncrease = tsibble::difference(.data$pending),
                  recoveredIncrease = tsibble::difference(.data$recovered),
                  total_tests = .data$positive + .data$negative + .data$pending,
                  total_tests_increase = tsibble::difference(.data$total_tests)) %>%
    dplyr::mutate_if(is.numeric, tidyr::replace_na, 0) %>%
    dplyr::select(
      # Dates & Demo
      .data$greg_d,.data$date,.data$fips,.data$state,
      # Total Tests
      .data$total_tests,.data$positive,.data$negative,.data$pending,.data$total_tests_increase,.data$pendingIncrease,
      # Total Tests with Results
      .data$positiveIncrease,.data$negativeIncrease,.data$totalTestResults,.data$totalTestResultsIncrease,
      # Death & Hospitalized
      .data$recovered, .data$recoveredIncrease, .data$death, .data$deathIncrease, .data$hospitalized, .data$hospitalizedIncrease,
      # everything else
      dplyr::everything())

  test_df

}

globalVariables(c("."))

