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
    sp500         <- sp500[[1]]
    sp500$Company <- gsub("\r\n", "", sp500$Company)

### save the table in a csv file
    write.csv(sp500, "sp500.csv")