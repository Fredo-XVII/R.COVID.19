% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/global_deaths_daily.R
\name{global_deaths_daily}
\alias{global_deaths_daily}
\title{COVID-19 Global Death Counts from John Hopkins}
\usage{
global_deaths_daily()
}
\value{
A dataframe/tibble
}
\description{
This functions pulls global deaths COVID-19 data from John Hopkins
  GitHub repository downloads it and transpose it so that it is tidy.  No
  data is stored within the package, so the data should continuously update
  over time as long as the links do not change.
}
\details{
Website:

   - https://github.com/CSSEGISandData/COVID-19

   - https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv
}
\examples{
deaths <- R.COVID.19::global_deaths_daily()
head(deaths)

}
