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
#' @name finra_shelter_in_place
#'
#' @examples
# \dontrun{
#' stay_orders <- R.COVID.19::finra_shelter_in_place()
#' head(stay_orders)
# }
#'
#' @importFrom  magrittr %>%
#' @importFrom  purrr map_df flatten_chr map_chr
#' @importFrom  dplyr last mutate case_when
#' @importFrom  rvest html_table html_nodes
#' @importFrom  xml2 read_html
#' @importFrom  tibble as_tibble
#' @importFrom  stringr str_match str_replace str_detect str_split str_pad
#' @importFrom  lubridate ymd parse_date_time as_date
#' @importFrom  gsubfn strapplyc
#' @importFrom  stats na.omit
#'
#' @export

finra_shelter_in_place <- function() {

  # Get html file
  url_dates <- url("https://www.finra.org/rules-guidance/key-topics/covid-19/shelter-in-place")
  webpage <- xml2::read_html(url_dates)
  tbls <- rvest::html_nodes(webpage, "table")
  df <- rvest::html_table(tbls[1]) %>% purrr::map_df(.f = as.data.frame)

  # Clean Data
  names(df) <- c("state", "order", "order2", "order_beg_d", "order_end_org")
  df$order_beg_d <- as.Date(df$order_beg_d, format = '%m/%d/%Y')
  df$order_end_org_0 <-
    gsub('\"','',
         ifelse(trimws(tolower(df$order_end_org)) == "none", NA, df$order_end_org)
         )

  # Remove text from dates
  df$order_end_org_1 <- gsubfn::strapplyc(df$order_end_org_0, "\\d+/\\d+/\\d+", simplify = TRUE)
  df$order_end_org_1[which(df$order_end_org_1 == "character(0)")] <- "9999"
  df$order_end_org_1 <- purrr::flatten_chr(df$order_end_org_1)

  # Create date variables
  df <- df %>%
    dplyr::mutate(order_end_org_2 = dplyr::case_when(order_end_org_1 != "9999" ~ order_end_org_1,
                                              TRUE ~ purrr::map_chr(.data$order_end_org_0,find_date))) %>%
    dplyr::mutate(order_end_d = lubridate::parse_date_time(x = .data$order_end_org_2,
                                              orders = c("y-m-d", "m/d/y"),
                                              locale = "eng") %>%
                    lubridate::as_date()
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

  # Convert to tibble
  df <- tibble::as_tibble(df)

  df
}

# Helper functions, do not export

#' @param x `string` character string that has date descriptions, such as Apr 24
#' @rdname finra_shelter_in_place

find_date <- function(x) {
  # Split String
  mth_split <- stringr::str_split(x," ") %>% purrr::flatten_chr()
  # Match string elements to Month
  mth <- match(mth_split,month.name) %>% stats::na.omit() %>% as.character() %>% stringr::str_pad(.,2,side = "left", pad = "0")
  # Match string
  day <- match(mth_split,1:31) %>%  stats::na.omit() %>% as.character() %>% stringr::str_pad(.,2,side = "left", pad = "0")
  # Build the data string with lubridate
  date_fixed <- lubridate::ymd(paste('2020',mth,day,sep = "-"))
  # Paste the date to keep as string in output
  paste0(date_fixed)
}
