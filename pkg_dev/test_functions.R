# Testing Script

# Install from git hub
devtools::install_github("Fredo-XVII/R.COVID.19") #passes personal computer install.

# Libraries
library(R.COVID.19)
library(tidyverse)

confirmed <- R.COVID.19::country_confirmed_daily()
deaths <- R.COVID.19::country_deaths_daily()

combo <- confirmed %>% left_join(deaths)
combo %>% filter(`Country/Region` == "US") %>% View()

us_co_cases <- R.COVID.19::covid19_us_co()

# tidycensus

library(tidycensus)
library(tidyverse)
library(viridis)
tarr <- get_acs(geography = "tract", variables = "B19013_001",
                state = "TX", county = "Tarrant", geometry = TRUE)
ggplot(tarr, aes(fill = estimate, color = estimate)) +
  geom_sf() +
  coord_sf(crs = 26914) +
  scale_fill_viridis(option = "magma") +
  scale_color_viridis(options = "magma")
vt <- get_acs(geography = "county", variables = "B19013_001", state = "VT")


# ESRI Open Data
## COVID19_Public_Health_Status_by_County
## source: https://coronavirus-disasterresponse.hub.arcgis.com/datasets/97792521be744711a291d10ecef33a61/data?geometry=76.921%2C-16.701%2C-109.056%2C72.161

### The Data
url_csv <- "https://opendata.arcgis.com/datasets/97792521be744711a291d10ecef33a61_0.csv"
pub_hlth_status_by_cnty <- readr::read_csv(url(url_csv))
unique(pub_hlth_status_by_cnty$notes)

pub_hlth_status_by_cnty %>% filter(state_name == "Minnesota") %>% View()
### Shape file
u_shp <- "https://opendata.arcgis.com/datasets/97792521be744711a291d10ecef33a61_0.zip"
download.file(u_shp, "pub_hlth_status_by_cnty.zip")
unzip("pub_hlth_status_by_cnty.zip")

pub_hlth_status_by_cnty_shp <- sf::st_read("COVID19_Public_Health_Emergency_Status_by_County.shp")

pub_status_cnty <- R.COVID.19::pub_hlth_status_by_cnty()

pub_status_cnty_shp <- R.COVID.19::pub_hlth_status_by_cnty_shp()

stay_orders <- R.COVID.19::finra_shelter_in_place()

