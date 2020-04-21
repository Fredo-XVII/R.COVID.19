# Functions Roxygen format
#' @title FINRA Shelter in Place Dates
#'
#' @description
#'   This functions pulls dates for shelter in place order by states with notes
#'   and start date and end dates, as well as, extention dates.
#'
#' @return A datarame/tibble
#'
#' @examples
#' \dontrun{
#' confirmed <- R.COVID.19::finra_shelter_in_place()
#' }
#'
#' @importFrom  magrittr %>%
#' @importFrom  tidyr pivot_longer
#' @importFrom  dplyr last
#' @importFrom  readr read_csv
#' @importFrom  rlang .data
#'
#' @export


finra_shelter_in_place <- function() {
  # Get confirmed cases
  url_confirmed <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
  covid19_confirm_wide <- readr::read_csv(url(url_confirmed))

  # From wide to long
  covid19_df <- covid19_confirm_wide %>%
    tidyr::pivot_longer(
      cols = .data$`1/22/20`:dplyr::last(colnames(covid19_confirm_wide)),
      names_to = "greg_d",
      values_to = "confirmed_cases"
    )

  return(invisible(covid19_df))
}

library(rvest)
url_dates <- url("https://www.finra.org/rules-guidance/key-topics/covid-19/shelter-in-place")
webpage <- read_html(url_dates)
tbls <- html_nodes(webpage, "table")
stay_at_home.df <- html_table(tbls[1]) %>% purrr::map_df(.f = as.data.frame)
names(stay_at_home.df) <- c("state", "order", "order_beg_d", "order_end_d")
stay_at_home.df$extended = ifelse(grepl("Extended to", stay_at_home.df$order_end_d), 1, 0)
stay_at_home.df$end_date_1 = trimws(gsub("Extended to ", "", stay_at_home.df$order_end_d))
stay_at_home.df <- stay_at_home.df %>% 
  dplyr::mutate(
    end_date = dplyr::case_when(
      !is.na(stringr::str_match(tolower(end_date_1),"none")) ~ "",
      #"none" %in% trimws(tolower(end_date_1)) == TRUE ~ NA,
      is.na(stringr::str_match(end_date_1,"/")) ~ as.Date(paste0(str_replace(end_date_1," ","/"),"/2020"), format = '%B/%d/%Y'),
      TRUE ~ as.Date(end_date_1,format = '%m/%d/%Y')
    )
  )
stay_at_home.df$end_date_base <- NULL
%B, %d, %Y
stay_at_home.df$start_date = as.Date(stay_at_home.df$order_beg_d, format = '%m/%d/%Y')
stay_at_home.df$end_date = as.Date(stay_at_home.df$end_date, format = '%m/%d/%Y')  #Lost the "May 3" date, need to address
