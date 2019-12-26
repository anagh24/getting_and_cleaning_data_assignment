The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project's definition.

   1. ### Download the dataset
       
       * Dataset downloaded and extracted under the folder called UCI HAR Dataset
   
   2. ### Assign each data to variables
   
       * features <- features.txt : 561 rows, 2 columns
         #### The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
       * activities <- activity_labels.txt : 6 rows, 2 columns
         #### List of activities performed when the corresponding measurements were taken and their labels
       * subject_test <- test/subject_test.txt : 2947 rows, 1 column
         #### contains test data of 9/30 volunteer test subjects being observed
       * x_test <- test/X_test.txt : 2947 rows, 561 columns
         #### contains recorded features test data
       * y_test <- test/y_test.txt : 2947 rows, 1 columns
         #### contains test data of activities'label
       * subject_train <- test/subject_train.txt : 7352 rows, 1 column
         #### contains train data of 21/30 volunteer subjects being observed
       * x_train <- test/X_train.txt : 7352 rows, 561 columns
         #### contains recorded features train data
       * y_train <- test/y_train.txt : 7352 rows, 1 columns
         #### contains train data of activities'label
   
   3. ### Merges the training and the test sets to create one data set
   
       * data (10299 rows, 561 columns) is created by merging x_train and x_test using **rbind()** function
       * label (10299 rows, 1 column) is created by merging y_train and y_test using **rbind()** function
       * Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using **rbind()** function
       * Mdata (10299 rows, 563 column) is created by merging Subject, Y and X using **cbind()** function
   
   4. ### Extracts only the measurements on the mean and standard deviation for each measurement
       
       * Tdata (10299 rows, 88 columns) is created by subsetting Mdata, selecting only columns: subject, code and the variables obtained by applying the mean() and standard deviation() to each of the signals given below.
   
          + tBodyAcc-XYZ
          + tGravityAcc-XYZ
          + tBodyAccJerk-XYZ
          + tBodyGyro-XYZ
          + tBodyGyroJerk-XYZ
          + tBodyAccMag
          + tGravityAccMag
          + tBodyAccJerkMag
          + tBodyGyroMag
          + tBodyGyroJerkMag
          + fBodyAcc-XYZ
          + fBodyAccJerk-XYZ
          + fBodyGyro-XYZ
          + fBodyAccMag
          + fBodyAccJerkMag
          + fBodyGyroMag
          + fBodyGyroJerkMag
   
       * Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
             
          + gravityMean
          + tBodyAccMean
          + tBodyAccJerkMean
          + tBodyGyroMean
          + tBodyGyroJerkMean        
           
   5. ### Uses descriptive activity names to name the activities in the data set
   
       * Entire numbers in labels column of the Tdata replaced with corresponding activity taken from second column of the activities variable
   
   6. ### Appropriately labels the data set with descriptive variable names
   
       * labels column in TidyData renamed into activities
       * All Acc in column's name replaced by Accelerometer
       * All Gyro in column's name replaced by Gyroscope
       * All BodyBody in column's name replaced by Body
       * All Mag in column's name replaced by Magnitude
       * All start with character f in column's name replaced by Frequency
       * All start with character t in column's name replaced by Time
   
   7. ### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
   
       * Tdata2 (180 rows, 88 columns) is created by sumarizing Tdata2 taking the means of each variable for each activity and each subject, after groupped by subject and activity.
       * Export Tdata2 into Result.txt file.
   
   
   
   
   
   
   

   




