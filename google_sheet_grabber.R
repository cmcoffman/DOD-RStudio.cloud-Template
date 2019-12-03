# This function will get data from a shared google sheet
library(tidyverse)
library(stringr)

get_sheet <- function(URL) {
  link <- URL
  pattern <- "\\/spreadsheets\\/d\\/([a-zA-Z0-9-_]+)"
  match <- str_match(link, pattern)[,2]
  stuff <- read_csv(paste0("https://docs.google.com/spreadsheets/d/", match, "/export?format=csv"))
  return(stuff)
}

# Example:
# get_sheet("https://docs.google.com/spreadsheets/d/1uuQCOKS18XMt9r-lfqVo31Av7GCI-xwnEKlcCCBYBpI/edit?usp=sharing")