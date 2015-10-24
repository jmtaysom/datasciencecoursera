library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(rpart)
library(rpart.plot)


training = segmentationOriginal[segmentationOriginal$Case=='Train',]
testing = segmentationOriginal[segmentationOriginal$Case=='Test',]

set.seed(125)

fit = train(Class~.,method='rpart',data=training)
print(fit$finalModel)


library('pgmm')
data("olive")
olive = olive[,-1]
fit_olive = rpart(Area~.,data=olive)
newdata = as.data.frame(t(colMeans(olive)))
predict(fit_olive,newdata=newdata)


library(ElemStatLearn)
data(SAheart)
#SAheart$chd <- as.factor(SAheart$chd )
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
set.seed(13234)


fit4 = train(chd~age+alcohol+obesity+tobacco+typea+ldl,method='glm',family='binomial', data=trainSA)
fit4
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
predict(fit4,testSA)
missClass(testSA$chd, predict(fit4,testSA))
missClass(trainSA$chd, predict(fit4,trainSA))

library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 
names(vowel.test)
vowel.test$y <- as.factor(vowel.test$y)
vowel.train$y <- as.factor(vowel.train$y)
set.seed(33833)
rf <- train(y~.,data = vowel.train, method='rf')
varImp(rf)
