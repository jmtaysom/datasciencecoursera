# Dataset can be found at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Load and subset the data
full_df <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings ='?',colClasses=c('character','character',rep('numeric', 7)))
head(full_df)
df <- subset(full_df, Date=='1/2/2007'|Date=='2/2/2007')
rm(full_df)
png(file="plot1.png",width=480,height=480)
hist(df$Global_active_power, col = 'red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
# close the png graphics device
dev.off()