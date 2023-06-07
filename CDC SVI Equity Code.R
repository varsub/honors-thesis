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
nc <- read.csv("NorthCarolina.csv")
View(nc)
nc <- subset(nc, nc$COUNTY == "Orange")
View(nc)


chn <- subset(nc, 
              nc$LOCATION == "Census Tract 112.05, Orange County, North Carolina")

unp <- subset(nc, 
              nc$LOCATION == "Census Tract 121, Orange County, North Carolina")

fra <- subset(nc, 
              nc$LOCATION == "Census Tract 113, Orange County, North Carolina")

mdw <- subset(nc, 
              nc$LOCATION == "Census Tract 122.01, Orange County, North Carolina")

sov <- subset(nc, 
              nc$LOCATION == "Census Tract 122.02, Orange County, North Carolina")


chn$ST <- "Chapel Hill North"
unp$ST <- "University Place"
fra$ST <- "Franklin Street"
mdw$ST <- "Meadowmont"
sov$ST <- "Southern Village"

test <- rbind(chn, unp)
test <- rbind(test, fra)
test <- rbind(test, mdw)
test <- rbind(test, sov)
test <- rename (test, 
                HubSite = ST)

View(test)





(test$E_AGE65/(sum(test$E_TOTPOP)))*100

  
