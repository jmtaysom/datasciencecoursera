
setwd("/home/jmtaysom/datasciencecoursera/Machine Learning/")
# trainingURL <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv'
# testingURL <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv'
# download.file(trainingURL,'pml_training.csv',method='wget')
# download.file(testingURL,'pml_testing.csv',method='wget')

training <- read.csv('pml_training.csv')
testing <- read.csv('pml_testing.csv')
