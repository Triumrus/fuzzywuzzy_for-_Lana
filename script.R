setwd("C:/Users/user/Desktop/саша/musor/лане")
getwd()
library(data.table)
library(xlsx)
first<- read.xlsx("1.xlsx",sheetIndex = 1,encoding = "UTF-8")
first
second <- read.xlsx("2.xlsx",sheetIndex = 1,encoding = "UTF-8")
second

names(first)[3] <- "name1"
names(second)[11] <- "name2"
name1<- as.character(first$name1)
name2<- as.character(second$name2)
name1<- tolower(name1)
name2<- tolower(name2)
second$poz<- sapply(name2,function(x){name1[which.min(adist(x,name1,ignore.case = T))]})
second <- data.table(second)
write.xlsx(second,"second2.xlsx")
       
