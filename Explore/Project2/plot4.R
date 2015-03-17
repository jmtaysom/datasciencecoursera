#########################################
# PM2_5analysis.R
# Created by jmtaysom
# R version: 3.1.3
# 2015Mar17
# System: Mac OS 10.6.8
#
#
#########################################

## Import libraries
library(plyr)
library(ggplot2)

## Download, unzip and cleanup
setwd("~/datasciencecoursera/Explore/Project2")
zip <- 'pmdata.zip'
url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, zip, method='curl')
unzip(zip)
file.remove(zip)
rm(list=ls())

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## summarise the data to find the total emissions (in millions of tons) per year
# Baltimore <- NEI[NEI$fips=='24510',]
coalsn <- SCC[grepl("Coal", SCC$Short.Name), ]
coal <- NEI[NEI$SCC %in% coalsn$SCC,] 
totals <- ddply(coal,.(year), summarise, Emissions=sum(Emissions))
totals$Emissions <- totals$Emissions/1000

## Plot the emissions over time and add a linear regression line
# png(file="plot4.png",width=480,height=480)
g <- ggplot(totals, aes(year, Emissions)
g + geom_point() + geom_smooth(method='lm', se=FALSE) + 
  labs(title='PM 2.5 Emissions from Coal Combustion',
       y='Emission in thousand tons', x="Year") +
  scale_x_continuous(breaks=c(1999,2002,2005,2008))

dev.off()
