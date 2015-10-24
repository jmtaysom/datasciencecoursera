library(caret)
library(ElemStatLearn)

setwd("/home/jmtaysom/datasciencecoursera/Machine Learning/")
# trainingURL <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv'
# testingURL <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv'
# download.file(trainingURL,'pml_training.csv',method='wget')
# download.file(testingURL,'pml_testing.csv',method='wget')



training <- read.csv('pml_training.csv', na.strings = c('NA', "NULL","", " "))
testing <- read.csv('pml_testing.csv')
nona_training <- sapply(training, function(x)all(!is.na(x)))
train.data <- training[,nona_training]
train.data <- train.data[,8:59]
train.classe <- training[,160]

test.data <-testing[,nona_training]
test.data <- test.data[,8:59]

set.seed(1010101)
rf <- train(train.data,train.classe, method='rf')
testpredict <-predict(rf,test.data)

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}
pml_write_files(testpredict)

print(rf)
print(rf$finalModel)
