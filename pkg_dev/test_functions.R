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



