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
# library(plyr)

## Download, unzip and cleanup
# setwd("~/datasciencecoursera/Explore/Project2")
# zip <- 'pmdata.zip'
# url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
# download.file(url, zip, method='curl')
# unzip(zip)
# file.remove(zip)
# rm(list=ls())

## Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## summarise the data to find the total emissions (in millions of tons) per year
totals <- ddply(NEI,.(year), summarise, Emissions=sum(Emissions))
totals$Emissions <- totals$Emissions/1000000

## Plot the emissions over time and add a linear regression line
png(file="plot1.png",width=480,height=480)
with(totals, plot(year, Emissions, xaxt='n', ylab='Emissions in million tons',
                  xlab='Year', main='Total US Emissions of PM 2.5 over time'))
model <- lm(Emissions~year, totals)
abline(model, lwd=2)
axis(1, at=totals$year)


dev.off()
