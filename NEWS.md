# R.COVID.19 0.1.5
* Bug fixes: Public Status Data set from ESRI are now defunct because of broken links.
* Functions affected:
*   pub_hlth_status_by_cnty
*   pub_hlth_status_by_cnty_shp

# R.COVID.19 0.1.4
* Removed new text in date field in finra data: `finra_shelter_in_place()`
* Added group_by() to test function: `covtrck_states_testing()`
* Bug fix: `covtrck_states_testing()` - fixed data mis-match when converting NA to Zero.
* Added new variable `re-opening` to `covtrck_states_testing()`

# R.COVID.19 0.1.3
* Added a function for testng by states on the covidtracking website: `covtrck_states_testing()`
* Updated link for function `pub_hlth_status_by_cnty_shp()` because link is broken

# R.COVID.19 0.1.2
* Added a function for shelter in place orders on FINRA website: `finra_shelter_in_place()`
* Fixed minor comment edits and added @details to function documentation
* Added pkgdown site

# R.COVID.19 0.1.1
* Added a function for public health status by county for the US
* Added a function for public health status by county with shapefile for the US

# R.COVID.19 0.1.0
* Add new US data from John Hopkins, 2 new functions, which includes geographic
* data for mapping such as FIPS codes, etc.
* Add new Global recovery data from John Hopkins, 1 new function.
* Fixed CRAN re-submission issues.

# R.COVID.19 0.0.1.1
* Fixed CRAN submission issues.
* Including function name changes,
* which are breaking fixes.

# R.COVID.19 0.0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Initial package creation
* Submitted to CRAN for the 1st time.
