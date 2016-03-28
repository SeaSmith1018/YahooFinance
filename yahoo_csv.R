##--insert this function into yahoo_recurse
yahoo_csv <- function(link){
    a      <- link %>%
              read_html() %>%
              html_nodes("a")
    a.text <- a %>%
              html_text()
    a.href <- a %>%
              html_attr("href")
    
    dfile  <- a.href[grep("Download to Spreadsheet", a.text)]
    
    type <- "_hist_prices"
    ext  <- ".csv"
    dest <- paste(ticker, type, ext, sep = "")
    download.file(dfile, dest)
}