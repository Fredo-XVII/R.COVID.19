
<!-- README.md is generated from README.Rmd. Please edit that file -->

# R.COVID.19

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Fredo-XVII/R.COVID.19.svg?branch=master)](https://travis-ci.org/Fredo-XVII/R.COVID.19)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/Fredo-XVII/R.COVID.19?branch=master&svg=true)](https://ci.appveyor.com/project/Fredo-XVII/R.COVID.19)
[![Codecov test
coverage](https://codecov.io/gh/Fredo-XVII/R.COVID.19/branch/master/graph/badge.svg)](https://codecov.io/gh/Fredo-XVII/R.COVID.19?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/R.COVID.19)](https://CRAN.R-project.org/package=R.COVID.19)
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
already in a tidy format. See package site for information of other
functions and sources of data.

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/12/20

</td>

<td style="text-align:right;">

555313

</td>

<td style="text-align:right;">

22019

</td>

<td style="text-align:right;">

32988

</td>

<td style="text-align:right;">

3.97

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/13/20

</td>

<td style="text-align:right;">

580619

</td>

<td style="text-align:right;">

23528

</td>

<td style="text-align:right;">

43482

</td>

<td style="text-align:right;">

4.05

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/14/20

</td>

<td style="text-align:right;">

607670

</td>

<td style="text-align:right;">

25831

</td>

<td style="text-align:right;">

47763

</td>

<td style="text-align:right;">

4.25

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/15/20

</td>

<td style="text-align:right;">

636350

</td>

<td style="text-align:right;">

28325

</td>

<td style="text-align:right;">

52096

</td>

<td style="text-align:right;">

4.45

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/16/20

</td>

<td style="text-align:right;">

667592

</td>

<td style="text-align:right;">

32916

</td>

<td style="text-align:right;">

54703

</td>

<td style="text-align:right;">

4.93

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/17/20

</td>

<td style="text-align:right;">

699706

</td>

<td style="text-align:right;">

36773

</td>

<td style="text-align:right;">

58545

</td>

<td style="text-align:right;">

5.26

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/18/20

</td>

<td style="text-align:right;">

732197

</td>

<td style="text-align:right;">

38664

</td>

<td style="text-align:right;">

64840

</td>

<td style="text-align:right;">

5.28

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/19/20

</td>

<td style="text-align:right;">

759086

</td>

<td style="text-align:right;">

40661

</td>

<td style="text-align:right;">

70337

</td>

<td style="text-align:right;">

5.36

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/20/20

</td>

<td style="text-align:right;">

784326

</td>

<td style="text-align:right;">

42094

</td>

<td style="text-align:right;">

72329

</td>

<td style="text-align:right;">

5.37

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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

4/21/20

</td>

<td style="text-align:right;">

823786

</td>

<td style="text-align:right;">

44845

</td>

<td style="text-align:right;">

75204

</td>

<td style="text-align:right;">

5.44

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

New York City, New York, US

</td>

<td style="text-align:left;">

4/17/20

</td>

<td style="text-align:right;">

127352

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

13202

</td>

<td style="text-align:right;">

10.37

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

New York City, New York, US

</td>

<td style="text-align:left;">

4/18/20

</td>

<td style="text-align:right;">

135572

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

13202

</td>

<td style="text-align:right;">

9.74

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

New York City, New York, US

</td>

<td style="text-align:left;">

4/19/20

</td>

<td style="text-align:right;">

138700

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

14451

</td>

<td style="text-align:right;">

10.42

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

New York City, New York, US

</td>

<td style="text-align:left;">

4/20/20

</td>

<td style="text-align:right;">

141235

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

14604

</td>

<td style="text-align:right;">

10.34

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

New York City, New York, US

</td>

<td style="text-align:left;">

4/21/20

</td>

<td style="text-align:right;">

144190

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

14887

</td>

<td style="text-align:right;">

10.32

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

2020-04-11

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

2

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-12

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

3

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-13

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

4

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-14

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

6

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-15

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

6

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-16

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

7

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-17

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

8

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-18

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

9

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-19

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

9

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-20

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

10

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

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

2020-04-11

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

180458

</td>

<td style="text-align:right;">

8627

</td>

<td style="text-align:right;">

4.78

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-12

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

188694

</td>

<td style="text-align:right;">

9385

</td>

<td style="text-align:right;">

4.97

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-13

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

195031

</td>

<td style="text-align:right;">

10056

</td>

<td style="text-align:right;">

5.16

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-14

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

202208

</td>

<td style="text-align:right;">

10834

</td>

<td style="text-align:right;">

5.36

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-15

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

213779

</td>

<td style="text-align:right;">

11586

</td>

<td style="text-align:right;">

5.42

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-16

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

222284

</td>

<td style="text-align:right;">

12192

</td>

<td style="text-align:right;">

5.48

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-17

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

229642

</td>

<td style="text-align:right;">

12822

</td>

<td style="text-align:right;">

5.58

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-18

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

236763

</td>

<td style="text-align:right;">

13362

</td>

<td style="text-align:right;">

5.64

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-19

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

242817

</td>

<td style="text-align:right;">

13869

</td>

<td style="text-align:right;">

5.71

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-20

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

247543

</td>

<td style="text-align:right;">

14347

</td>

<td style="text-align:right;">

5.80

</td>

</tr>

</tbody>

</table>
