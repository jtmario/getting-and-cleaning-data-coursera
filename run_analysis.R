#check required datasets on current working directory
if (!file.exists("UCI HAR Dataset/features.txt")|
	!file.exists("UCI HAR Dataset/activity_labels.txt")|
	!file.exists("UCI HAR Dataset/train/X_train.txt")|
	!file.exists("UCI HAR Dataset/train/y_train.txt")|
	!file.exists("UCI HAR Dataset/train/subject_train.txt")|
	!file.exists("UCI HAR Dataset/test/X_test.txt")|
	!file.exists("UCI HAR Dataset/test/y_test.txt")|
	!file.exists("UCI HAR Dataset/test/subject_test.txt")
	) { 
  stop("One or more dataset not found.")
}else{	
	#loading library
	library(dplyr)

	##### item 2 first - to save memory and CPU
		#load only required features
		features <- read.table("UCI HAR Dataset/features.txt", as.is=TRUE)
		features_index <- grep("mean|std",features[,2])
		features <-  features[features_index,2]

	########### item 1 
		#load activity labels
		activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", as.is=TRUE)

		#load training data
		trainData <- read.table("UCI HAR Dataset/train/X_train.txt")[features_index]
		trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
		trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
		trainData <- cbind(trainSubject,trainLabels,trainData)

		#load test data
		testData <- read.table("UCI HAR Dataset/test/X_test.txt")[features_index]
		testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
		testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
		testData <- cbind(testSubject,testLabels,testData)

		#Merging train and test data
		data <- rbind(trainData,testData)

	######## item 4
		#formating names
		features <- gsub("[-()]","",features,)
		#setting columns names
		colnames(data) <- c("subject", "activity", features)

	#change subject an activity to factor
		data$subject <- as.factor(data$subject)
		#include item 3
		data$activity <- factor(data$activity, levels = activityLabels[,1], labels = activityLabels[,2]) 

	######## item 5
		#calculate the average of each variable for each activity and each subject
		dataMeans <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

		#save independent tidy data
		write.table(dataMeans, "tidy.txt", row.names = FALSE, quote = FALSE)
}

	
