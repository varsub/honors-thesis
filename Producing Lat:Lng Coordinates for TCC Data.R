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
nlcd <- raster("NLCD TCC Map.img")
tcc <- raster("TCC16.tiff")
#test <- rasterToPoints(tcc)
#View(test)

View(uhi)

#Convert UTM to Lat/Lng Format in NLCD TCC Data
tcc_coord <- projectRaster (tcc, crs = "+init=epsg:4326")

#Download all points on NLCD TCC Data while retaining Lat/Lng coordinates
tcc_pts <- rasterToPoints(tcc_coord)
tcc_pts <- as.data.frame(tcc_pts)
tcc_pts <- rename(tcc_pts,
                  Lat = y,
                  Lng = x,
                  TCC = TCC16)

#TCC_PTS CONTAINS LAT/LNG AND TREE CANOPY COVERAGE#

#Matching TCC_PTS to Temperature in UHI data
locs <- uhi[,4:5]
locs <- na.omit(locs)
locs <- distinct(locs) #Only distinct coordinates


#Rounding all values to 5 d.p. for consistency
round_df <- function(x, digits) {
  numeric_columns <- sapply(x, mode) == 'numeric'
  x[numeric_columns] <-  round(x[numeric_columns], digits)
  x
}

locs <- round_df(locs, 3)
tcc_pts <- round_df(tcc_pts, 3)

View(locs)

test$temp <- uhi$Temperature..C.

ifelse (locs$Lat %in% tcc_pts$Lat & locs$Lng %in% tcc_pts$Lng,
        



