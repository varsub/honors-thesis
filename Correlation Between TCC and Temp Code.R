#Reset
rm(list = ls())

#Load Libs
library(dplyr)
library(ggplot2)
library(ggmap)
library(RgoogleMaps)
library (plotly)
library (raster)
library (sp)
library (sf)
library(rgdal)
library (maptools)
library (rgeos)
library(rasterVis)
library(reshape2)
library(scales)

setwd("~/Desktop/Varun/Spring 2022/ENVR 692H")
uhi <- read.csv("All PocketLab Data_Merged CSV File.csv")
tcc <- raster("TCC16.tiff")

#Converting uhi to Lat/Lng coordinates
temp <- uhi[,c(4,5,8)]
temp <- na.omit(temp)
coordinates(temp) <- ~Lng+Lat
temp #Summary of SpatialPointsDF with Lat/Lng/Temp

#Converting TCC regions to coordinates
tcc_coord <- projectRaster (tcc, crs = "+init=epsg:4326")
tcc_crop <- crop(tcc_coord, temp)

#Plotting temperature over tree canopy coverage
plot(tcc_crop)
plot(temp, add = TRUE)

#Testing Shit
tcc_extract <- extract(tcc_crop,
                       temp,
                       fun = mean,
                       sp = TRUE)
#class(tcc_extract)

test <- as.data.frame(tcc_extract)
View(test)


imp <- raster("IMP19.tiff")
imp_coord <- projectRaster (imp, crs = "+init=epsg:4326")
imp_crop <- crop(imp_coord, temp)
imp_extract <- extract(imp_crop,
                       temp,
                       fun = mean,
                       sp = TRUE)

test2 <- as.data.frame(imp_extract)
View(test2)

final <- (cbind(test, test2$IMP19))
write.csv(final, "TCC and IMP Data.csv")


(cor(test$TCC16, test$Temperature..C.,
    method = "pearson", use = "complete.obs"))


#Plotting TCC vs Temp across CH
ggplot(data=test, mapping = aes(TCC16, Temperature..C.))+
  geom_point(na.rm=TRUE)+
  xlab("Tree Canopy Cover Percentage (MRLC, 2016)") +
  ylab ("Temperature (˚C)") +
  ggtitle("TCC vs Temp.")


