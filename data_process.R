library(dplyr)


Q1 <- read.csv("indego_gbfs_trips_Q1_2017.csv")
Q2 <- read.csv("Indego_Trips_2016Q2.csv")
Q3 <- read.csv("Q3_2016_trips.csv")
Q4 <- read.csv("Indego_trips_Q4_2016.csv")

indego <- rbind(Q1,Q2,Q3,Q4)

head(indego$start_time)
#date <- "1/1/17 0:05"
#date
nrow(indego)
typeof(indego$start_time) #integer
indego$date<-NA

indego$date<-sapply(strsplit(as.character(indego$start_time), " "),'[',1)

#date_notime<-date1[[1]][1]
head(indego$date)
typeof(indego$date)
head(indego)
indego[8999:9002,]
indego[500000:500005,]


rds <- readRDS("/Users/Echo/Desktop/702/data/homework4/Philadelphia_Indego/indego.rds")
head(rds)
head(indego)
typeof(indego$date)
typeof(rds$indegodate)
indego$indegodate <- as.Date(indego$date, "%m%d%Y")
class(indego$indegodate)
head(indego)

saveRDS(indego, file = "indego_new.rds")
