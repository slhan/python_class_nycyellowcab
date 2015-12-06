rm(list=ls())
mydata <- read.csv(file.choose(), header = T,nrows = 10000)
backup <- mydata
mydata <- mydata[,c("tpep_pickup_datetime", "tpep_dropoff_datetime",
                    "trip_distance", "pickup_longitude",
                    "pickup_latitude", "dropoff_longitude",
                    "dropoff_latitude","fare_amount")]
################
#install.packages("devtools")
#library("devtools")
#install_github("datadr", "tesseradata")
#library(datadr)
#library(parallel)

#nw <- list(lat = 40.917577, lon = -74.259090)
#se <- list(lat = 40.477399, lon = -73.700272)

#trans <- function(x) {
# set coordinates outside of NYC bounding box to NA
#        ind <- which(x$dropoff_longitude < nw$lon | x$dropoff_longitude > se$lon)
#        x$dropoff_longitude[ind] <- NA
#        ind <- which(x$pickup_longitude < nw$lon | x$pickup_longitude > se$lon)
#        x$pickup_longitude[ind] <- NA
#        ind <- which(x$dropoff_latitude < se$lat | x$dropoff_latitude > nw$lat)
#        x$dropoff_latitude[ind] <- NA
#        ind <- which(x$pickup_latitude < se$lat | x$pickup_latitude > nw$lat)
#        x$pickup_latitude[ind] <- NA
#        x
#}

#mydata <- trans(mydata)

#mydata <- na.omit(mydata)

###############

library(maps)
library(rgdal)
library(ggplot2)

#### read in tabular data from department of city planning ####
#### choose nybb.shp ####
counties<-readOGR(file.choose(), layer="nybb")
#### subset only boundaries of Manhattan ####
manhattan <- counties[counties$BoroName == "Manhattan",]
library(maptools)]

#####
co <- slot(manhattan@polygons[[1]],"Polygons")
co1 <- slot(co[[1]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co2 <- slot(co[[2]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co3 <- slot(co[[3]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co4 <- slot(co[[4]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co5 <- slot(co[[5]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co6 <- slot(co[[6]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co7 <- slot(co[[7]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co8 <- slot(co[[8]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co9 <- slot(co[[9]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co10 <- slot(co[[10]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co11 <- slot(co[[11]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co12 <- slot(co[[12]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co13 <- slot(co[[13]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co14 <- slot(co[[14]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co15 <- slot(co[[15]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co16 <- slot(co[[16]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co17 <- slot(co[[17]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co18 <- slot(co[[18]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co19 <- slot(co[[19]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co20 <- slot(co[[20]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co21 <- slot(co[[21]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co22 <- slot(co[[22]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co23 <- slot(co[[23]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co24 <- slot(co[[24]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co25 <- slot(co[[25]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co26 <- slot(co[[26]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co27 <- slot(co[[27]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co28 <- slot(co[[28]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co29 <- slot(co[[29]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co30 <- slot(co[[30]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co31 <- slot(co[[31]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co32 <- slot(co[[32]],"coords")
co <- slot(manhattan@polygons[[1]],"Polygons")
co33 <- slot(co[[33]],"coords")
rm(co)


ggplot() + geom_polygon(data = manhattan, aes(x=long, y=lat, group = group))

#### pickup latitude and longtitude ####
pickup <- mydata[,c("pickup_latitude", "pickup_longitude")]
pickup <- pickup[1:5000,]
pickup <- na.omit(pickup)
#### map coordinate points ####
ggplot() + geom_point(data = pickup, aes(x = pickup_longitude, 
                                         y = pickup_latitude),
                      color = "red")

proj4string(manhattan)
class(pickup)
coordinates(pickup)<-~pickup_longitude+pickup_latitude

class(pickup)

proj4string(pickup) <- CRS("+proj=longlat +datum=NAD83")
pickup <- spTransform(pickup, CRS(proj4string(manhattan)))

pickup <- data.frame(pickup)
names(pickup)[names(pickup) == "pickup_longitude"] <- "x"
names(pickup)[names(pickup) == "pickup_latitude"] <- "y"

ggplot() +geom_polygon(data = manhattan, aes(x=long, y=lat, group = group)) +
        geom_point(data=pickup, aes(x=x, y=y), color = "red")

threshhold <- 1200000.7
pickup <- subset(pickup, pickup[,1] < threshhold)
