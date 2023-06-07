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
uhi <- read.csv("All PocketLab Data_Merged CSV File.csv")

names(table(uhi$Hub))

uhi$Hub2 <- ifelse (uhi$Hub == "Chapel Hill North", "CHN",
                   ifelse (uhi$Hub == "Franklin", "FRA",
                           ifelse (uhi$Hub == "Meadowmont", "MDW",
                                   ifelse (uhi$Hub == "South Village", "SOV",
                                           "UNP"))))
names(table(uhi$Hub))
names(table(uhi$Hub2))

#Creating Session Subsets
sesh1 <- subset(uhi, uhi$Session == 1)
sesh2 <- subset(uhi, uhi$Session == 2)

#Creating Hub Site Subsets
chn <- subset(uhi, uhi$Hub == "Chapel Hill North")
fra <- subset(uhi, uhi$Hub == "Franklin")
mdw <- subset(uhi, uhi$Hub == "Meadowmont")
sov <- subset(uhi, uhi$Hub == "South Village")
unp <- subset(uhi, uhi$Hub == "University Place")



#Creating subset of only Sessions 1 and 2
test <- subset(uhi, uhi$Session == 1 | uhi$Session == 2)
test$Session <- ifelse (test$Session == 1, "Afternoon", 
                        "Evening")


#Boxplot of Temp by Hub (Both Sessions)
ggplot (test, aes (x=Hub2, y=Temperature..C., fill = 'red')) +
  geom_boxplot(alpha=0.3) +
  xlab("") +
  ylab ("Temperature (˚C)") +
  theme(legend.position = "none") +
  ggtitle ("Boxplot comparison of temperature distribution by hub
                            (Both Sessions)")

ggsave("Boxplot for Temp by Hub.tiff", 
       units="in", width=6, height=4, dpi=300, compression = 'lzw')


#Boxplot of Temp by Session (All Hubs)
ggplot (test, aes (x=Session, y=Temperature..C., fill = Session)) +
  geom_boxplot(alpha=0.3) +
  xlab("Session") +
  ylab ("Temperature (˚C)") +
  theme(legend.position = "none") +
  ggtitle("Boxplot comparison of temperature distribution by session
                              (All Hub Sites)") +
  scale_fill_brewer(palette = "Accent")

ggsave("Boxplot for Temp by Session.tiff", 
       units="in", width=6, height=4, dpi=300, compression = 'lzw')

#Boxplot of Temp by Session (EACH Hub)
ggplot (test, aes (x=Hub2, y=Temperature..C., fill = Session)) +
  geom_boxplot(alpha=0.3) +
  xlab("") +
  ylab ("Temperature (˚C)") +
  ggtitle("Boxplot comparison of temperature distribution by session 
                              (Each Hub Site)") +
  scale_fill_brewer(palette = "Accent")

ggsave("Boxplot for Temp by Session AND Hub.tiff", 
       units="in", width=6, height=4, dpi=300, compression = 'lzw')
