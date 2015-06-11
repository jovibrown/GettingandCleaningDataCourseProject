#Getting and Cleaning Data Course Project
This codebook highlights the variables, data, and transformations that were performed to clean the data.  
For the code that generated this project's tidy dataset("tidydata22.txt"), see run_analysis.R.
Also, the README.md contains a pictorial overview of the five main steps run_analysis.R
used to create "tidydata22.txt".

#Variables
##Subject
Thirty volunteers (age 19-48) performed 6 activities each, and each volunteer was given a 
subject ID 1-30. Subjects were represented in the first column of "tidydata22.txt".

##Activity
Each volunteer performed 6 activities while wearing a smartphone (Samsung Galaxy S II) on the waist. 
Activities were represented in the second column of "tidydata22.txt". Activities were coded 1-6 as follows:

   *1 WALKING
   *2 WALKING_UPSTAIRS
   *3 WALKING_DOWNSTAIRS
   *4 SITTING
   *5 STANDING
   *6 LAYING   

##Features
Using an accelerometer and gyroscope, calculations were measured on features, and their means 
were represented in the third through seventy-fifth columns of "tidyadata22.txt". 3-axial linear acceleration 
and 3-axial angular velocity were captured at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) 
were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). A filter with 0.3 Hz cutoff frequency was used. 

For each recordThe following 
73 features were used:

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

#Data
As has been indicated, the final tidy dataset was named "tidydata22.txt". Its dimensions are 181x75.

#Transformations
Feature names were changed to be more descriptive. They were changed as follows:

   *t-> total
   *f-> frequency
   *Acc-> Accelerometer
   *Gyro-> Gyroscope
   *mean()-> mean on
   *std()-> standard deviation on
   *-X-> X-Axis
   *-Y-> Y-Axis
   *-Z-> Z-Axis

#References
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
