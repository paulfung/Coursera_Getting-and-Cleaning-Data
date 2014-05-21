  ######################################################################
  # Read and combine x_train.txt and x_test.txt
  ######################################################################
  xTrainContent <- read.table(".\\UCI HAR Dataset\\train\\x_train.txt")
  xTestContent <- read.table(".\\UCI HAR Dataset\\test\\x_test.txt")
  xContent <- rbind(xTrainContent, xTestContent)
  rm(xTrainContent)
  rm(xTestContent)
  
  ######################################################################
  # Read and combine y_train.txt and y_test.txt
  ######################################################################
  yTrainContent <- scan(".\\UCI HAR Dataset\\train\\y_train.txt")
  yTestContent <- scan(".\\UCI HAR Dataset\\test\\y_test.txt")
  yContent <- c(yTrainContent, yTestContent)
  rm(yTrainContent)
  rm(yTestContent)
  
  
  ######################################################################
  # Read and combine subject_train.txt and subject_test.txt
  ######################################################################
  subjectTrainContent <- scan(".\\UCI HAR Dataset\\train\\subject_train.txt")
  subjectTestContent <- scan(".\\UCI HAR Dataset\\test\\subject_test.txt")
  subjectContent <- c(subjectTrainContent, subjectTestContent)
  rm(subjectTrainContent)
  rm(subjectTestContent)
  
  
  ######################################################################
  # Read features.txt and activity_labels.txt
  ######################################################################
  featuresContent <- read.table(".\\UCI HAR Dataset\\features.txt", col.names=c("idx", "feature"))
  activityLabel <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", col.names=c("idx", "activity"))
  
  
  ######################################################################
  # Extract features and datathat are related to mean and standard 
  # deviation
  ######################################################################
  featuresContentFilter <- with(featuresContent, grepl("mean\\(\\)",featuresContent$feature) | grepl("std\\(\\)",featuresContent$feature))
  featuresContent <- as.vector(featuresContent[featuresContentFilter, "feature"])
  xContent <- xContent[,featuresContentFilter]
  
  
  ######################################################################
  # Combine the data into a table, sort and fixes the col/row names
  ######################################################################
  tidyData <- xContent
  featuresContent <- gsub("-", ".", featuresContent)
  colnames(tidyData) <- featuresContent
  tidyData <- aggregate(tidyData, list(Subject=subjectContent, Activity=yContent), mean)
  activityLabel$activity <- gsub("_", ".", activityLabel$activity)
  tidyData$Activity <- activityLabel[tidyData$Activity, "activity"]
  tidyData <- tidyData[order(tidyData$Subject),]
  rownames(tidyData) <- 1:nrow(tidyData)
  
  ######################################################################
  # Output to file
  ###################################################################### 
  write.table(tidyData, "tidyData.txt", sep="\t", row.names=FALSE)
