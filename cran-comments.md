## Resubmission 2020-04-04
This is a resubmission. In this version I have:
* Fixed package title to title case.

## Test environments
* local OS Windows install, R 3.6.3
* ubuntu 14.04 (on travis-ci), R 3.6.3
* win-builder (devel and release)

## R CMD check results

-- R CMD check results --------------------------------- R.COVID.19 0.0.1.2 ----
Duration: 37s

0 errors v | 0 warnings v | 0 notes v

R CMD check succeeded

* This is a new release, re-submission.



## Resubmission 2020-04-03
This is a resubmission. In this version I have:

* Fixed Note: The Date field is not in ISO 8601 yyyy-mm-dd format. 

* Comment on other packages for COVID, explaining the difference with mine:
* coranavirus package: last date of data is 2020-02-16, not maintained.
* covid19us package: data starts in March, all of February missing.

* Comment on US only data:
* I changed the title and description to more accurately reflect the data in
* the package.  The John Hopkins data has country totals, and The New York 
* Times has US state and county data.

* Comment on naming convention: thank you!
* I mimicked the naming convention from covid19us

* win_build note:
* DESCRIPTION FILE mispellings are accurate.
*  COVID 
*  GitHub 
*  JHU 
*  NYT


## Test environments
* local OS Windows install, R 3.6.3
* ubuntu 14.04 (on travis-ci), R 3.6.3
* win-builder (devel and release)

## R CMD check results

-- R CMD check results --------------------------------- R.COVID.19 0.0.1.2 ----
Duration: 34.5s

0 errors v | 0 warnings v | 0 notes v

R CMD check succeeded

* This is a new release, re-submission.
