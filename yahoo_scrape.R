yahoo_scrape <- function(x){
    if(!is.character(x)) stop("Input must be character vector")
    yahoo_results        <- lapply(x, yahoo_recurse)
    names(yahoo_results) <- x
    yahoo_results
}

sp500    <- read.csv("sp500.csv")
set.seed(2016)
sub      <- sample(1:504, 5)
stocks   <- as.character(sp500[sub, 'Ticker'])
test_run <- yahoo_scrape(stocks)
preview  <- lapply(test_run, head, n = 3L)
preview

#find and extract dividends
divs <- grep("Dividend", somestock$Open)
    somestock.divs      <- somestock[divs,]
    somestock.divs$Open <- gsub("\\s[A-Za-z]+", "", somestock.divs$Open)
    
#find and extract splits
splits <- grep("Split", somestock$Open)
    somestock.splits      <- somestock[splits,]
    somestock.splits$Open <- gsub("\n\\s+", "", somestock.splits$Open)
    somestock.splits$Open <- gsub("\\s[A-Za-z]", "", somestock.splits$Open)

#extract everything that is not price
not_price       <- sort(unique(c(divs, splits)))
    somestock.price <- somestock[-not_price,]
    
this.stock <- list(somestock.price, somestock.divs, somestock.splits)