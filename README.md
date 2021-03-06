###Scraping Yahoo Finance

> Scraping historical stock prices from Yahoo!

### Info

This repo is dedicated towards functions that can scrape historical stock price data from Yahoo Finance - specifically S&P 500 companies.  

The following files will download the S&P 500 data:
* `sp500_list.R`

The following files will scrape data from Yahoo Finance:
* `yahoo_scrape.R`
  * Dependencies
    * `yahoo_recurse.R` = must be loaded into working directory
    * `check_pkgs.R` = built in but can be loaded into working directory and called with source()
    * `sp500_list.R` = will assemble the data (variables) used in `example.R`

Idea I am working on incorporating:
* [Plotting TIme Series in R using Yahoo Finance data](http://www.r-bloggers.com/plotting-time-series-in-r-using-yahoo-finance-data/)
* [Animations similar to this yield curve GIF](http://www.r-bloggers.com/treasury-yield-curve-from-the-volcker-era-through-greenspan/)
