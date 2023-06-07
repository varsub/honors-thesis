
#load libraries
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggmap)
library(RgoogleMaps)
library(ggmap)

#load temp data
temp <- read.csv("UniversityPlace#2.csv", stringsAsFactors = F)
temp2 <- read.csv("UniversityPlace#1.csv", stringsAsFactors = F)

temp <- rbind(temp,temp2)

names(temp)

temp <- temp %>%
  rename(time = t..s., tempC = Temperature...C.)

#time
ggplot(temp, aes(x=time, y=tempC)) + 
  geom_point(shape=18, color="blue")+
  ylab("Temperature (Celsius)")


#spatially
mmap <- ggmap(get_stamenmap(bbox=c(-79.04,35.92,-79.02,35.94), source="osm", zoom=15, crop=T))
mmap

mmap +
  geom_point(data = temp, aes(x=Lng, y=Lat, colour=tempC),size = 1, alpha = 0.5)+
  scale_color_viridis_c() +
  xlab("Longitude") +
  ylab("Latitude") + 
  labs(col = "Temperature (Celsius)") + 
  theme(text = element_text(size=10))






