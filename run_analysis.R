#1. Merge training and test sets to create one data set (done in steps A-D)
rm(list = ls())
#A.Load data
  if (! file.exists("Dataset.zip")) {
    download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  destfile="UCI HAR Dataset.zip", method="auto")
    unzip("UCI HAR Dataset.zip")
    file.remove("UCI HAR Dataset.zip")
  }

#B. Use read.table to read relevant files
xtrain<- read.table("UCI HAR Dataset/train/X_train.txt") 
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")


#C. Find dimensions to see how to combine data
dim(xtrain)
dim(ytrain)
dim(subjecttrain)

dim(xtest)
dim(ytest)
dim(subjecttest)


#D. Merge training and test sets to create one data set 
x<-rbind(xtrain, xtest)
y<-rbind(ytrain, ytest)
s<-rbind(subjecttrain,subjecttest)
oneDataset<-cbind(s,y,x)   ##<<<--traning and test sets finally merged to create one data set


#2. Extract only the measurements on the mean and standard deviation for each measurement 
#Note: See ReadMe for specific measurements chosen. Make oneDatasetExtract a character vector 
#to prevent list errors.
oneDatasetExtract<- as.vector(subset(x,select=c(V1,V2,V3,V4,V5,V6, V41,V42,V43,V44,V45,V46,
                      V81,V82,V83,V84,V85,V86,V121,V122,V123,V124,V125,V126,
                      V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,
                      V228, V240,V241,V253,V254,V266,V267,V268,V269,V270,V271,
                      V345, V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,
                      V429,V503,V504,V516,V517,V529,V530,V542,V543,V555,V556,
                      V557,V558,V559,V560,V561)))


#3.  Use descriptive activity names to name the activities in the data set 
#(done in steps A-C)

#A. Use read.table to read activities file
activities<- read.table("UCI HAR Dataset/activity_labels.txt")

#B. Set second column name to "Activity" (as second column represents activity) 
#so that we can work with the activity code and have actual activity names appear 
#as opposed to code numbers
colnames(oneDataset)[2] <- "Activity"

#C. Convert the activity codes (numbers) to their associated descriptive activity names
#so that activity names, as written in second column of activities file, appear in the dataset.
oneDataset$Activity <- factor(oneDataset$Activity, 
                                     levels=c(1,2,3,4,5,6), labels=activities[,2])                 


#4.  Appropriately label the data set with descriptive variable names. (done in steps A-H)

#A. Load data.table package to setnames
library(data.table)

#B. Set first column name to "Subject" (as first column represents subject) 
colnames(oneDataset)[1] <- "Subject"

#C. Check names to see that the first two columns are properly labeled 
#Subject and Activity, repecitvely.
names(oneDataset)

#D. Delete extra columns_keeping only first two columns_so that we are working
#with only Subject ad Activity
oneDataset2<-oneDataset[,1:2]

#E. Check names to make sure only Subject and Activity show for new data frame
names(oneDataset2)

#F. Column bind oneDataset2(Subject, Activity) to oneDatasetExtract (Extracted variables for 
#which we want the mean and standard deviation). This creates our working dataframe.
DT<-cbind(oneDataset2,oneDatasetExtract)

#G. Check for NAs, column names, and dimensions so that only non-missing data included, 
#and we can see column names and dimensions. Knowing column names and dimensions will 
#help us in the next step to setnames. 
all(!is.na(DT))
names(DT)
dim(DT)

#H. Set descriptive variable names. We now have a tidy dataset DT.
setnames(DT, 1:75, c("Subject","Activity","TimeBodyAccelerationMeanOnXAxis","TimeBodyAccelerationMeanOnY-Axis", "TimeBodyAccelerationMeanOnZ-Axis",
                                    "TimeBodyAccelerationStandardDeviationOnX-Axis", "TimeBodyAccelerationStandardDeviationOnY-Axis",
                                    "TimeBodyAccelerationStandardDeviationOnZ-Axis", "TimeGravityAccelerationMeanOnX-Axis", "TimeGravityAccelerationMeanOnY-Axis",
                                    "TimeGravityAccelerationMeanOnZ-Axis", "TimeGravityAccelerationStandardDeviationOnX-Axis", 
                                    "TimeGravityAccelerationStandardDeviationOnY-Axis", "TimeGravityAccelerationStandardDeviationOnZ-Axis", 
                                    "TimeBodyAccelerationJerkMeanOnX-Axis", "TimeBodyAccelerationJerkMeanOnY-Axis", "TimeBodyAccelerationJerkMeanOnZ-Axis",
                                    "TimeBodyAccelerationJerkStandardDeviationOnX-Axis", "TimeBodyAccelerationJerkStandardDeviationOnY-Axis", 
                                    "TimeBodyAccelerationJerkStandardDeviationOnZ-Axis","TimeBodyGyroscopeMeanOnX-Axis", 
                                    "TimeBodyGyroscopeMeanOnY-Axis", "TimeBodyGyroscopeMeanOnZ-Axis",
                                    "TimeBodyGyroscopeStandardDeviationOnX-Axis", "TimeBodyGyroscopeStandardDeviationOnY-Axis",
                                    "TimeBodyGyroscopeStandardDeviationOnZ-Axis", "TimeBodyGyroscopeJerkMeanOnX-Axis", "TimeBodyGyroscopeJerkMeanOnY-Axis", 
                                    "TimeBodyGyroscopeJerkMeanOnZ-Axis","TimeBodyGyroscopeJerkStandardDeviationOnX-Axis", "TimeBodyGyroscopeJerkStandardDeviationOnY-Axis", 
                                    "TimeBodyGyroscopeJerkStandardDeviationOnZ-Axis", "TimeBodyAccelerationMagnitudeMean", "TimeBodyAccelerationMagnitudeStandardDeviation", 
                                    "TimeGravityAccelerationMagnitudeMean", "TimeGravityAccelerationMagnitudeStandardDeviation", "TimeBodyAccelerationJerkMagnitudeMean", 
                                    "TimeBodyAccelerometerJerkMagnitudeStandardDeviation", "TimeBodyGyroscopeMagnitudeMean", "TimeBodyGyroscopeMagnitudeStandardDeviation", 
                                    "TimeBodyGyroscopeJerkMagnitudeMean", "TimeBodyGyroscopeMagnitudeJerkStandardDeviation", "FrequencyBodyAccelerometerMeanOnX-Axis", 
                                    "FrequencyBodyAccelerometerMeanOnY-Axis", "FrequencyBodyAccelerometerMeanOnZ-Axis",
                                    "FrequencyBodyAccelerometerStandardDeviationOnX-Axis", "FrequencyBodyAccelerometerStandardDeviationOnY-Axis",
                                    "FrequencyBodyAccelerometerStandardDeviationOnZ-Axis","FrequencyBodyAccelerometerJerkMeanOnX-Axis", "FrequencyBodyAccelerometerJerkMeanOnY-Axis", 
                                    "FrequencyBodyAccelerometerJerkMeanOnZ-Axis","FrequencyBodyAccelerometerJerkStandardDeviationOnX-Axis", 
                                    "FrequencyBodyAccelerometerJerkStandardDeviationOnY-Axis","FrequencyBodyAccelerometerJerkStandardDeviationOnZ-Axis", "FrequencyBodyGyroscopeMeanOnX-Axis", 
                                    "FrequencyBodyGyroscopeMeanOnY-Axis", "FrequencyBodyGyroscopeMeanOnZ-Axis","FrequencyBodyGyroscopeStandardDeviationOnX-Axis", 
                                    "FrequencyBodyGyroscopeStandardDeviationOnY-Axis","FrequencyBodyGyroscopeStandardDeviationOnZ-Axis", "FrequencyBodyAccelerometerMagnitudeMean", 
                                    "FrequencyBodyAccelerometerMagnitudeStandardDeviation","FrequencyBodyBodyAccelerometerJerkMagnitudeMean", 
                                    "FrequencyBodyBodyAccelerometerJerkMagnitudeStandardDeviation", "FrequencyBodyBodyGyroscopeMagnitudeMean", 
                                    "FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation", "FrequencyBodyBodyGyroscopeJerkMagnitudeMean", "FrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation", 
                                    "Angle(TimeBodyAccelerometerMean,Gravity)", "Angle(TimeBodyAccelerometerJerkMean),GravityMean)", "Angle(TimeBodyGyroMean,GravityMean)", "Angle(TimeBodyGyroJerkMean,GravityMean)",
                                    "Angle(X-Axis,GravityMean)", "Angle(Y-Axis,GravityMean)", "Angle(Z-Axis,GravityMean)"))


#5.  From the data set in step 4, create a second, independent tidy data set with the 
#average of each variable for each activity and each subject. 
#Note: Save as text file using write.table and row.name=FALSE (done in A-c)

#A. Load reshape2 package to melt and dcast
library(reshape2)
   
#B. Melt and dcast data to separate ID variables (subject and activity) from 
#measured variables (all of the features that we extracted), and take the mean of 
#each of those measured variables. dataMelt2 will be our second tidy dataset.
dataMelt <- melt(DT, id.vars = c("Subject", "Activity"))
dataMelt2 <- dcast(dataMelt, Subject + Activity ~ variable, fun.aggregate = mean, 
             na.rm = TRUE)

#C. Save the second tidy dataset (dataMelt2) as a text file created with write.table()
#using row.name=FALSE
write.table(dataMelt2, file = "tidydata22.txt",row.name=FALSE)
  


