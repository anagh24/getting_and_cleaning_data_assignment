fname <- "getting_and_cleaning.zip"

# Checking if archieve already exists.

if (!file.exists(fname)){
  
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(URL, fname)
}  

# Checking whether the folder exists or not.

if (!file.exists("UCI HAR Dataset")) { 
  
  unzip(fname) 
}



# assigning all the required datasets

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("sl.no","methods"))

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("labels", "activity_names"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$methods)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "labels")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$methods)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "labels")

