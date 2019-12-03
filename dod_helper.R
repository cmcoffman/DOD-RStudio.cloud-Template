# This function will get data from a shared google sheet
library(tidyverse)



# This is a graph component which will make text bigger on your graphs
big.text <- theme(axis.text = element_text(size = rel(1.1)),
                  title = element_text(size = rel(1.1)),
                  # legend.position = "none",
                  strip.text = element_text(size = rel(1.1)))

# put in your data, and which column you want to gather
gather_checkboxes <- function(data, column) {
data %>% 
  mutate(column = column.which) %>% 
  select(id, column) %>% 
  separate(column, 
           into = paste0("column.", letters[seq( from = 1, to = 20)]), sep = ",") %>% 
  gather(key = column, value = value, 2:19) %>% 
  select(id, value) %>% 
  filter(!is.na(value)) %>%
  right_join(tidy.survey.data) %>% 
  rename(column.gathered = value) %>% 
  select(id, age.years, gender, column.gathered) %>% 
  mutate(column.gathered = trimws(column.gathered, which = "both")) %>% 
  {.} -> gathered
  return(gathered)
}

