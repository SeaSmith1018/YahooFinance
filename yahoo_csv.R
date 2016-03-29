##--insert this function into yahoo_recurse
yahoo_csv <- function(env = parent.env()){
    a           <- env$link %>%
                   read_html() %>%
                   html_nodes("a")
    a.text      <- a %>%
                   html_text()
    a.href      <- a %>%
                   html_attr("href")
    dwnld.link  <- a.href[grep("Download to Spreadsheet", a.text)]
    
    type      <- "_hist_prices"
    ext       <- ".csv"
    dest.file <- paste(env$ticker, type, ext, sep = "")
    if(is.object("env$dest")){
            dest.file <- file.path(env$dest, dest.file)
    }
    download.file(dwnld.link, dest.file)
}