# adData = data.frame(diagnosis,predictors)
# testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
# training = adData[-testIndex,]
# testing = adData[testIndex,]
# 
# set.seed(1000)
# inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
# training = mixtures[ inTrain,]
# testing = mixtures[-inTrain,]


set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

a <- training[grepl("^IL_", names(training))]
b <- preProcess(a, method='pca', thresh=.80)

alzpredict <- predict(b,a)
modelFit <- train(testing$diagnosis ~ .,method="glm",data=alzpredict)
tesPC <- predict(b,testing[grepl("^IL_", names(training))])
confusionMatrix(testing$diagnosis,predict(modelFit,tesPC))

modelFit2 <- train(testing$diagnosis ~ .,method="glm",data=a)
modelFit2
test2PC <-predict(a,testing[grepl("^IL_", names(training))])
confusionMatrix(testing$diagnosis,predict(modelFit2,tesPC))

