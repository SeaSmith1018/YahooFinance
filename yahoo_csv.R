# This function runs inside yahoo_recurse2().
# It inherits the parent frame of yahoo_recurse2().
# Therefore, it MUST be ran within another function.

yahoo_csv <- function(env = parent.frame()){
    
    a           <- env$link %>% read_html() %>% html_nodes("a")
    a.text      <- a %>% html_text()
    a.href      <- a %>% html_attr("href")
    dwnld.link  <- a.href[grep("Download to Spreadsheet", a.text)]
    
    type      <- "_hist_prices"
    ext       <- ".csv"
    
    if(is.object("env$dest")){
            dest.file <- file.path(env$dest, dest.file)
    } else{
            dest.file <- paste(env$ticker, type, ext, sep = "")    
    }
        
    download.file(dwnld.link, dest.file)
}