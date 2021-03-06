% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pub_hlth_status_by_cnty_shp.R
\name{pub_hlth_status_by_cnty_shp}
\alias{pub_hlth_status_by_cnty_shp}
\title{COVID-19 Public Health Status by County shapefiles from ESRI - DEFUNCT}
\usage{
pub_hlth_status_by_cnty_shp()
}
\value{
A dataframe/tibble.  This functions has side effects in that it downloads
shapefiles corresponding to the counties to the current working directory.
}
\description{
This functions pulls the public health status by county in the US as of the
  current date with the shapefiles, which are saved to the current working
  directory.  The data comes from ESRI open data website.  The data is 1 row
  per county.
}
\details{
Website: https://coronavirus-disasterresponse.hub.arcgis.com/datasets/97792521be744711a291d10ecef33a61/data?geometry=76.921%2C-16.701%2C-109.056%2C72.161
}
