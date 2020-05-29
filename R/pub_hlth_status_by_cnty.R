# Functions Roxygen format
#' @title COVID-19 Public Health Status by County from ESRI - DEFUNCT
#'
#' @description
#'   This functions pulls the public health status by county in the US as of the
#'   current date.  The data comes from ESRI open data website.  The data is 1 row per
#'   county.
#'
#' @details
#'   Website: https://coronavirus-disasterresponse.hub.arcgis.com/datasets/97792521be744711a291d10ecef33a61/data?geometry=76.921%2C-16.701%2C-109.056%2C72.161
#'
#' @return A dataframe/tibble
#'
#>' @examples
#>' pub_status_cnty <- R.COVID.19::pub_hlth_status_by_cnty()
#>' head(pub_status_cnty)
#'
#>' @importFrom  magrittr %>%
#>' @importFrom  readr read_csv
#'
#' @export


pub_hlth_status_by_cnty <- function() {
   .Defunct(new = "None", package="None",
            msg = "This link is no longer working, now is removed")
  # Get data
  # url_csv <- url("https://opendata.arcgis.com/datasets/97792521be744711a291d10ecef33a61_0.csv")
  # csv_df <- readr::read_csv(url_csv)
  # return(invisible(csv_df))
}
