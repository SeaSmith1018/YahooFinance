##--check if the requested package is loaded
check.pkgs <- function(x){
    sesh <- sessionInfo()
    my.pack <- c(names(sesh$loadedOnly), names(sesh$otherPkgs))
    any(grepl(x, my.pack))
    }