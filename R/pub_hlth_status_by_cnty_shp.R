# Functions Roxygen format
#' @title COVID-19 Public Health Status by County shapefiles from ESRI
#'
#' @description
#'   This functions pulls the public health status by county in the US as of the
#'   current date with the shapefiles, which are saved to the current working
#'   directory.  The data comes from ESRI open data website.  The data is 1 row
#'   per county.
#'
#' @details
#'   Website: https://coronavirus-disasterresponse.hub.arcgis.com/datasets/97792521be744711a291d10ecef33a61/data?geometry=76.921%2C-16.701%2C-109.056%2C72.161
#'
#' @return A dataframe/tibble.  This functions has side effects in that it downloads
#' shapefiles corresponding to the counties to the current working directory.
#'
#' @examples
#' pub_status_cnty_shp <- R.COVID.19::pub_hlth_status_by_cnty_shp()
#' head(pub_status_cnty_shp)
#'
#' @importFrom  sf st_read
#' @importFrom utils download.file unzip
#'
#'

#' @export
pub_hlth_status_by_cnty_shp <- function() {
  # Get data
  .get_shp()
  get_shp <- sf::st_read("COVID19_Public_Health_Emergency_Status_by_County.shp")
  return(invisible(get_shp))
}

.get_shp <- function(){
  u_shp <- "https://opendata.arcgis.com/datasets/97792521be744711a291d10ecef33a61_0.zip"
  utils::download.file(u_shp, "pub_hlth_status_by_cnty.zip")
  utils::unzip("pub_hlth_status_by_cnty.zip")
}



