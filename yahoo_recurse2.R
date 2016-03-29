yahoo_recurse2 <- function(ticker, dest){
    
    ##build the url and read it
    url   <- "https://finance.yahoo.com"
    start <- "/q/hp?s="
    end   <- "+Historical+Prices"
    link  <- paste(url, start, ticker, end, sep = "")
    
    ##download each ticker's csv file to working directory
    yahoo_csv()
}