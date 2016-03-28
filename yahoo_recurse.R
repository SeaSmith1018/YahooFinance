yahoo_recurse <- function(ticker){
    
    ##build the url and read it
    url   <- "https://finance.yahoo.com"
    start <- "/q/hp?s="
    end   <- "+Historical+Prices"
    link  <- paste(url, start, ticker, end, sep = "")
    yfp   <- read_html(link)
    
    ##set variables for the loop
    i   <- 1
    j   <- 1
    yft <- list()
    
    while(i == 1){
        i <- 0
        
        ##read the table
        y.table            <- yfp %>%
                              html_nodes("table.yfnc_datamodoutline1") %>%
                              html_nodes("table") %>%
                              html_table()
        y.table            <- y.table[[1]]
        y.table            <- y.table[-(dim(y.table)[1]), ]
        yft[[ticker]][[j]] <- y.table
        
        ##search for the "Next" button
        n    <- html_nodes(yfp, "a")
        rel  <- html_attr(n, "rel")
        link <- n[grep("next", rel)]
        
        if (!length(link) == 2){
            yfp           <- ""
            yft[[ticker]] <- yft[[ticker]] %>%
                             ldply()
            yft[[ticker]]
            break
        }
        
        ##set the link if "Next" button exists
        next_link <- link %>%
                     html_attr("href") %>%
                     unique()
        yfp       <- paste(url, next_link, sep = "") %>%
                     read_html()
        
        ##prepare for the next round
        i <- i + 1
        j <- j + 1
        Sys.sleep(3)
    }
    yft[[ticker]]
}