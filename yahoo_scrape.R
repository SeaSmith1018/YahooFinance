yahoo_scrape <- function(ticker){
    stopifnot(is.character(ticker))
    source("yahoo_recurse.R")
    source("check_pkgs.R")
    if (!check_pkgs("rvest")) library(rvest)
    if (!check_pkgs("plyr")) library(plyr)
yahoo_results        <- lapply(ticker, yahoo_recurse)
names(yahoo_results) <- ticker
yahoo_results
}