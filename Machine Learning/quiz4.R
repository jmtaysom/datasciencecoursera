# library(ElemStatLearn)
# library(caret)
# data(vowel.train)
# data(vowel.test) 
# vowel.test$y <- as.factor(vowel.test$y)
# vowel.train$y <- as.factor(vowel.train$y)
# set.seed(33833)
# 
# fit.rf <- train(y~., method='rf', data=vowel.train)
# fit.gbm <- train(y~., method='gbm', data=vowel.train)
# 
# p.rf <- predict(fit.rf, vowel.test)
# p.gbm <- predict(fit.gbm,vowel.test)
# both <- p.rf == p.gbm 
# correct <- p.rf == vowel.test$y
# bothcorrect <- both == correct
# sum(bothcorrect)
# 267/462
# sum(both)/462
# p.both <- p.rf[both]
# 
# cm.rf <- confusionMatrix(predict(fit.rf, vowel.test), vowel.test$y)
# cm.gbm <- confusionMatrix(predict(fit.gbm,vowel.test), vowel.test$y)
# cm.both <- confusionMatrix(p.both,vowel.test$y)

## Question 2
# library(caret)
# library(gbm)
# set.seed(3433)
# library(AppliedPredictiveModeling)
# data(AlzheimerDisease)
# adData = data.frame(diagnosis,predictors)
# inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
# training = adData[ inTrain,]
# testing = adData[-inTrain,]
# set.seed(62433)
# 
# fit.rf <- train(diagnosis~., method='rf', data=training )
# fit.gbm <- train(diagnosis~., method='gbm', data = training)
# fit.lda <- train(diagnosis~., method='lda', data = training)
# p.rf <- predict(fit.rf, testing)
# p.gbm<- predict(fit.gbm,testing)
# p.lda<- predict(fit.lda,testing)
# 
# pred.df <- data.frame(p.rf,p.lda,p.gbm,diagnosis=testing$diagnosis)
# comb.fit <- train(diagnosis~., method='rf', data=pred.df)
# p.comb <- predict(comb.fit, testing)
# confusionMatrix(p.rf,testing$diagnosis)
# confusionMatrix(p.gbm,testing$diagnosis)
# confusionMatrix(p.lda,testing$diagnosis)
# confusionMatrix(p.comb,testing$diagnosis)

## Question 3
# set.seed(3523)
# library(AppliedPredictiveModeling)
# library(caret)
# data(concrete)
# inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
# training = concrete[ inTrain,]
# testing = concrete[-inTrain,]
# set.seed(233)
# 
# fit.lasso <- train(CompressiveStrength~., method='lasso', data=concrete,preProcess = c("center", "scale"))
# plot.enet(fit.lasso$finalmodel, xvar = "penalty", use.color = TRUE)

##Question 4
# library(lubridate)  # For year() function below
# library(forecast)
# dat = read.csv("~/Desktop/gaData.csv")
# training = dat[year(dat$date) < 2012,]
# testing = dat[(year(dat$date)) > 2011,]
# tstrain = ts(training$visitsTumblr)
# tstest = ts(testing$visitsTumblr, start = 366)
# fit<-bats(tstrain)
# fcast <- forecast(fit, level=95, h =235)
# results <- testing$visitsTumblr < fcast$upper
# sum(results)/235
# 
## Question 5

set.seed(3523)
library(AppliedPredictiveModeling)
library(e1071)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
set.seed(325)

svm.model <- svm(CompressiveStrength~., data=training)
svm.pred <- predict(svm.model,testing)
library(Metrics)
rmse(testing$CompressiveStrength, svm.pred)
