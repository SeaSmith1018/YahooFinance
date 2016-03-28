##--check if the requested package is loaded
check_pkgs <- function(x){
    sesh <- sessionInfo()
    my_pack <- c(names(sesh$loadedOnly), names(sesh$otherPkgs))
    any(grepl(x, my_pack))
    }