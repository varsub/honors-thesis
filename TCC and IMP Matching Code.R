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


#Set Working Directory and Import Data
setwd("~/Desktop/Varun/Spring 2022/ENVR 692H")
geo <- read.csv("TCC and IMP Data.csv")


#Matching Max Temps to TCC and IMP

gCHN <-  (subset(geo, geo$Lat == 35.96385 & geo$Lng == -79.05801))
mean(gCHN$IMP19, na.rm=TRUE)

gCHN <-  (subset(geo, geo$Lat == 35.96385 & geo$Lng == -79.05801))


gFRA <- subset(geo, geo$Lat == 35.91236 & geo$Lng == -79.05802)
View(gFRA)
mean(gFRA$TCC16, na.rm=TRUE)


gMDW <- subset(geo, geo$Lat == 35.90513 & geo$Lng == -79.01070)
View(gMDW)

View(sov)
gSOV <- subset(geo, geo$Lat == 35.88718 & geo$Lng == -79.06470)
View(gSOV)

View(unp)
gUNP <- subset(geo, geo$Lat == 35.92655 & geo$Lng == -79.02508)
View(gUNP)

View(fra)

mean(geo$IMP19, na.rm=TRUE)