
#Reset
rm(list = ls())

#Load Libraries
install.packages("bindrcpp")
install.packages("ggplot2")
install.packages("RgoogleMaps")
install.packages(c("mnormt", "psych", "SnowballC", "hunspell", 
                   "broom", "tokenizers", "janeaustenr", 
                   "tidytext", "SemNetCleaner", "Hmisc"))
install.packages("devtools")
install.packages("viridis")
install.packages("plotly")

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




setwd("~/Desktop/Varun/Spring 2022/ENVR 692H")

data <- read.csv("All PocketLab Data_Merged CSV File.csv")
View(data)

names(table(data$Hub))

#------------------------------------OVERALL------------------------------------#

#Temperature
mean(data$Temperature..C., na.rm=TRUE) #35.77ºC
sd(data$Temperature..C., na.rm = TRUE) #2.29ºC

#Heat Index
mean(data$HeatIndex..C., na.rm=TRUE) #36.71ºC
sd (data$HeatIndex..C., na.rm=TRUE) #2.36ºC

#------------------------------------CH NORTH------------------------------------#
chn <- subset(data, data$Hub == "Chapel Hill North")

#Temperature
mean(chn$Temperature..C., na.rm=TRUE) #35.05ºC
sd (chn$Temperature..C., na.rm=TRUE) #2.01ºC

#Heat Index
mean(chn$HeatIndex..C., na.rm=TRUE) #36.05ºC
sd(chn$HeatIndex..C., na.rm=TRUE) #1.95ºC

#------------------------------------FRANKLIN------------------------------------#
fra <- subset(data, data$Hub == "Franklin")

#Temperature
mean(fra$Temperature..C., na.rm=TRUE) #35.88ºC
sd (fra$Temperature..C., na.rm=TRUE) #2.35ºC

#Heat Index
mean(fra$HeatIndex..C., na.rm=TRUE) #36.63ºC
sd(fra$HeatIndex..C., na.rm=TRUE) #2.48ºC

#------------------------------------MEADOWMONT------------------------------------#
mdw <- subset(data, data$Hub == "Meadowmont")

#Temperature
mean(mdw$Temperature..C., na.rm=TRUE) #35.11ºC
sd (mdw$Temperature..C., na.rm=TRUE) #1.39ºC

#Heat Index
mean(mdw$HeatIndex..C., na.rm=TRUE) #35.86ºC
sd(mdw$HeatIndex..C., na.rm=TRUE) #1.49ºC

#------------------------------------SOUTH VILLAGE------------------------------------#
sov <- subset(data, data$Hub == "South Village")

#Temperature
mean(sov$Temperature..C., na.rm=TRUE) #36.43ºC
sd (sov$Temperature..C., na.rm=TRUE) #1.36ºC

#Heat Index
mean(sov$HeatIndex..C., na.rm=TRUE) #37.38ºC
sd(sov$HeatIndex..C., na.rm=TRUE) #1.45ºC

#------------------------------------UNIVERSITY PLACE------------------------------------#
unp <- subset(data, data$Hub == "University Place")

#Temperature
mean(unp$Temperature..C., na.rm=TRUE) #38.11ºC
sd (unp$Temperature..C., na.rm=TRUE) #2.15ºC

#Heat Index
mean(unp$HeatIndex..C., na.rm=TRUE) #39.03ºC
sd(unp$HeatIndex..C., na.rm=TRUE) #2.25ºC


View(data)

#------------------------------------BIKE------------------------------------#
bike <- subset(data, data$Walk_Bike == "bike")

#Temperature
mean(bike$Temperature..C., na.rm=TRUE) #34.15ºC
sd (bike$Temperature..C., na.rm=TRUE) #0.70ºC

#Heat Index
mean(bike$HeatIndex..C., na.rm=TRUE) #34.78ºC
sd (bike$HeatIndex..C., na.rm=TRUE) #0.74ºC

#------------------------------------WALK------------------------------------#
walk <- subset(data, data$Walk_Bike == "walk")

#Temperature
mean(walk$Temperature..C., na.rm=TRUE) #35.85ºC
sd(walk$Temperature..C., na.rm=TRUE) #2.39ºC

#Heat Index
mean(walk$HeatIndex..C., na.rm=TRUE) #36.92ºC
sd(walk$HeatIndex..C., na.rm=TRUE) #2.43ºC


#------------------------------------PROBE SUCCESSFUL------------------------------------#
prS <- subset(data, data$Probe == 1 & data$ProbeReadingSuccess == 1)

#Temperature
mean(prS$Temperature..C., na.rm=TRUE) #34.84ºC
sd(prS$Temperature..C., na.rm=TRUE) #2.15ºC

#Heat Index
mean(prS$HeatIndex..C., na.rm=TRUE) #36.03ºC
sd(prS$HeatIndex..C., na.rm=TRUE) #2.05ºC


#------------------------------------PROBE UNSUCCESSFUL------------------------------------#
prNS <- subset(data, data$Probe == 1 & data$ProbeReadingSuccess == 0)

#Temperature
mean(prNS$Temperature..C., na.rm=TRUE) #35.74ºC
sd(prNS$Temperature..C., na.rm=TRUE) #2.53ºC

#Heat Index
mean(prNS$HeatIndex..C., na.rm=TRUE) #36.50ºC
sd(prNS$HeatIndex..C., na.rm=TRUE) #2.68ºC



#-----------------------------------SESSION 1------------------------------------#
sesh1 <- subset(data, data$Session == 1)

#Temperature
mean(sesh1$Temperature..C., na.rm=TRUE) #37.36ºC
sd(sesh1$Temperature..C., na.rm=TRUE) #2.13ºC

#Heat Index
mean(sesh1$HeatIndex..C., na.rm=TRUE) #38.44ºC
sd(sesh1$HeatIndex..C., na.rm=TRUE) #2.16ºC


#-----------------------------------SESSION 2------------------------------------#
sesh2 <- subset(data, data$Session == 2)

#Temperature
mean(sesh2$Temperature..C., na.rm=TRUE) #34.52ºC
sd(sesh2$Temperature..C., na.rm=TRUE) #1.57ºC

#Heat Index
mean(sesh2$HeatIndex..C., na.rm=TRUE) #35.35ºC
sd(sesh2$HeatIndex..C., na.rm=TRUE) #1.53ºC



#-----------------------------------SESSION 3------------------------------------#
sesh3 <- subset(data, data$Session == 3)

#Temperature
mean(sesh3$Temperature..C., na.rm=TRUE) #36.26ºC
sd(sesh3$Temperature..C., na.rm=TRUE) #1.13ºC

#Heat Index
mean(sesh3$HeatIndex..C., na.rm=TRUE) #37.10ºC
sd(sesh3$HeatIndex..C., na.rm=TRUE) #1.17ºC



#---------------------------TRAVERSE MAPS----------------------------#

                           #ALL CHAPEL HILL#

#Lower and Upper Bounds for Lat/Long Base Layer Map Generation
min(data$Lat, na.rm=TRUE) #35.8797
max(data$Lat, na.rm=TRUE) #35.9681

min(data$Lng, na.rm=TRUE) #-79.0836
max (data$Lng, na.rm=TRUE) #-79.0105

#Building Base Layer Map of CH
full_map <- ggmap(get_stamenmap
                  (bbox=c(-79.08,35.87,-79,35.97), 
                    source="osm", zoom=15, crop=T))

#Graphing
full_map +
  geom_point(data = data, aes(x=Lng, y=Lat, colour=Temperature..C.),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

#Saving as high-resolution Tiff File
ggsave("All Hub Sites, Traverse Map.tiff", 
       units="in", width=5, height=4, dpi=300, compression = 'lzw')

names(data)


#Time vs Temp Graph
ggplot(data, aes(x=t.s., y=Temperature..C., 
                 color = Hub)) + 
  geom_line()+
  xlab("Time (Seconds)") +
  ylab("Temperature (Celsius)")
  
#Above is all participants' time vs temp graphs across all 5 hub sites
#Represents the share of higher temperatures occupied by UNP and FRA
#Also represents share of lower temps occupied by MDW and CHN


                              #---UNIVERSITY PLACE---#
unp <- unp %>%
  rename(time = t.s., 
         tempC = Temperature..C.)

names(unp)

#Time vs Temp Graph
ggplot(unp, aes(x=time, y=tempC)) + 
  geom_point(shape=10, color="black")+
  ylab("Temperature (Celsius)")

#LatLong vs Temp Graph
unp_map <- ggmap(get_stamenmap
              (bbox=c(-79.035,35.925,-79.01,35.945), 
                source="osm", zoom=15, crop=T))

unp_map +
  geom_point(data = unp, aes(x=Lng, y=Lat, colour=tempC),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10))

ggsave("test.tiff", units="in", width=5, height=4, dpi=300, compression = 'lzw')

                                  