# Testing Script

# Install from git hub
devtools::install_github("Fredo-XVII/R.COVID.19") #passes personal computer install.

# Libraries
library(R.COVID.19)
library(tidyverse)

confirmed <- R.COVID.19::covid19_confirmed()
deaths <- R.COVID.19::covid19_deaths()

combo <- confirmed %>% left_join(deaths)
combo %>% filter(`Country/Region` == "US") %>% View()

us_co_cases <- R.COVID.19::covid19_us_co()
