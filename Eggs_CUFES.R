e <- read.csv(file = "eggs_CUFES.csv",header = T, stringsAsFactors = F)

install.packages("stringr") 
str(e)
library(stringr)

year <- str_sub(string= e$cruise, start = 1, end = 4)
head(year)

year <- as.numeric(year)
e$cruise <- year

names(e)
e <- e[c(1, 6, 7, 21, 22)]
write.csv(x=e, file = "eggs_CUFES_new.csv", row.names = F)
View(e)
