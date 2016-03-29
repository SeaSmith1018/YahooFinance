yahoo_recurse2 <- function(ticker, env = parent.frame()){
    
    ##build the url and read it
    url   <- "https://finance.yahoo.com"
    start <- "/q/hp?s="
    end   <- "+Historical+Prices"
    link  <- paste(url, start, ticker, end, sep = "")
    
    yahoo_csv(link)
}