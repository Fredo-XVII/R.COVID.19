#' Finra Dataset of Shelter in Place Orders
#'
#' Finra Dataset of Shelter in Place Orders for the covid-19 pandemic in 2020.
#'
#' @format A data frame with 47 rows and 8 variables:
#' \describe{
#'   \item{state}{State Name}
#'   \item{order}{Desription of Order}
#'   \item{order2}{Description of Order 2}
#'   \item{order_beg_d}{Order Begin Date}
#'   \item{order_end_org}{Order End Original}
#'   \item{order_end_d}{Order End Date, as Date}
#'   \item{order_extended}{Order Extended Date, as Date}
#'   \item{re_opening}{Order Re-Opening Date, as Date}
#'   ...
#' }
#' @source \url{https://www.finra.org/rules-guidance/key-topics/covid-19/shelter-in-place}
"finra_sh_in_pl_df"
