# Getting and Cleaning Data Course Project
Course Project for Getting and Cleaning Data Class

The main objective of the course project was to create two tidy datasets_printing the second. 
In order to accomplish the task, I used R code and named the file run_analysis.R. This README outlines how
run_analysis.R created the tidy datasets in five main steps. Then, the README concludes.

##Five Main Steps to Tidy Data
In five main steps, this section describes what run_analysis.R did. Within the description, the section
explains how all of the scripts work and how they are connected. 

###1. Merge training and test sets to create one data set 
	*A. Load data
	*B. Use read.table to read relevant files
	*C. Find dimensions to see how to combine data
	*D. Merge training and test sets to create one data set

With the goal of merging training and test sets to create one data set, on June 2, 2015, data were loaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
Relevant files were read ("UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/train/y_train.txt", 
"UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/test/X_test.txt","UCI HAR Dataset/test/y_test.txt",
"UCI HAR Dataset/test/subject_test.txt") and set to table names. The tables' dimensions were found in order
to see how data should be combined. Data were merged using rbind and cbind.

###2. Extract only the measurements on the mean and standard deviation for each measurement 
Note: Make oneDatasetExtract (the one dataset extraction) a character vector to prevent list errors.

Manually, for each measurement, only measurements on mean and standard deviation were extracted. I chose not 
to include mean frequency. As such, I did not use grep as it would have extracted everything with mean and 
standard deviation to include mean frequency. The following 73 features were selected:

	*1 tBodyAcc-mean()-X
	*2 tBodyAcc-mean()-Y
	*3 tBodyAcc-mean()-Z
	*4 tBodyAcc-std()-X
	*5 tBodyAcc-std()-Y
	*6 tBodyAcc-std()-Z
	*41 tGravityAcc-mean()-X
	*42 tGravityAcc-mean()-Y
	*43 tGravityAcc-mean()-Z
	*44 tGravityAcc-std()-X
	*45 tGravityAcc-std()-Y
	*46 tGravityAcc-std()-Z
	*81 tBodyAccJerk-mean()-X
	*82 tBodyAccJerk-mean()-Y
	*83 tBodyAccJerk-mean()-Z
	*84 tBodyAccJerk-std()-X
	*85 tBodyAccJerk-std()-Y
	*86 tBodyAccJerk-std()-Z
	*121 tBodyGyro-mean()-X
	*122 tBodyGyro-mean()-Y
	*123 tBodyGyro-mean()-Z
	*124 tBodyGyro-std()-X
	*125 tBodyGyro-std()-Y
	*126 tBodyGyro-std()-Z
	*161 tBodyGyroJerk-mean()-X
	*162 tBodyGyroJerk-mean()-Y
	*163 tBodyGyroJerk-mean()-Z
	*164 tBodyGyroJerk-std()-X
	*165 tBodyGyroJerk-std()-Y
	*166 tBodyGyroJerk-std()-Z
	*201 tBodyAccMag-mean()
	*202 tBodyAccMag-std()
	*214 tGravityAccMag-mean()
	*215 tGravityAccMag-std()
	*227 tBodyAccJerkMag-mean()
	*228 tBodyAccJerkMag-std()
	*240 tBodyGyroMag-mean()
	*241 tBodyGyroMag-std()
	*253 tBodyGyroJerkMag-mean()
	*254 tBodyGyroJerkMag-std()
	*266 fBodyAcc-mean()-X
	*267 fBodyAcc-mean()-Y
	*268 fBodyAcc-mean()-Z
	*269 fBodyAcc-std()-X
	*270 fBodyAcc-std()-Y
	*271 fBodyAcc-std()-Z
	*345 fBodyAccJerk-mean()-X
	*346 fBodyAccJerk-mean()-Y
	*347 fBodyAccJerk-mean()-Z
	*348 fBodyAccJerk-std()-X
	*349 fBodyAccJerk-std()-Y
	*350 fBodyAccJerk-std()-Z
	*424 fBodyGyro-mean()-X
	*425 fBodyGyro-mean()-Y
	*426 fBodyGyro-mean()-Z
	*427 fBodyGyro-std()-X
	*428 fBodyGyro-std()-Y
	*429 fBodyGyro-std()-Z
	*503 fBodyAccMag-mean()
	*504 fBodyAccMag-std()
	*516 fBodyBodyAccJerkMag-mean()
	*517 fBodyBodyAccJerkMag-std()
	*529 fBodyBodyGyroMag-mean()
	*530 fBodyBodyGyroMag-std()
	*542 fBodyBodyGyroJerkMag-mean()
	*543 fBodyBodyGyroJerkMag-std()
	*555 angle(tBodyAccMean,gravity)
	*556 angle(tBodyAccJerkMean),gravityMean)
	*557 angle(tBodyGyroMean,gravityMean)
	*558 angle(tBodyGyroJerkMean,gravityMean)
	*559 angle(X,gravityMean)
	*560 angle(Y,gravityMean)
	*561 angle(Z,gravityMean)
 
###3.  Use descriptive activity names to name the activities in the data set 
	*A. Use read.table to read activities file
	*B. Set second column name to "Activity" (as second column represents activity) 
		so that we can work with the activity code and have actual activity names appear 
		as opposed to code numbers
	*C. Convert the activity codes (numbers) to their associated descriptive activity names
		so that activity names, as written in second column of activities file, appear in the dataset.

To descriptively name the activities in the data set, the activities file 
("UCI HAR Dataset/activity_labels.txt") was read. The second column of the merged dataset 
represented activity so it was named "Activity". Then, the activity codes were converted to their descriptive 
activity names as found in the second column of the activities file:

   *1 WALKING
   *2 WALKING_UPSTAIRS
   *3 WALKING_DOWNSTAIRS
   *4 SITTING
   *5 STANDING
   *6 LAYING   

###4.  Appropriately label the data set with descriptive variable names. 
	*A. Load data.table package to setnames
	*B. Set first column name to "Subject" (as first column represents subject) 
	*C. Check names to see that the first two columns are properly labeled 
		Subject and Activity, respectively.
	*D. Delete extra columns_keeping only first two columns_so that we are working
		with only Subject ad Activity
	*E. Check names to make sure only Subject and Activity show for new data frame
	*F. Column bind new data frame (oneDataset2) to extracted variables from step 2 (oneDatasetExtract). 
		This creates our working dataframe.
	*G. Check for NAs, column names, and dimensions so that only non-missing data included, 
		and we can see column names and dimensions. Knowing column names and dimensions will 
		help us in the next step to setnames. 
	*H. Set descriptive variable names. We now have a tidy dataset DT.        

To appropriately label the data set with descriptive variable names, the data.table package was loaded so 
that setnames could be used later. The first column of the merged dataset represented subject so it was 
named "Subject". Column names were checked to ensure that the first two columns were properly labeled
Subject and Activity, respectively. Only the first two columns were kept, and the names were checked 
to make sure that the new data frame only had Subject and Activity. Using cbind, the new data frame was 
merged with the extracted features from step 2. Then, NAs, column names, and dimensions were checked 
to include only non-missing data and show us the column names and dimensions so that we could use
setnames to set the descriptive variable names. Once setnames used, we, now, gave a tidy dataset.

###5.  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Note: Save as text file using write.table and row.name=FALSE 

	*A. Load reshape2 package to melt and dcast 
	*B. Melt and dcast data to separate ID variables (subject and activity) from 
		measured variables (all of the features that we extracted), and take the mean of 
		each of those measured variables. dataMelt2 will be our second tidy dataset.
	*C. Save the second tidy dataset (dataMelt2) as a text file  ("tidydata22.txt")created with write.table()
		using row.name=FALSE

In order to create a tidy dataset which depicts the average of each variable for each activity and subject,
the tidy dataset from step 4H (DT) was used. Reshape2 was loaded so that DT could be melted and dcast. 
DT was melted and dcast so that ID variables (subject and activity) were separated from the mean of the extracted features.
This dataset formed our second tidy dataset (dataMelt2), and it was saved as a text file ("tidydata22.txt").
  
##Conclusion 
After run_analysis.R created the "tidydata22.txt", this README and a CodeBook 
(which highlighted the variables, data, and transformations) were written. A github repository called 
GettingandCleaningDataCourseProject was created, and the run_analysis.R, README.md, and 
CodeBook.md were pushed to the repository. "tidydata22.txt" and a link to GitHub were 
posted in the course room.

##References
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions
https://class.coursera.org/getdata-015/forum/thread?thread_id=27