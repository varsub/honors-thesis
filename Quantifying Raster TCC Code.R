
#Reset
rm(list = ls())


#Load Libs
library(janeaustenr)
library (SemNetCleaner)
library (Hmisc)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggmap)
library(RgoogleMaps)
library(viridis)
library (plotly)
library(multcomp)
library (raster)
library (sp)
library(rgdal)
library (maptools)
library (rgeos)
library(FedData)
library(rasterVis)
library(reshape2)
library(treemapify)
library(kableExtra)
library(animation)
library(scales)

setwd("~/Desktop/Varun/Spring 2022/ENVR 692H")
uhi <- read.csv("All PocketLab Data_Merged CSV File.csv")
nlcd <- raster("NLCD TCC Map.img")
tcc <- raster("TCC16.tiff")
#test <- rasterToPoints(tcc)
#View(test)

locs <- uhi[,4:5]
locs <- na.omit(locs)

coordinates(locs) <- ~Lng+Lat
(locs)

geo.prj <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
projected_raster <- projectRaster(tcc, crs = geo.prj)
test <- rasterToPoints(tcc)
View(test)


tcc[] <- runif(ncell(tcc))
crs(tcc) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"
projection(tcc)

tcc.pts <- rasterToPoints(tcc, spatial=TRUE)
proj4string(tcc.pts)

geo.prj <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
tcc.pts <- spTransform(tcc.pts, CRS(geo.prj))
proj4string(tcc.pts)

tcc.pts@data <- data.frame(tcc.pts@data, long=coordinates(tcc.pts)[,1],
                         lat=coordinates(tcc.pts)[,2])

final <- (tcc.pts@data)

final <- rename (final,
                 TCC = TCC16,
                 Lng = long,
                 Lat = lat)

View(final)

plot(final)
