full_df <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings ='?',colClasses=c('character','character',rep('numeric', 7)))
head(full_df)
df <- subset(full_df, Date=='1/2/2007'|Date=='2/2/2007')
rm(full_df)

df$t <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')
#hist(df$Global_active_power, col = 'red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
png(file="plot2.png",width=480,height=480)
plot(df$t,df$Global_active_power, type='n', xlab='', ylab='Global Active Power (kilowatts)')
lines(df$t,df$Global_active_power, type='l')

#dev.copy(png, file='plot2.png')
dev.off()