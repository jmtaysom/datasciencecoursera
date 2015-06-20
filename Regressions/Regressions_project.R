library(mtcars)
library(ggplot2)

fit <- lm(mpg~am,mtcars)
summary(fit)

cf <- coef(fit)
p <- ggplot(mtcars, aes(x=am,y=mpg)) 
p <- p + xlab('Automatic vs. Manual Transmission')
p <- p + ylab('Miles per Gallon')
p <- p + geom_point()
p <- p + theme(axis.ticks = element_blank(), axis.text.x = element_blank())
#p <- p + geom_abline(intercept=cf[1], aes(slope=cf[2]))
p <- p + stat_smooth(method="lm", se=FALSE)
p

plot(fit, which=4)

auto <- mtcars[mtcars$am==0,]
manl <- mtcars[mtcars$am==1,]
auto.mn <- mean(auto$mpg)
manl.mn <- mean(manl$mpg)

mean(auto$wt)
mean(manl$wt)
mean(manl$cyl)
mean(auto$cyl)

fit1<- lm(mpg~am,data=mtcars)
fit2<- lm(mpg~am+wt,data=mtcars)
fit3<- lm(mpg~am+wt+cyl,data=mtcars)
anova(fit1,fit2)
anova(fit1,fit3)
