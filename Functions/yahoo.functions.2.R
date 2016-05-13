# build.link(ticker) ------------------------------------------------------

build.link <- function(ticker){
### build the url and read it
    base      <- "https://finance.yahoo.com"
    query     <- "/q/hp?s="
    condition <- "+Historical+Prices"
    link.built  <- sapply(ticker, function(x){
        paste(base, query, x, condition, sep = "")
    })
}



# build.dwnld.link(link) --------------------------------------------------

build.dwnld.link <- function(link){
    ### Load dependencies
        require(rvest, quietly = T, warn.conflicts = F)
    
    ### Build download link
    dwnld.link.built <- sapply(link, function(x){
        a      <- x %>% read_html() %>% html_nodes("a")
        a.text <- a %>% html_text()
        a.href <- a %>% html_attr("href")
        a.href[grep("Download to Spreadsheet", a.text)]
    })
}


# yahoo.csv(ticker, dest = NULL) ------------------------------------------


yahoo.csv <- function(ticker, dest = NULL){
    ### load dependencies
        require(rvest, quietly = T, warn.conflicts = F)
    
    ### build the ticker link and download link
        dwnld.link <- build.link(ticker) %>%
                      build.dwnld.link()
    
    ### set the destination file
        type      <- "_hist_prices"
        ext       <- ".csv"
        d.file <- sapply(ticker, function(x){paste(x, type, ext, sep = "")})
        print(d.file)
            if(!is.null(dest) & is.character(dest)){
                d.file <- sapply(seq_along(d.file), function(x){file.path(dest, d.file[[x]])})
            }
        print(dwnld.link)
        print(d.file)
    
    ### dir.extist(dest)
        if(!is.null(dest) & !dir.exists(dest)){
            dir.create(dest)
        }
    ### download the file
        rslt <- mapply(download.file, url = dwnld.link, destfile = d.file, mode = "wb")
}