# Functions Roxygen format
#' @title FINRA Shelter in Place Dates
#'
#' @description
#'   This functions pulls dates for shelter in place order by states with notes
#'   and start date and end dates, as well as, extention dates from the FINRA
#'   COVID-19 website. No Parameters
#'
#' @details
#'   Website: https://www.finra.org/rules-guidance/key-topics/covid-19/shelter-in-place
#'
#' @return A dataframe/tibble
#'
#' @examples
#' stay_orders <- R.COVID.19::finra_shelter_in_place()
#' head(stay_orders)
#'
#'
#' @importFrom  magrittr %>%
#' @importFrom  purrr map_df
#' @importFrom  dplyr last mutate
#' @importFrom  rvest html_table html_nodes
#' @importFrom  xml2 read_html
#' @importFrom  tibble as_tibble
#' @importFrom  stringr str_match str_replace
#'
#' @export


finra_shelter_in_place <- function() {
  # Get html file
  url_dates <- url("https://www.finra.org/rules-guidance/key-topics/covid-19/shelter-in-place")
  webpage <- read_html(url_dates)
  tbls <- rvest::html_nodes(webpage, "table")
  df <- rvest::html_table(tbls[1]) %>% map_df(.f = as.data.frame)

  # Clean Data
  names(df) <- c("state", "order", "order_beg_d", "order_end_org")
  df$order_beg_d = as.Date(df$order_beg_d, format = '%m/%d/%Y')
  df$order_end_org <- ifelse(trimws(tolower(df$order_end_org)) == "none", NA, df$order_end_org)
  df$order_end_org_1 = trimws(gsub("Extended to ", "", df$order_end_org))

  df <- df %>%
    dplyr::mutate(
      order_end_d = dplyr::case_when(
        is.na(stringr::str_match(order_end_org_1,"/")) ~
          as.Date(paste0(stringr::str_replace(order_end_org_1," ","/"),"/2020"), format = '%B/%d/%Y'),
        TRUE ~ as.Date(order_end_org_1,format = '%m/%d/%Y')
      )
    )

  # Add Variables
  df$order_extended = ifelse(grepl("Extended to", df$order_end_org), 1, 0)

  # Remove unwanted variables
  df$order_end_org_1 <- NULL

  return(invisible(tibble::as_tibble(df)))
}

