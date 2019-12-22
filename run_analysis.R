# 1. Merges the training and the test sets to create one data set.

# Merging the training and the test data sets to create one data set.

data <- rbind(x_train, x_test)

# Merging the training labels and the test labels sets to create one data set.

label <- rbind(y_train, y_test)

# Merging the training subject and the test subject sets to create one data set.

Subject <- rbind(subject_train, subject_test)

# Mergibg the all the resultant data sets

Mdata <- cbind(Subject, label, data)



# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Tdata <- Mdata[ , grepl("subject|labels|mean|std", names(Mdata))]


# 3 Uses descriptive activity names to name the activities in the data set.

Tdata$labels <- activities[Tdata$labels, 2]

# 4. Appropriately labels the data set with descriptive variable names.

names(Tdata)[2] = "activity"
names(Tdata)<-gsub("Acc", "Accelerometer", names(Tdata))
names(Tdata)<-gsub("Gyro", "Gyroscope", names(Tdata))
names(Tdata)<-gsub("BodyBody", "Body", names(Tdata))
names(Tdata)<-gsub("Mag", "Magnitude", names(Tdata))
names(Tdata)<-gsub("^t", "Time", names(Tdata))
names(Tdata)<-gsub("^f", "Frequency", names(Tdata))
names(Tdata)<-gsub("tBody", "TimeBody", names(Tdata))
names(Tdata)<-gsub("-mean()", "Mean", names(Tdata), ignore.case = TRUE)
names(Tdata)<-gsub("-std()", "STD", names(Tdata), ignore.case = TRUE)
names(Tdata)<-gsub("-freq()", "Frequency", names(Tdata), ignore.case = TRUE)
names(Tdata)<-gsub("angle", "Angle", names(Tdata))
names(Tdata)<-gsub("gravity", "Gravity", names(Tdata))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



Tdata2 <- aggregate(Tdata[,3]~subject+activity,Tdata,mean)

for(i in 4:88){
  
  dummy <-  aggregate(Tdata[,i]~subject+activity,Tdata,mean)
  
   Tdata2 <- cbind(Tdata2,dummy[3])
}

names(Tdata2) <- names(Tdata)

write.table(Tdata2, "Result.txt", row.name=FALSE)



