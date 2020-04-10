
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
already in a tidy format.

## Installation

You can install the released version of R.COVID.19 from
[CRAN](https://CRAN.R-project.org) with: (NOT YET ON CRAN)

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

3/31/20

</td>

<td style="text-align:right;">

188172

</td>

<td style="text-align:right;">

3873

</td>

<td style="text-align:right;">

7024

</td>

<td style="text-align:right;">

2.06

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

4/1/20

</td>

<td style="text-align:right;">

213372

</td>

<td style="text-align:right;">

4757

</td>

<td style="text-align:right;">

8474

</td>

<td style="text-align:right;">

2.23

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

4/2/20

</td>

<td style="text-align:right;">

243762

</td>

<td style="text-align:right;">

5926

</td>

<td style="text-align:right;">

9001

</td>

<td style="text-align:right;">

2.43

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

4/3/20

</td>

<td style="text-align:right;">

275586

</td>

<td style="text-align:right;">

7087

</td>

<td style="text-align:right;">

9707

</td>

<td style="text-align:right;">

2.57

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

4/4/20

</td>

<td style="text-align:right;">

308853

</td>

<td style="text-align:right;">

8407

</td>

<td style="text-align:right;">

14652

</td>

<td style="text-align:right;">

2.72

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

4/5/20

</td>

<td style="text-align:right;">

337072

</td>

<td style="text-align:right;">

9619

</td>

<td style="text-align:right;">

17448

</td>

<td style="text-align:right;">

2.85

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

4/6/20

</td>

<td style="text-align:right;">

366667

</td>

<td style="text-align:right;">

10783

</td>

<td style="text-align:right;">

19581

</td>

<td style="text-align:right;">

2.94

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

4/7/20

</td>

<td style="text-align:right;">

396223

</td>

<td style="text-align:right;">

12722

</td>

<td style="text-align:right;">

21763

</td>

<td style="text-align:right;">

3.21

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

4/8/20

</td>

<td style="text-align:right;">

429052

</td>

<td style="text-align:right;">

14695

</td>

<td style="text-align:right;">

23559

</td>

<td style="text-align:right;">

3.42

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

4/9/20

</td>

<td style="text-align:right;">

461437

</td>

<td style="text-align:right;">

16478

</td>

<td style="text-align:right;">

25410

</td>

<td style="text-align:right;">

3.57

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

4/5/20

</td>

<td style="text-align:right;">

67551

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

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

4/6/20

</td>

<td style="text-align:right;">

72181

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

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

4/7/20

</td>

<td style="text-align:right;">

76876

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

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

4/8/20

</td>

<td style="text-align:right;">

81803

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

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

4/9/20

</td>

<td style="text-align:right;">

87028

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

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

2020-04-06

</td>

<td style="text-align:left;">

Wyoming

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36121

</td>

<td style="text-align:right;">

23

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

4.35

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-07

</td>

<td style="text-align:left;">

Wyoming

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36121

</td>

<td style="text-align:right;">

23

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

4.35

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-08

</td>

<td style="text-align:left;">

Wyoming

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36121

</td>

<td style="text-align:right;">

27

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-02

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

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-03

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

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-04

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

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-05

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

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-06

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

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-07

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

0.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-08

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

0.00

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

2020-03-30

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

67174

</td>

<td style="text-align:right;">

1224

</td>

<td style="text-align:right;">

1.82

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-03-31

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

75832

</td>

<td style="text-align:right;">

1550

</td>

<td style="text-align:right;">

2.04

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-01

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

83889

</td>

<td style="text-align:right;">

1941

</td>

<td style="text-align:right;">

2.31

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-02

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

92770

</td>

<td style="text-align:right;">

2653

</td>

<td style="text-align:right;">

2.86

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-03

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

102870

</td>

<td style="text-align:right;">

2935

</td>

<td style="text-align:right;">

2.85

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-04

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

114996

</td>

<td style="text-align:right;">

3568

</td>

<td style="text-align:right;">

3.10

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-05

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

122911

</td>

<td style="text-align:right;">

4161

</td>

<td style="text-align:right;">

3.39

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-06

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

130703

</td>

<td style="text-align:right;">

4758

</td>

<td style="text-align:right;">

3.64

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-07

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

140081

</td>

<td style="text-align:right;">

5563

</td>

<td style="text-align:right;">

3.97

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-08

</td>

<td style="text-align:left;">

New York

</td>

<td style="text-align:left;">

36

</td>

<td style="text-align:right;">

149401

</td>

<td style="text-align:right;">

6268

</td>

<td style="text-align:right;">

4.20

</td>

</tr>

</tbody>

</table>
