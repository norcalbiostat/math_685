library("rvest")
library("tidyverse")

url <- "http://ems.csuchico.edu/APSS/schedule/spr2020/MATH.shtml"

math20 <- read_html(url)

tbl <- html_node(math20, css="table")

m20 <- tbl %>%
  # convert to data frame
  html_table(header = TRUE) %>% 
  mutate(nc = nchar(Sect)) %>%
  filter(nc==2)
