if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Loading data
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(XTest) <- features[,2]
names(XTrain) = features[,2]

XTest <- XTest[, grepl("mean|std", features[,2])]
XTrain <- XTrain[, grepl("mean|std", features[,2])]

yTest[,2] <- activityLabels[yTest[,1],2]
yTrain[,2] <- activityLabels[yTrain[,1],2]

names(yTest) = c("Activity_ID", "Activity_Label")
names(yTrain) = c("Activity_ID", "Activity_Label")
names(subjectTest) = "subject"
names(subjectTrain) = "subject"

testData <- cbind(as.data.table(subjectTest), yTest, XTest)
trainData <- cbind(as.data.table(subjectTrain), yTrain, XTrain)


data = rbind(testData, trainData)

dataLabels = setdiff(colnames(data), c("subject", "Activity_ID", "Activity_Label"))
meltData      = melt(data, id = c("subject", "Activity_ID", "Activity_Label"), measure.vars = dataLabels)

TidyData = dcast(meltData, subject + Activity_Label ~ variable, mean)

write.table(TidyData, file = "./tidy_data.txt", row.name=FALSE)

