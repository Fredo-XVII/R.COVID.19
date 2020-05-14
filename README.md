
<!-- README.md is generated from README.Rmd. Please edit that file -->

# R.COVID.19

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Fredo-XVII/R.COVID.19.svg?branch=master)](https://travis-ci.org/Fredo-XVII/R.COVID.19)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/Fredo-XVII/R.COVID.19?branch=master&svg=true)](https://ci.appveyor.com/project/Fredo-XVII/R.COVID.19)
<!--  [![Codecov test coverage](https://codecov.io/gh/Fredo-XVII/R.COVID.19/branch/master/graph/badge.svg)](https://codecov.io/gh/Fredo-XVII/R.COVID.19?branch=master) -->
<!--  [![CRAN status](https://www.r-pkg.org/badges/version/R.COVID.19)](https://CRAN.R-project.org/package=R.COVID.19) -->
<!-- [![Github All Releases](https://img.shields.io/github/downloads/Fredo-XVII/R.COVID.19/total.svg)]() -->
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

37.0902

</td>

<td style="text-align:right;">

\-95.7129

</td>

<td style="text-align:left;">

5/4/20

</td>

<td style="text-align:right;">

1180375

</td>

<td style="text-align:right;">

68922

</td>

<td style="text-align:right;">

187180

</td>

<td style="text-align:right;">

5.84

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

5/5/20

</td>

<td style="text-align:right;">

1204351

</td>

<td style="text-align:right;">

71064

</td>

<td style="text-align:right;">

189791

</td>

<td style="text-align:right;">

5.90

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

5/6/20

</td>

<td style="text-align:right;">

1229331

</td>

<td style="text-align:right;">

73455

</td>

<td style="text-align:right;">

189910

</td>

<td style="text-align:right;">

5.98

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

5/7/20

</td>

<td style="text-align:right;">

1257023

</td>

<td style="text-align:right;">

75662

</td>

<td style="text-align:right;">

195036

</td>

<td style="text-align:right;">

6.02

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

5/8/20

</td>

<td style="text-align:right;">

1283929

</td>

<td style="text-align:right;">

77180

</td>

<td style="text-align:right;">

198993

</td>

<td style="text-align:right;">

6.01

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

5/9/20

</td>

<td style="text-align:right;">

1309550

</td>

<td style="text-align:right;">

78795

</td>

<td style="text-align:right;">

212534

</td>

<td style="text-align:right;">

6.02

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

5/10/20

</td>

<td style="text-align:right;">

1329260

</td>

<td style="text-align:right;">

79526

</td>

<td style="text-align:right;">

216169

</td>

<td style="text-align:right;">

5.98

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

5/11/20

</td>

<td style="text-align:right;">

1347881

</td>

<td style="text-align:right;">

80682

</td>

<td style="text-align:right;">

232733

</td>

<td style="text-align:right;">

5.99

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

5/12/20

</td>

<td style="text-align:right;">

1369376

</td>

<td style="text-align:right;">

82356

</td>

<td style="text-align:right;">

230287

</td>

<td style="text-align:right;">

6.01

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

5/13/20

</td>

<td style="text-align:right;">

1390406

</td>

<td style="text-align:right;">

84119

</td>

<td style="text-align:right;">

243430

</td>

<td style="text-align:right;">

6.05

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

5/9/20

</td>

<td style="text-align:right;">

183289

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

19818

</td>

<td style="text-align:right;">

10.81

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

5/10/20

</td>

<td style="text-align:right;">

184417

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

19789

</td>

<td style="text-align:right;">

10.73

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

5/11/20

</td>

<td style="text-align:right;">

185357

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

20056

</td>

<td style="text-align:right;">

10.82

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

5/12/20

</td>

<td style="text-align:right;">

186123

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

20237

</td>

<td style="text-align:right;">

10.87

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

5/13/20

</td>

<td style="text-align:right;">

187250

</td>

<td style="text-align:right;">

5803210

</td>

<td style="text-align:right;">

20316

</td>

<td style="text-align:right;">

10.85

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

2020-05-03

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

19

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

5.26

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-04

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

19

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

5.26

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-05

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

19

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

10.53

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-06

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

19

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

15.79

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-07

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

19

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

15.79

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-08

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

20

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

15.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-09

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

20

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

15.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-10

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

21

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

14.29

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-11

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

21

</td>

<td style="text-align:right;">

4

</td>

<td style="text-align:right;">

19.05

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-12

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

21

</td>

<td style="text-align:right;">

4

</td>

<td style="text-align:right;">

19.05

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

2020-05-03

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

321833

</td>

<td style="text-align:right;">

24576

</td>

<td style="text-align:right;">

7.64

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-04

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

324357

</td>

<td style="text-align:right;">

24788

</td>

<td style="text-align:right;">

7.64

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-05

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

326659

</td>

<td style="text-align:right;">

25028

</td>

<td style="text-align:right;">

7.66

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-06

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

329405

</td>

<td style="text-align:right;">

25956

</td>

<td style="text-align:right;">

7.88

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-07

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

332931

</td>

<td style="text-align:right;">

26206

</td>

<td style="text-align:right;">

7.87

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-08

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

335804

</td>

<td style="text-align:right;">

26358

</td>

<td style="text-align:right;">

7.85

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-09

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

338519

</td>

<td style="text-align:right;">

26584

</td>

<td style="text-align:right;">

7.85

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-10

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

340657

</td>

<td style="text-align:right;">

26798

</td>

<td style="text-align:right;">

7.87

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-11

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

342267

</td>

<td style="text-align:right;">

27003

</td>

<td style="text-align:right;">

7.89

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-05-12

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

343705

</td>

<td style="text-align:right;">

27284

</td>

<td style="text-align:right;">

7.94

</td>

</tr>

</tbody>

</table>
