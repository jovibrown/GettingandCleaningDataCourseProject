#Getting and Cleaning Data Course Project
This codebook highlights the variables, data, and transformations that were performed to clean the data.  
For the code that generated this project's tidy dataset(tidydata22.txt), see run_analysis.R.
Also, the README.md contains a pictorial overview of the five main steps run_analysis.R
used to create tidydata22.txt.

#Variables
##Subject
Thirty volunteers (age 19-48) performed 6 activities each, and each volunteer was given a 
subject ID 1-30. Subjects were represented in the first column of tidydata22.txt.

##Activity
Each volunteer performed 6 activities while wearing a smartphone (Samsung Galaxy S II) on the waist. 
Activities were represented in the second column of tidydata22.txt. Activities were coded 1-6 as follows:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING 

##Features
Using an accelerometer and gyroscope, calculations were measured on features, and their means 
were represented in the third through seventy-fifth columns of tidyadata22.txt. The following 
73 features were used:

1.	1 tBodyAcc-mean()-X
2.	2 tBodyAcc-mean()-Y
3.	3 tBodyAcc-mean()-Z
4.	4 tBodyAcc-std()-X
5.	5 tBodyAcc-std()-Y
6.	6 tBodyAcc-std()-Z
7.	41 tGravityAcc-mean()-X
8.	42 tGravityAcc-mean()-Y
9.	43 tGravityAcc-mean()-Z
10.	44 tGravityAcc-std()-X
11.	45 tGravityAcc-std()-Y
12.	46 tGravityAcc-std()-Z
13.	81 tBodyAccJerk-mean()-X
14.	82 tBodyAccJerk-mean()-Y
15.	83 tBodyAccJerk-mean()-Z
16.	84 tBodyAccJerk-std()-X
17.	85 tBodyAccJerk-std()-Y
18.	86 tBodyAccJerk-std()-Z
19.	121 tBodyGyro-mean()-X
20.	122 tBodyGyro-mean()-Y
21.	123 tBodyGyro-mean()-Z
22.	124 tBodyGyro-std()-X
23.	125 tBodyGyro-std()-Y
24.	126 tBodyGyro-std()-Z
25.	161 tBodyGyroJerk-mean()-X
26.	162 tBodyGyroJerk-mean()-Y
27.	163 tBodyGyroJerk-mean()-Z
28.	164 tBodyGyroJerk-std()-X
29.	165 tBodyGyroJerk-std()-Y
30.	166 tBodyGyroJerk-std()-Z
31.	201 tBodyAccMag-mean()
32.	202 tBodyAccMag-std()
33.	214 tGravityAccMag-mean()
34.	215 tGravityAccMag-std()
35.	227 tBodyAccJerkMag-mean()
36.	228 tBodyAccJerkMag-std()
37.	240 tBodyGyroMag-mean()
38.	241 tBodyGyroMag-std()
39.	253 tBodyGyroJerkMag-mean()
40.	254 tBodyGyroJerkMag-std()
41.	266 fBodyAcc-mean()-X
42.	267 fBodyAcc-mean()-Y
43.	268 fBodyAcc-mean()-Z
44.	269 fBodyAcc-std()-X
45.	270 fBodyAcc-std()-Y
46.	271 fBodyAcc-std()-Z
47.	345 fBodyAccJerk-mean()-X
48.	346 fBodyAccJerk-mean()-Y
49.	347 fBodyAccJerk-mean()-Z
50.	348 fBodyAccJerk-std()-X
51.	349 fBodyAccJerk-std()-Y
52.	350 fBodyAccJerk-std()-Z
53.	424 fBodyGyro-mean()-X
54.	425 fBodyGyro-mean()-Y
55.	426 fBodyGyro-mean()-Z
56.	427 fBodyGyro-std()-X
57.	428 fBodyGyro-std()-Y
58.	429 fBodyGyro-std()-Z
59.	503 fBodyAccMag-mean()
60.	504 fBodyAccMag-std()
61.	516 fBodyBodyAccJerkMag-mean()
62.	517 fBodyBodyAccJerkMag-std()
63.	529 fBodyBodyGyroMag-mean()
64.	530 fBodyBodyGyroMag-std()
65.	542 fBodyBodyGyroJerkMag-mean()
66.	543 fBodyBodyGyroJerkMag-std()
67.	555 angle(tBodyAccMean,gravity)
68.	556 angle(tBodyAccJerkMean),gravityMean)
69.	557 angle(tBodyGyroMean,gravityMean)
70.	558 angle(tBodyGyroJerkMean,gravityMean)
71.	559 angle(X,gravityMean)
72.	560 angle(Y,gravityMean)
73.	561 angle(Z,gravityMean)

#Data
As has been indicated, the final tidy dataset was named "tidydata22.txt". Its dimensions are 181x75.

#Transformations
Feature names were changed to be more descriptive. They were changed as follows:

t-> total
f-> frequency
Acc-> Accelerometer
Gyro-> Gyroscope
mean()-> mean on
std()-> standard deviation on
-X-> X-Axis
-Y-> Y-Axis
-Z-> Z-Axis

#References
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
