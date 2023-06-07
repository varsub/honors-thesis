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
imp <- raster("IMP19.tiff")

#Converting uhi to coordinates too
temp <- uhi[,c(4,5,8)]
temp <- na.omit(temp)
coordinates(temp) <- ~Lng+Lat
class(temp)
temp #Summary of SpatialPointsDF with Lat/Lng/Temp

#Converting TCC regions to coordinates
imp_coord <- projectRaster (imp, crs = "+init=epsg:4326")
imp_crop <- crop(imp_coord, temp)

#Plotting temperature over tree canopy coverage
plot(imp_crop)
plot(temp, add = TRUE)

#Testing Stuff
imp_extract <- extract(imp_crop,
                       temp,
                       fun = mean,
                       sp = TRUE)
class(imp_extract)

test2 <- as.data.frame(imp_extract)
View(test2)

(cor(test2$IMP19, test2$Temperature..C.,
     method = "pearson", use = "complete.obs"))

#Plotting IMP vs Temp across CH
ggplot(data=test2, mapping = aes(IMP19, Temperature..C.))+
  geom_point(na.rm=TRUE)+
  xlab("Urban Imperviousness Percentage (MRLC, 2019)") +
  ylab ("Temperature (˚C)") +
  ggtitle("Urban Imperviousness vs Temp.")
    


