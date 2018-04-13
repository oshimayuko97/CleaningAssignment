# reading .txt files
xtest <- read.table('X_test.txt',header=FALSE); ytest <- read.table('y_test.txt',header=FALSE)
xtrain <- read.table('X_train.txt',header=FALSE); ytrain <- read.table('y_train.txt',header=FALSE)
act <- read.table('activity_labels.txt')
subject_test <- read.table('subject_test.txt'); subject_train <- read.table('subject_train.txt')

# merging test and train datasets into one
acttest <- merge(ytest,act); acttrain <- merge(ytrain,act)
test <- cbind(subject_test,acttest[,2],xtest); train <- cbind(subject_train,acttrain[,2],xtrain)
names(test)[2] = 'Activity'; names(train)[2] = 'Activity'
dataset <- rbind(test,train)

# adding features as variable names
f <- read.table('features.txt',header=FALSE)
features <- as.character(f[,2])
names(dataset) <- c('Subject','Activity',features)

# extracting only mean and standard deviation for each measurement
TargetNum1 <- grep('[Mm]ean|std',names(dataset)); TargetNum2 <- grep('meanFreq\\(\\)',names(dataset))
TargetNum <- setdiff(TargetNum1,TargetNum2)
TargetData <- data.frame(dataset[,c(1,2,TargetNum)])

subject <- rep(1:30,each=6); newact <- rep(act[,2],30)
NewRowNames <- data.frame(subject,newact)
Avg <- data.frame(matrix(NA,180,ncol(NewVars)))


# calculating the average of each variable for each activity and each subject
for (j in 1:length(TargetNum)) {
  for (k in 1:30) {
    for (l in 1:6) {
      ind <- intersect(grep(k,TargetData$Subject),grep(act[l,2],TargetData$Activity))
      Avg[6*k+l-6,j] <- mean(TargetData[ind,j+2],na.rm=TRUE)
    }
  }
}

# creating the independent tidy data set NewData
NewData <- cbind(subject,newact,Avg)
names(NewData) <- names(TargetData)
head(NewData)
