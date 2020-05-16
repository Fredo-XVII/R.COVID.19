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
#' @importFrom  stringr str_match str_replace str_detect
#'
#' @export


finra_shelter_in_place <- function() {
  # Get html file
  url_dates <- url("https://www.finra.org/rules-guidance/key-topics/covid-19/shelter-in-place")
  webpage <- xml2::read_html(url_dates)
  tbls <- rvest::html_nodes(webpage, "table")
  df <- rvest::html_table(tbls[1]) %>% map_df(.f = as.data.frame)

  # Clean Data
  names(df) <- c("state", "order", "order_beg_d", "order_end_org")
  df$order_beg_d <- as.Date(df$order_beg_d, format = '%m/%d/%Y')
  df$order_end_org_0 <- ifelse(trimws(tolower(df$order_end_org)) == "none", NA, df$order_end_org)

  # Remove text from dates
  df$order_end_org_1 <- trimws(gsub("Extended to", "", df$order_end_org_0))
  df$order_end_org_1 <- trimws(gsub('Rescinded April 24', "4/24/2020", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub("Order Rescinded", "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub("Repealed", "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub("Rescinded", "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub('\"Stay-At-Home\" Expired', "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub('\"Stay-at-Home\" Expired', "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub('\"Work-or-Home\" Restriction Lifted', "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub('\"Stay-at-Home\" Superseded', "", df$order_end_org_1 ))
  df$order_end_org_1 <- trimws(gsub('Overturned', "", df$order_end_org_1 ))

  df <- df %>%
    dplyr::mutate(
      order_end_org_2 = dplyr::case_when(
        is.na(stringr::str_match(.data$order_end_org_1,"/")) ~
          as.Date(paste0(stringr::str_replace(order_end_org_1," ","/"),"/2020"), format = '%B/%d/%Y'),
        TRUE ~ as.Date(order_end_org_1,format = '%m/%d/%Y')
      )
    ) %>%
    dplyr::mutate(
      order_end_d = case_when(lubridate::year(.data$order_end_org_2) != 2020 ~ #TRUE ~ FALSE)
                                 lubridate::ymd(paste('2020',
                                                      lubridate::month(.data$order_end_org_2),
                                                      lubridate::day(.data$order_end_org_2),
                                                      sep = "-")),
                               TRUE ~ .data$order_end_org_2)
    )

  # Add Variables
  df$order_extended = ifelse(grepl("Extended to", df$order_end_org), 1, 0)

  # Add reopening variable
  df$re_opening <- stringr::str_detect(trimws(df$state), pattern = "\\*") %>%
    as.numeric()

  # Remove Asterick from state field
  df$state <- stringr::str_replace(df$state,pattern = '\\*', "") %>% trimws()

  # Remove unwanted variables
  df$order_end_org_0 <- NULL
  df$order_end_org_1 <- NULL
  df$order_end_org_2 <- NULL

  return(invisible(tibble::as_tibble(df)))
}

