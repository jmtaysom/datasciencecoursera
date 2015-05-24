library(ggplot2)
library(grid)
library(gridExtra)
library(datasets)


set.seed(0)
# Project part 2
tg <- ToothGrowth

ggplot(tg, aes(x=len, fill=as.character(dose))) + geom_histogram()
OJ <- subset(tg, supp=='OJ')
VC <- subset(tg, supp=='VC')

OJplot <- ggplot(OJ, aes(x=len, fill=as.character(dose))) + geom_histogram() + ggtitle('OJ')
VCplot <- ggplot(VC, aes(x=len, fill=as.character(dose))) + geom_histogram() + ggtitle('VC')

grid.arrange(OJplot, VCplot, nrow=2, main='Comparision of Vitamin C sources')

tg.mean <- aggregate(tg$len,by=list(tg$sup, factor(tg$dose)), mean)
tg.sd <- aggregate(tg$len,by=list(tg$sup, factor(tg$dose)), sd)
