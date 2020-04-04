
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
<!-- badges: end -->

The goal of R.COVID.19 is to simply aquire data for the disease COVID 19
from sources that make the data readily available. No promises are made
to the validaty of the data as their are many people at the sources
working on that. Because these functions link to the sources, the data
should update as the sources update. If data is not being generated,
please open an issue so that I can look into the broken link. The
sources for the data is listed below.

Finally, the John Hopkins data was transposed to be tidy, instead of
having dates as columns in a wide dataset. The NY Times data was already
in a tidy format.

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

Load libraries:

``` r
library(R.COVID.19)
library(magrittr)
```

### John Hopkins University Data

  - source: [GITHUB](https://github.com/CSSEGISandData/COVID-19)

  - table: csse\_covid\_19\_time\_series

<!-- end list -->

``` r
confirmed <- R.COVID.19::country_confirmed_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   `Province/State` = col_character(),
#>   `Country/Region` = col_character()
#> )
#> See spec(...) for full column specifications.

deaths <- R.COVID.19::country_deaths_daily()
#> Parsed with column specification:
#> cols(
#>   .default = col_double(),
#>   `Province/State` = col_character(),
#>   `Country/Region` = col_character()
#> )
#> See spec(...) for full column specifications.

combo <- confirmed %>% dplyr::left_join(deaths) %>% 
  dplyr::mutate(mortality_rate = round((.$deaths_cases / .$confirmed_cases)*100,2))
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

3/25/20

</td>

<td style="text-align:right;">

65778

</td>

<td style="text-align:right;">

942

</td>

<td style="text-align:right;">

1.43

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

3/26/20

</td>

<td style="text-align:right;">

83836

</td>

<td style="text-align:right;">

1209

</td>

<td style="text-align:right;">

1.44

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

3/27/20

</td>

<td style="text-align:right;">

101657

</td>

<td style="text-align:right;">

1581

</td>

<td style="text-align:right;">

1.56

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

3/28/20

</td>

<td style="text-align:right;">

121478

</td>

<td style="text-align:right;">

2026

</td>

<td style="text-align:right;">

1.67

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

3/29/20

</td>

<td style="text-align:right;">

140886

</td>

<td style="text-align:right;">

2467

</td>

<td style="text-align:right;">

1.75

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

3/30/20

</td>

<td style="text-align:right;">

161807

</td>

<td style="text-align:right;">

2978

</td>

<td style="text-align:right;">

1.84

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

3/31/20

</td>

<td style="text-align:right;">

188172

</td>

<td style="text-align:right;">

3873

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

243453

</td>

<td style="text-align:right;">

5926

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

2.57

</td>

</tr>

</tbody>

</table>

### Data from The New York Times, based on reports from state and local health agencies.

  - source: [GITHUB](https://github.com/nytimes/covid-19-data)

<!-- end list -->

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

2020-03-25

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

4

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

2020-03-26

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

7

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

2020-03-27

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

7

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

2020-03-28

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

7

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

2020-03-29

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

8

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

2020-03-30

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

8

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

2020-03-31

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

9

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

11.11

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-01

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

10

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

10.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-02

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

15

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

6.67

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

</tbody>

</table>

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

2020-03-25

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

4

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

2020-03-26

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

7

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

2020-03-27

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

7

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

2020-03-28

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

7

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

2020-03-29

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

8

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

2020-03-30

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

8

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

2020-03-31

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

9

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

11.11

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-01

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

10

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

10.00

</td>

</tr>

<tr>

<td style="text-align:left;">

2020-04-02

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

15

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

6.67

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

</tbody>

</table>
