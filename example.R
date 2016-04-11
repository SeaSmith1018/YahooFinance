
# yahoo.functions1.R EXAMPLE ----------------------------------------------


sp500    <- read.csv("sp500.csv")
set.seed(2016)
sub      <- sample(1:504, 5)
stocks   <- as.character(sp500[sub, 'Ticker'])
test_run <- yahoo_scrape(stocks)
preview  <- lapply(test_run, head, n = 3L)
preview

### find and extract dividends
    dividends <- grep("Dividend", somestock$Open)
    somestock.dividends      <- somestock[dividends,]
    somestock.dividends$Open <- gsub("\\s[A-Za-z]+", "", somestock.dividends$Open)

### find and extract splits
    splits <- grep("Split", somestock$Open)
    somestock.splits      <- somestock[splits,]
    somestock.splits$Open <- gsub("\n\\s+", "", somestock.splits$Open)
    somestock.splits$Open <- gsub("\\s[A-Za-z]", "", somestock.splits$Open)

### extract everything that is not price
    not_price       <- sort(unique(c(dividends, splits)))
    somestock.price <- somestock[-not_price,]
    
    this.stock <- list(somestock.price, somestock.dividends, somestock.splits)


# yahoo.functions2.R EXAMPLE ----------------------------------------------


