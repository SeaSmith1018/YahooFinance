# This is a much more simple version of my original yahoo scraping function.
# This function calls another function: yahoo_csv().
# yahoo_csv() inherits yahoo_recurse2()'s environment.
# IF YOU PASS ALONG A DESTINATION FILE TO 'dest' IT WILL DIRECT DOWNLOADS TO THAT FOLDER

yahoo_recurse2 <- function(ticker, dest){
    
    ##build the url and read it
    url   <- "https://finance.yahoo.com"
    start <- "/q/hp?s="
    end   <- "+Historical+Prices"
    link  <- paste(url, start, ticker, end, sep = "")
    
    ##download each ticker's csv file to working directory
    yahoo_csv()
}