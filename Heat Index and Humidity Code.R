
#Reset
rm(list = ls())

#Load Libraries
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



View(uhi)
setwd("~/Desktop/Varun/Spring 2022/ENVR 692H")

uhi <- read.csv("All PocketLab Data_Merged CSV File.csv")
uhi <- subset (uhi, uhi$Session == 1 | uhi$Session == 2)
sum(table(uhi$Participant) > 0)

mean(uhi$HeatIndex..C., na.rm=TRUE)
sd(uhi$HeatIndex..C., na.rm=TRUE)
range(uhi$HeatIndex..C., na.rm=TRUE)
range(uhi$HeatIndex..C., na.rm=TRUE)[2]-range(uhi$HeatIndex..C., na.rm=TRUE)[1]

mean(uhi$RelativeHumidity..., na.rm=TRUE)
sd(uhi$RelativeHumidity..., na.rm=TRUE)
range(uhi$RelativeHumidity..., na.rm=TRUE)
range(uhi$RelativeHumidity..., na.rm=TRUE)[2]-
  range(uhi$RelativeHumidity..., na.rm=TRUE)[1]

#CHN
chn <- subset(uhi, uhi$Hub == "Chapel Hill North")
mean(chn$RelativeHumidity..., na.rm=TRUE)
sd(chn$RelativeHumidity..., na.rm=TRUE)

range(chn$HeatIndex..C., na.rm=TRUE)[2]-
  range(chn$HeatIndex..C., na.rm=TRUE)[1]

range(chn$HeatIndex..C., na.rm=TRUE)

#FRA
fra <- subset(uhi, uhi$Hub == "Franklin")
mean(fra$RelativeHumidity..., na.rm=TRUE)
sd (fra$RelativeHumidity..., na.rm=TRUE)
range(fra$Temperature..C., na.rm=TRUE)
range(fra$Temperature..C., na.rm=TRUE)[2]-range(fra$Temperature..C., na.rm=TRUE)[1]

range(fra$RelativeHumidity..., na.rm=TRUE)[2]-
  range(fra$RelativeHumidity..., na.rm=TRUE)[1]

range(fra$RelativeHumidity..., na.rm=TRUE)

range(fra$HeatIndex..C., na.rm=TRUE)[2]-
  range(fra$HeatIndex..C., na.rm=TRUE)[1]

range(fra$HeatIndex..C., na.rm=TRUE)


#MDW
mdw <- subset(uhi, uhi$Hub == "Meadowmont")
sum(table(mdw$Participant) > 0)
mean(mdw$RelativeHumidity..., na.rm=TRUE)
sd (mdw$RelativeHumidity..., na.rm=TRUE)
range(mdw$Temperature..C., na.rm=TRUE)
range(mdw$Temperature..C., na.rm=TRUE)[2]-range(mdw$Temperature..C., na.rm=TRUE)[1]

range(mdw$RelativeHumidity..., na.rm=TRUE)[2]-
  range(mdw$RelativeHumidity..., na.rm=TRUE)[1]

range(mdw$RelativeHumidity..., na.rm=TRUE)


range(mdw$HeatIndex..C., na.rm=TRUE)[2]-
  range(mdw$HeatIndex..C., na.rm=TRUE)[1]

range(mdw$HeatIndex..C., na.rm=TRUE)


#SOV
sov <- subset(uhi, uhi$Hub == "South Village")
sum(table(sov$Participant) > 0)
mean(sov$RelativeHumidity..., na.rm=TRUE)
sd (sov$RelativeHumidity..., na.rm=TRUE)
range(sov$Temperature..C., na.rm=TRUE)
range(sov$Temperature..C., na.rm=TRUE)[2]-range(sov$Temperature..C., na.rm=TRUE)[1]


range(sov$HeatIndex..C., na.rm=TRUE)[2]-
  range(sov$HeatIndex..C., na.rm=TRUE)[1]

range(sov$HeatIndex..C., na.rm=TRUE)


#UNP
unp <- subset(uhi, uhi$Hub == "University Place")
sum(table(unp$Participant) > 0)
mean(unp$RelativeHumidity..., na.rm=TRUE)
sd (unp$RelativeHumidity..., na.rm=TRUE)
range(unp$Temperature..C., na.rm=TRUE)
range(unp$Temperature..C., na.rm=TRUE)[2]-range(unp$Temperature..C., na.rm=TRUE)[1]

range(unp$HeatIndex..C., na.rm=TRUE)[2]-
  range(unp$HeatIndex..C., na.rm=TRUE)[1]

range(unp$HeatIndex..C., na.rm=TRUE)


#ALL
sum(table(uhi$Participant) > 0)
mean(uhi$Temperature..C., na.rm=TRUE)
sd (uhi$Temperature..C., na.rm=TRUE)
range(uhi$Temperature..C., na.rm=TRUE)
range(uhi$Temperature..C., na.rm=TRUE)[2]-range(uhi$Temperature..C., na.rm=TRUE)[1]











