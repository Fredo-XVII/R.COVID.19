
<!-- README.md is generated from README.Rmd. Please edit that file -->

# R.COVID.19

<!-- badges: start -->

[![R build
status](https://github.com/Fredo-XVII/R.COVID.19/workflows/R-CMD-check/badge.svg)](https://github.com/Fredo-XVII/R.COVID.19/actions)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/Fredo-XVII/R.COVID.19?branch=master&svg=true)](https://ci.appveyor.com/project/Fredo-XVII/R.COVID.19)
[![Github All
Releases](https://img.shields.io/github/downloads/Fredo-XVII/R.COVID.19/total.svg)]()
<!-- badges: end -->

The goal of R.COVID.19 is to simply aquire data for the disease COVID 19
from sources that make the data readily available. No promises are made
to the validaty of the data as their are many people at the sources
working on that. Because these functions link to the sources, the data
should update as the sources update. If data is not being generated,
please open an issue so that I can look into the broken link. The
sources for the data is listed below.

Finally, the John Hopkins data was transposed to be tidy, instead of
having dates as columns in a wide dataset. The New York Times data was
already in a tidy format. See GitPage site for information of other
functions and sources of data.

**GitPage Site:** <https://fredo-xvii.github.io/R.COVID.19/>

## Installation

You can install the released version of R.COVID.19 from
[CRAN](https://CRAN.R-project.org) with: (NOT ON CRAN)

``` r
install.packages("R.COVID.19")
```

And the development version from [GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("Fredo-XVII/R.COVID.19")
```

## Examples

**Load libraries:**

``` r
library(R.COVID.19)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(magrittr)
```

### COVID-19 data from John Hopkins University Data

  - source: [GITHUB](https://github.com/CSSEGISandData/COVID-19)

**Global COVID-19 Data:**

``` r
confirmed <- R.COVID.19::global_confirmed_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   `Province/State` = col_character(),
#>   `Country/Region` = col_character()
#> )
#> See spec(...) for full column specifications.

deaths <- R.COVID.19::global_deaths_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   `Province/State` = col_character(),
#>   `Country/Region` = col_character()
#> )
#> See spec(...) for full column specifications.

recovered <- R.COVID.19::global_recovered_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   `Province/State` = col_character(),
#>   `Country/Region` = col_character()
#> )
#> See spec(...) for full column specifications.

combo <- confirmed %>% 
  dplyr::left_join(deaths) %>%
  dplyr::left_join(recovered) %>% 
  dplyr::mutate(mortality_rate = round((.$deaths_cases / .$confirmed_cases)*100,2))
#> Joining, by = c("Province/State", "Country/Region", "Lat", "Long", "greg_d")
#> Joining, by = c("Province/State", "Country/Region", "Lat", "Long", "greg_d")

knitr::kable(combo %>% dplyr::filter(`Country/Region` == "US") %>% tail(10), format = "html") %>% 
  kableExtra::kable_styling(bootstrap_options = c("striped"))
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Province/State

</th>

<th style="text-align:left;">

Country/Region

</th>

<th style="text-align:right;">

Lat

</th>

<th style="text-align:right;">

Long

</th>

<th style="text-align:left;">

greg\_d

</th>

<th style="text-align:right;">

confirmed\_cases

</th>

<th style="text-align:right;">

deaths\_cases

</th>

<th style="text-align:right;">

recovered\_cases

</th>

<th style="text-align:right;">

mortality\_rate

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

2/24/21

</td>

<td style="text-align:right;">

28309085

</td>

<td style="text-align:right;">

506335

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.79

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

2/25/21

</td>

<td style="text-align:right;">

28386492

</td>

<td style="text-align:right;">

508673

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.79

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

2/26/21

</td>

<td style="text-align:right;">

28463190

</td>

<td style="text-align:right;">

510764

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.79

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

2/27/21

</td>

<td style="text-align:right;">

28527344

</td>

<td style="text-align:right;">

512252

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.80

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

2/28/21

</td>

<td style="text-align:right;">

28578548

</td>

<td style="text-align:right;">

513291

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.80

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

3/1/21

</td>

<td style="text-align:right;">

28637313

</td>

<td style="text-align:right;">

514810

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.80

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

3/2/21

</td>

<td style="text-align:right;">

28694071

</td>

<td style="text-align:right;">

516737

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.80

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

3/3/21

</td>

<td style="text-align:right;">

28759980

</td>

<td style="text-align:right;">

519205

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.81

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

3/4/21

</td>

<td style="text-align:right;">

28827755

</td>

<td style="text-align:right;">

521119

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.81

</td>

</tr>

<tr>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40

</td>

<td style="text-align:right;">

\-100

</td>

<td style="text-align:left;">

3/5/21

</td>

<td style="text-align:right;">

28894541

</td>

<td style="text-align:right;">

522877

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1.81

</td>

</tr>

</tbody>

</table>

<br></br>

**US COVID-19 Data with Geographic Data:**

``` r
us_confirmed <- R.COVID.19::us_geo_confirmed_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   iso2 = col_character(),
#>   iso3 = col_character(),
#>   Admin2 = col_character(),
#>   Province_State = col_character(),
#>   Country_Region = col_character(),
#>   Combined_Key = col_character()
#> )
#> See spec(...) for full column specifications.

us_deaths <- R.COVID.19::us_geo_deaths_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   iso2 = col_character(),
#>   iso3 = col_character(),
#>   Admin2 = col_character(),
#>   Province_State = col_character(),
#>   Country_Region = col_character(),
#>   Combined_Key = col_character()
#> )
#> See spec(...) for full column specifications.

combo <- us_confirmed %>% dplyr::left_join(us_deaths) %>% 
  dplyr::mutate(mortality_rate = round((.$deaths_cases / .$confirmed_cases)*100,2))
#> Joining, by = c("UID", "iso2", "iso3", "code3", "FIPS", "Admin2", "Province_State", "Country_Region", "Lat", "Long_", "Combined_Key", "greg_d")

knitr::kable(combo %>% 
               dplyr::filter(Province_State == "New York", Admin2 == "New York") %>% 
               tail(5), format = "html") %>% 
  kableExtra::kable_styling(bootstrap_options = c("striped"))
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:right;">

UID

</th>

<th style="text-align:left;">

iso2

</th>

<th style="text-align:left;">

iso3

</th>

<th style="text-align:right;">

code3

</th>

<th style="text-align:right;">

FIPS

</th>

<th style="text-align:left;">

Admin2

</th>

<th style="text-align:left;">

Province\_State

</th>

<th style="text-align:left;">

Country\_Region

</th>

<th style="text-align:right;">

Lat

</th>

<th style="text-align:right;">

Long\_

</th>

<th style="text-align:left;">

Combined\_Key

</th>

<th style="text-align:left;">

greg\_d

</th>

<th style="text-align:right;">

confirmed\_cases

</th>

<th style="text-align:right;">

Population

</th>

<th style="text-align:right;">

deaths\_cases

</th>

<th style="text-align:right;">

mortality\_rate

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

84036061

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:left;">

USA

</td>

<td style="text-align:right;">

840

</td>

<td style="text-align:right;">

36061

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40.76727

</td>

<td style="text-align:right;">

\-73.97153

</td>

<td style="text-align:left;">

New York, New York, US

</td>

<td style="text-align:left;">

3/1/21

</td>

<td style="text-align:right;">

103922

</td>

<td style="text-align:right;">

1628706

</td>

<td style="text-align:right;">

3906

</td>

<td style="text-align:right;">

3.76

</td>

</tr>

<tr>

<td style="text-align:right;">

84036061

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:left;">

USA

</td>

<td style="text-align:right;">

840

</td>

<td style="text-align:right;">

36061

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40.76727

</td>

<td style="text-align:right;">

\-73.97153

</td>

<td style="text-align:left;">

New York, New York, US

</td>

<td style="text-align:left;">

3/2/21

</td>

<td style="text-align:right;">

104444

</td>

<td style="text-align:right;">

1628706

</td>

<td style="text-align:right;">

3917

</td>

<td style="text-align:right;">

3.75

</td>

</tr>

<tr>

<td style="text-align:right;">

84036061

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:left;">

USA

</td>

<td style="text-align:right;">

840

</td>

<td style="text-align:right;">

36061

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40.76727

</td>

<td style="text-align:right;">

\-73.97153

</td>

<td style="text-align:left;">

New York, New York, US

</td>

<td style="text-align:left;">

3/3/21

</td>

<td style="text-align:right;">

104874

</td>

<td style="text-align:right;">

1628706

</td>

<td style="text-align:right;">

3940

</td>

<td style="text-align:right;">

3.76

</td>

</tr>

<tr>

<td style="text-align:right;">

84036061

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:left;">

USA

</td>

<td style="text-align:right;">

840

</td>

<td style="text-align:right;">

36061

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40.76727

</td>

<td style="text-align:right;">

\-73.97153

</td>

<td style="text-align:left;">

New York, New York, US

</td>

<td style="text-align:left;">

3/4/21

</td>

<td style="text-align:right;">

105491

</td>

<td style="text-align:right;">

1628706

</td>

<td style="text-align:right;">

3954

</td>

<td style="text-align:right;">

3.75

</td>

</tr>

<tr>

<td style="text-align:right;">

84036061

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:left;">

USA

</td>

<td style="text-align:right;">

840

</td>

<td style="text-align:right;">

36061

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

US

</td>

<td style="text-align:right;">

40.76727

</td>

<td style="text-align:right;">

\-73.97153

</td>

<td style="text-align:left;">

New York, New York, US

</td>

<td style="text-align:left;">

3/5/21

</td>

<td style="text-align:right;">

106144

</td>

<td style="text-align:right;">

1628706

</td>

<td style="text-align:right;">

3964

</td>

<td style="text-align:right;">

3.73

</td>

</tr>

</tbody>

</table>

<br></br>

-----

### COVID-19 data from The New York Times, based on reports from state and local health agencies.

  - source: [GITHUB](https://github.com/nytimes/covid-19-data)

**US COVID-19 County Data with Geographic Data:**

``` r
us_co_cases <- R.COVID.19::us_counties_daily() %>% 
  dplyr::mutate(mortality_rate = round((.$deaths / .$cases)*100,2))
#> Parsed with column specification:
#> cols(
#>   date = col_date(format = ""),
#>   county = col_character(),
#>   state = col_character(),
#>   fips = col_character(),
#>   cases = col_double(),
#>   deaths = col_double()
#> )
knitr::kable(us_co_cases %>% dplyr::filter(state == "New York") %>% tail(10), format = "html") %>% 
  kableExtra::kable_styling(bootstrap_options = "striped")
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

date

</th>

<th style="text-align:left;">

county

</th>

<th style="text-align:left;">

state

</th>

<th style="text-align:left;">

fips

</th>

<th style="text-align:right;">

cases

</th>

<th style="text-align:right;">

deaths

</th>

<th style="text-align:right;">

mortality\_rate

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

2021-02-24

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1011

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.57

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-25

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1011

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.57

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-26

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1011

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.57

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-27

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1014

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.56

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-28

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1014

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.56

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-01

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1014

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.56

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-02

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1015

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.56

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-03

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1015

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.56

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-04

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1017

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.56

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-05

</td>

<td style="text-align:left;">

Yates

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36123

</td>

<td style="text-align:right;">

1022

</td>

<td style="text-align:right;">

26

</td>

<td style="text-align:right;">

2.54

</td>

</tr>

</tbody>

</table>

<br></br>

**US COVID-19 State Data with Geographic Data:**

``` r
us_st_cases <- R.COVID.19::us_states_daily() %>% 
  dplyr::mutate(mortality_rate = round((.$deaths / .$cases)*100,2))
#> Parsed with column specification:
#> cols(
#>   date = col_date(format = ""),
#>   state = col_character(),
#>   fips = col_character(),
#>   cases = col_double(),
#>   deaths = col_double()
#> )
knitr::kable(us_st_cases %>% dplyr::filter(state == "New York") %>% tail(10), format = "html") %>% 
  kableExtra::kable_styling(bootstrap_options = "striped")
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

date

</th>

<th style="text-align:left;">

state

</th>

<th style="text-align:left;">

fips

</th>

<th style="text-align:right;">

cases

</th>

<th style="text-align:right;">

deaths

</th>

<th style="text-align:right;">

mortality\_rate

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

2021-02-24

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1611288

</td>

<td style="text-align:right;">

46680

</td>

<td style="text-align:right;">

2.90

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-25

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1620181

</td>

<td style="text-align:right;">

46790

</td>

<td style="text-align:right;">

2.89

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-26

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1628255

</td>

<td style="text-align:right;">

46914

</td>

<td style="text-align:right;">

2.88

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-27

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1636297

</td>

<td style="text-align:right;">

47025

</td>

<td style="text-align:right;">

2.87

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-02-28

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1644124

</td>

<td style="text-align:right;">

47143

</td>

<td style="text-align:right;">

2.87

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-01

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1650560

</td>

<td style="text-align:right;">

47247

</td>

<td style="text-align:right;">

2.86

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-02

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1656941

</td>

<td style="text-align:right;">

47345

</td>

<td style="text-align:right;">

2.86

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-03

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1663505

</td>

<td style="text-align:right;">

47464

</td>

<td style="text-align:right;">

2.85

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-04

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1670973

</td>

<td style="text-align:right;">

47565

</td>

<td style="text-align:right;">

2.85

</td>

</tr>

<tr>

<td style="text-align:left;">

2021-03-05

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

1679124

</td>

<td style="text-align:right;">

47672

</td>

<td style="text-align:right;">

2.84

</td>

</tr>

</tbody>

</table>
