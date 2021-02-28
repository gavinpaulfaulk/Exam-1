e <- read.csv("195101-201404_Zoop.csv")
str(e)

#convert lat to decimal degrees
min.c <- e$Lat_Min/60
head(min.c)

deg.lat <- e$Lat_Deg
deg.lat <- as.numeric(deg.lat)

dec.lat <- deg.lat + min.c
e$Lat_Dec_Deg <- dec.lat

#convert long to decimal degrees
min.lon.c <- e$Lon_Min/60
head(min.lon.c)

deg.lon <- e$Lon_Deg 
deg.lon <- as.numeric(deg.lon)

dec.lon <- (deg.lon + min.lon.c)*-1
e$Lon_Dec_Deg <- dec.lon

write.csv(x=e, file = "Zoop_fixed.csv")



#extract year from Tow_Date

e2 <- read.csv("Zoop_fixed.csv")
str(e2)

date <- e2$Tow_Date
format(as.Date(date, format="%d/%m/%Y"),"%Y")

s <- str_split_fixed(string = date, pattern = "/", n = 3)
s3 <- s[,3]

s3 <- as.integer(s3)
e2$Year <- s3

write.csv(x=e2, file = "Zoop_fixeddate.csv")


#remove columns

e3 <- read.csv("Zoop_fixeddate.csv")

names(e3)
e3 <- e3[c(4, 12, 22, 23, 24, 25, 29, 30, 31)]

write.csv(x=e3, file = "Zoop_allfixed.csv",  row.names = F)
