
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

#Set Working Directory and Import Data
setwd("~/Desktop/Varun/Spring 2022/ENVR 692H")
data <- read.csv("All PocketLab Data_Merged CSV File.csv")
data <- tibble(data)
names(table(data$Hub))


#Boxplot of Hub vs Temp
boxplot(Temperature..C. ~ Hub,
        data = data,
        xlab = "Temp. C",
        ylab = "",
        las=2,
        horizontal = TRUE)


#ANOVA
oneway.test(data$Temperature..C. ~ data$Hub,
            data = data,
            var.equal = TRUE)

temp_aov <- aov (data$Temperature..C. ~ data$Hub,
                 data = data)


(summary(temp_aov)) #p < 0.05


#POST HOC TESTS
fit <- lm(Temperature..C. ~ Hub, data = data)
hoc <- glht(fit, linfct = mcp(Hub = "Tukey"))

(summary(hoc)) #Individual Comparisons

ci95 <- plot(hoc) #Only #2 OVERLAPS X=0 (#5 is all negative = OKAY)

hoc

ggsave(ci95, "test.tiff", units="in", 
       width=5, height=4, dpi=300, compression = 'lzw')

