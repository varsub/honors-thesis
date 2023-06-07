
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
data <- read.csv("All PocketLab Data_Merged CSV File.csv")
data <- tibble(data)
names(table(data$Hub))

#Creating Hub-Site Subsets
chn <- subset(data, data$Hub == "Chapel Hill North")
fra <- subset(data, data$Hub == "Franklin")
mdw <- subset(data, data$Hub == "Meadowmont")
sov <- subset(data, data$Hub == "South Village")
unp <- subset(data, data$Hub == "University Place")

#Creating Other Subsets
bike <- subset(data, data$Walk_Bike == "bike")
walk <- subset(data, data$Walk_Bike == "walk")

sesh1 <- subset(data, data$Session == 1)
sesh2 <- subset(data, data$Session == 2)
sesh3 <- subset(data, data$Session == 3)

prS <- subset(data, data$Probe == 1 & data$ProbeReadingSuccess == 1)
prNS <- subset(data, data$Probe == 1 & data$ProbeReadingSuccess == 0)


#---ALL CHAPEL HILL---#

#Lower and Upper Bounds for Lat/Long Base Layer Map Generation
min(data$Lat, na.rm=TRUE) #35.8797
max(data$Lat, na.rm=TRUE) #35.9681

min(data$Lng, na.rm=TRUE) #-79.0836
max (data$Lng, na.rm=TRUE) #-79.0105

#Building Base Layer Map of CH
full_map <- ggmap(get_stamenmap
                  (bbox=c(-79.078, 35.870,-79.008,35.970), 
                    source="osm", zoom=15, crop=T))

#Graphing
full_map +
  geom_point(data = data, aes(x=Lng, y=Lat, colour=Temperature..C.),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "C",
                        direction = -1) +
  ggtitle("Thermal Traverse Map of Chapel Hill (All Hub Sites)") +
  theme(plot.title = element_text(size = 10, hjust = 0.5)) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

#Saving as high-resolution Tiff File
ggsave("All Hub Sites, Traverse Map.tiff", 
       units="in", width=5, height=4, dpi=300, compression = 'lzw')


#---UNIVERSITY PLACE---#
unp <- unp %>%
  rename(time = t.s., 
         tempC = Temperature..C.)


#LatLong vs Temp Graph
unp_map <- ggmap(get_stamenmap
                 (bbox=c(-79.035,35.925,-79.010,35.946), 
                   source="osm", zoom=15, crop=T))

unp_map +
  geom_point(data = unp, aes(x=Lng, y=Lat, colour=tempC),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  ggtitle("Thermal Traverse Map of University Place") +
  theme(plot.title = element_text(size = 10, hjust = 0.5)) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

ggsave("University Place, Traverse Map.tiff", units="in", 
       width=5, height=4, dpi=300, compression = 'lzw')



#---CHAPEL HILL NORTH---#
chn <- chn %>%
  rename(time = t.s., 
         tempC = Temperature..C.)


#LatLong vs Temp Graph
chn_map <- ggmap(get_stamenmap
                 (bbox=c(-79.075,35.95,-79.045,35.975), 
                   source="osm", zoom=15, crop=T))

chn_map +
  geom_point(data = chn, aes(x=Lng, y=Lat, colour=tempC),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  ggtitle("Thermal Traverse Map of Chapel Hill North") +
  theme(plot.title = element_text(size = 10, hjust = 0.5)) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

ggsave("Chapel Hill North, Traverse Map.tiff", units="in", 
       width=5, height=4, dpi=300, compression = 'lzw')

#---FRANKLIN---#
fra <- fra %>%
  rename(time = t.s., 
         tempC = Temperature..C.)


#LatLong vs Temp Graph
min(fra$Lng) #-79.08
min(fra$Lat) #35.89
max(fra$Lng) #-79.05
max(fra$Lat) #35.92

fra_map <- ggmap(get_stamenmap
                 (bbox=c(-79.075,35.906,-79.048,35.916), 
                   source="osm", zoom=15, crop=T))

fra_map +
  geom_point(data = fra, aes(x=Lng, y=Lat, colour=tempC),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  ggtitle("Thermal Traverse Map of Franklin Street") +
  theme(plot.title = element_text(size = 10, hjust = 0.5)) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

ggsave("Franklin Street, Traverse Map.tiff", units="in", 
       width=5, height=4, dpi=300, compression = 'lzw')


#---Meadowmont---#
mdw <- mdw %>%
  rename(time = t.s., 
         tempC = Temperature..C.)

min(mdw$Lng) #-79.020
min(mdw$Lat) #35.900
max(mdw$Lng) #-79.000
max(mdw$Lat) #35.910

mdw_map <- ggmap(get_stamenmap
                 (bbox=c(-79.026,35.902,-79.008,35.911), 
                   source="osm", zoom=15, crop=T))


mdw_map +
  geom_point(data = mdw, aes(x=Lng, y=Lat, colour=tempC),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  ggtitle("Thermal Traverse Map of Meadowmont") +
  theme(plot.title = element_text(size = 10, hjust = 0.5)) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

ggsave("Meadowmont, Traverse Map.tiff", units="in", 
       width=5, height=4, dpi=300, compression = 'lzw')


#---SOUTHERN VILLAGE---#
sov <- sov %>%
  rename(time = t.s., 
         tempC = Temperature..C.)

min(sov$Lng) #-79.073
min(sov$Lat) #35.870
max(sov$Lng) #-79.060
max(sov$Lat) #35.890

sov_map <- ggmap(get_stamenmap
                 (bbox=c(-79.074,35.878,-79.062,35.888), 
                   source="osm", zoom=15, crop=T))


sov_map +
  geom_point(data = sov, aes(x=Lng, y=Lat, colour=tempC),
             size = 1, alpha = 0.5) +
  scale_color_viridis_c("Temp. °C", 
                        option = "plasma",
                        direction = -1) +
  ggtitle("Thermal Traverse Map of Southern Village") +
  theme(plot.title = element_text(size = 10, hjust = 0.5)) +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10), 
        axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1))

ggsave("Southern Village, Traverse Map.tiff", units="in", 
       width=5, height=4, dpi=300, compression = 'lzw')



View(subset(unp, unp$Temperature..C. == (max(unp$Temperature..C.))))

mean(chn$Lat, na.rm=TRUE) #35.96
mean(chn$Lng, na.rm=TRUE) #-79.06

