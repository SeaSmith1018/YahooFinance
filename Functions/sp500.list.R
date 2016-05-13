### import the rvest library
    library(rvest)

### set the url
    url <- "http://www.cboe.com/products/snp500.aspx"

### fetch the table
    sp500 <- url %>%
             read_html() %>%
             html_nodes("table.table.center") %>%
            html_table(header = T)

### tidy up
    sp500 <- sp500[[1]]
    sp500 <- sp500[-dim(sp500)[[1]], ] ## delete last row (blank)
    sp500$Company <- gsub("\r\n", "", sp500$Company) ## eliminate line breaks in Company
    sp500$Ticker <- gsub("\\.", "-", sp500$Ticker) ## convert . to - for finance.yahoo.com 

### save the table in a csv file
    if(dir.exists("Data")){
    }   else{
        dir.create("Data")
    }
    write.csv(sp500, "Data/sp500.csv")