
# yahoo.csv(env = parent.frame())) ----------------------------------------

# This function runs inside yahoo.recurse2().
# It inherits the parent frame of yahoo.recurse2().
# Therefore, it MUST be ran within another function.

yahoo.csv <- function(env = parent.frame()){
    
    ### get the link
        a           <- env$link %>% read_html() %>% html_nodes("a")
        a.text      <- a %>% html_text()
        a.href      <- a %>% html_attr("href")
        dwnld.link  <- a.href[grep("Download to Spreadsheet", a.text)]
        
    ### set the base destination file (where the download will go)
        type      <- "_hist_prices"
        ext       <- ".csv"
        dest.file <- paste(env$ticker, type, ext, sep = "")
        if(!missing("env$dest") & is.character("env$dest")){
            dest.file <- file.path(env$dest, dest.file)
        }
        
    ### download the file
        download.file(dwnld.link, dest.file)
}


# yahoo.recurse2(ticker, dest) --------------------------------------------

# This is a much more simple version of my original yahoo scraping function.
# This function calls another function: yahoo.csv().
# yahoo.csv() inherits yahoo.recurse2()'s environment.
# IF YOU PASS ALONG A DESTINATION FILE TO 'dest' IT WILL DIRECT DOWNLOADS TO THAT FOLDER

yahoo.recurse2 <- function(ticker, dest){
    
    ### build the url and read it
        url   <- "https://finance.yahoo.com"
        start <- "/q/hp?s="
        end   <- "+Historical+Prices"
        link  <- paste(url, start, ticker, end, sep = "")
        
    ### download each ticker's csv file to working directory
        yahoo.csv()
}
