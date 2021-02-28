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
