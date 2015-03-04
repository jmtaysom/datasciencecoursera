full_df <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings ='?',colClasses=c('character','character',rep('numeric', 7)))
head(full_df)
df <- subset(full_df, Date=='1/2/2007'|Date=='2/2/2007')
rm(full_df)

df$t <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')
#hist(df$Global_active_power, col = 'red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
png(file="plot3.png",width=480,height=480)
plot(df$t, df$Sub_metering_1, type='l', xlab='', ylab='Energy Sub Metering')
lines(df$t, df$Sub_metering_1, type='l', col='black')
lines(df$t, df$Sub_metering_2, type='l', col='red')
lines(df$t, df$Sub_metering_3, type='l', col='blue')

legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1),lwd=c(2,2), col=c('black', 'red', 'blue'))

#dev.copy(png, file='plot3.png')
dev.off()