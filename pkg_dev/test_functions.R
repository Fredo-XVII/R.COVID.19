# Testing Script
library(R.COVID.19)
library(tidyverse)

confirmed <- R.COVID.19::covid19_confirmed()
deaths <- R.COVID.19::covid19_deaths()

combo <- confirmed %>% left_join(deaths)
combo %>% filter(`Country/Region` == "US") %>% View()

