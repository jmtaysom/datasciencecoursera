# set the workspace
library(dplyr)
setwd("~/datasciencecoursera/cleaning")

# merge test and train data sets into one_data set

## load test files and join them
xtest<-read.table('./test/X_test.txt')
ytest<-read.table('./test/Y_test.txt')
stest<-read.table('./test/subject_test.txt')
xtest[['activity']]<-ytest$V1
xtest[['subject']]<-stest$V1
## load train files and join them
xtrain<-read.table('./train/X_train.txt')
ytrain<-read.table('./train/Y_train.txt')
strain<-read.table('./train/subject_train.txt')
xtrain[['activity']]<-ytrain$V1
xtrain[['subject']]<-strain$V1
## combine the teset and train data
one_data<-rbind(xtest,xtrain)

# extract mean and std from one_data

## get the names of the columns from fiel
table_names<-read.table('features.txt',stringsAsFactors=FALSE)
tn<- as.vector(table_names$V2)
## create a vector of index values that contain mean or std
extract_index <- grep('mean()|std()',tn)
## add the activity column to the index vector
extract_index <- c(extract_index,ncol(one_data)-1, ncol(one_data))
## subset the one_data to only include selected columns
sub_one_data <- one_data[,extract_index]

# clean up the workspace
#rm(one_data,xtest,xtrain,ytest,ytrain,stest,strain)

# label dataset with descriptive names
col_names <- table_names[extract_index,2]
#col_names <- replace(col_names, is.na(col_names), 'activity')
col_names[80]<-'activity'
col_names[81]<-'subjec'
colnames(sub_one_data) <- col_names

# replace coded values of activity with a descriptive value using keys?
key <- read.table('activity_labels.txt')
sub_one_data[["activity"]] <- key[ match(sub_one_data[['activity']], key[['V1']] ) , 'V2']
View(sub_one_data)
# create a new independent data set based on unique activites and users by 
# averages

user_activities <- group_by(sub_one_data, subjects, activity)
View(user_activities,'ua')
tidy_data <- summarise_each(user_activities, funs(mean))


