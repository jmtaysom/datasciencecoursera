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
totals <- ddply(NEI,.(year, type), summarise, Emissions=sum(Emissions))

totals$Emissions <- totals$Emissions/1000
nonroad <- totals[totals$type=='NON-ROAD',]
onroad <- totals[totals$type=='ONROAD',]
points <- totals[totals$type=='POINT',]
nonpoint <- totals[totals$type=='NONPOINT',]

## Plot the emissions over time and add a linear regression line
# png(file="plot2.png",width=480,height=480)
# with(totals, plot(year, Emissions, xaxt='n', ylab='Emissions in thousand tons',
#                   xlab='Year', main='Total Baltimore Emissions of PM 2.5 over time'))
# model <- lm(Emissions~year, totals)
# abline(model, lwd=2)
# axis(1, at=totals$year)
p1 <- 
  ggplot(nonroad, aes(x=year, y=Emissions)) + 
  geom_line() +
  ggtitle('Non-road emissions (thousand tons) over time')
p2 <- 
  ggplot(onroad, aes(x=year, y=Emissions)) + 
  geom_line() +
  ggtitle('On-road emissions (thousand tons) over time')
p3 <- 
  ggplot(nonpoint, aes(x=year, y=Emissions)) + 
  geom_line() +
  ggtitle('Non-point emissions (thousand tons) over time')
p4 <- 
  ggplot(points, aes(x=year, y=Emissions)) + 
  geom_line() +
  ggtitle('Point emissions (thousand tons) over time')
multiplot(p1, p2, p3, p4, cols=2)

qplot(year, Emissions, data=onroad)
#dev.off()
