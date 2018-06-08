# Codebook
### By Julien Nabonne

This document is about the Assignement for the JHU Data Cleaning course on Coursera.  
More info on [the Coursera assignement page](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

---
## Other related file
* `run_analysis.R` R script performing the actions required to get a tidy data set from original data project
* `Readme.md` describing the action performed on the above script
* `tidydataset.txt` resulting tidy data set file from execution of above script

---
## Context and initial Project Description
The original experiments has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope to captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually (http://www.youtube.com/watch?v=XOEN9W05_4A)

---
## Tidy Data Set Structure
The Tidy Data Set resulting from the execution of `run_analysis.R` contains 68 fields.

The first 2 are identifiers for the `activity` performed and the `subject_id`.  
There were 30 subjects in the experiments so ids are in [1-30] range.  
Activities are the following and were coded as given in parenthesis in the original data set (see Credits below):
* `WALKING` (1)
* `WALKING_UPSTAIRS` (2)
* `WALKING_DOWNSTAIRS` (3)
* `SITTING` (4)
* `STANDING` (5)
* `LAYING` (6)

The following 66 columns are measures of mean or standard deviation for each activity and each subjects (ie. they have been computed from orginal measures by aggregating by activity and subject then applying the mean).  
Below is the list of all 66 measures:
1. `timeBodyAcceleration-mean-X`
1. `timeBodyAcceleration-mean-Y`
1. `timeBodyAcceleration-mean-Z`
1. `timeBodyAcceleration-stdDev-X`
1. `timeBodyAcceleration-stdDev-Y`
1. `timeBodyAcceleration-stdDev-Z`
1. `timeGravityAcceleration-mean-X`
1. `timeGravityAcceleration-mean-Y`
1. `timeGravityAcceleration-mean-Z`
1. `timeGravityAcceleration-stdDev-X`
1. `timeGravityAcceleration-stdDev-Y`
1. `timeGravityAcceleration-stdDev-Z`
1. `timeBodyAccelerationJerk-mean-X`
1. `timeBodyAccelerationJerk-mean-Y`
1. `timeBodyAccelerationJerk-mean-Z`
1. `timeBodyAccelerationJerk-stdDev-X`
1. `timeBodyAccelerationJerk-stdDev-Y`
1. `timeBodyAccelerationJerk-stdDev-Z`
1. `timeBodyGyroscope-mean-X`
1. `timeBodyGyroscope-mean-Y`
1. `timeBodyGyroscope-mean-Z`
1. `timeBodyGyroscope-stdDev-X`
1. `timeBodyGyroscope-stdDev-Y`
1. `timeBodyGyroscope-stdDev-Z`
1. `timeBodyGyroscopeJerk-mean-X`
1. `timeBodyGyroscopeJerk-mean-Y`
1. `timeBodyGyroscopeJerk-mean-Z`
1. `timeBodyGyroscopeJerk-stdDev-X`
1. `timeBodyGyroscopeJerk-stdDev-Y`
1. `timeBodyGyroscopeJerk-stdDev-Z`
1. `timeBodyAccelerationMagnitude-mean`
1. `timeBodyAccelerationMagnitude-stdDev`
1. `timeGravityAccelerationMagnitude-mean`
1. `timeGravityAccelerationMagnitude-stdDev`
1. `timeBodyAccelerationJerkMagnitude-mean`
1. `timeBodyAccelerationJerkMagnitude-stdDev`
1. `timeBodyGyroscopeMagnitude-mean`
1. `timeBodyGyroscopeMagnitude-stdDev`
1. `timeBodyGyroscopeJerkMagnitude-mean`
1. `timeBodyGyroscopeJerkMagnitude-stdDev`
1. `freqBodyAcceleration-mean-X`
1. `freqBodyAcceleration-mean-Y`
1. `freqBodyAcceleration-mean-Z`
1. `freqBodyAcceleration-stdDev-X`
1. `freqBodyAcceleration-stdDev-Y`
1. `freqBodyAcceleration-stdDev-Z`
1. `freqBodyAccelerationJerk-mean-X`
1. `freqBodyAccelerationJerk-mean-Y`
1. `freqBodyAccelerationJerk-mean-Z`
1. `freqBodyAccelerationJerk-stdDev-X`
1. `freqBodyAccelerationJerk-stdDev-Y`
1. `freqBodyAccelerationJerk-stdDev-Z`
1. `freqBodyGyroscope-mean-X`
1. `freqBodyGyroscope-mean-Y`
1. `freqBodyGyroscope-mean-Z`
1. `freqBodyGyroscope-stdDev-X`
1. `freqBodyGyroscope-stdDev-Y`
1. `freqBodyGyroscope-stdDev-Z`
1. `freqBodyAccelerationMagnitude-mean`
1. `freqBodyAccelerationMagnitude-stdDev`
1. `freqBodyAccelerationJerkMagnitude-mean`
1. `freqBodyAccelerationJerkMagnitude-stdDev`
1. `freqBodyGyroscopeMagnitude-mean`
1. `freqBodyGyroscopeMagnitude-stdDev`
1. `freqBodyGyroscopeJerkMagnitude-mean`
1. `freqBodyGyroscopeJerkMagnitude-stdDev`

**Notes:**
* features are normalized and bounded within [-1,1]
* Units are in radian/second for time measures, in hertz for frequency measures

---
## Tidy Data Set Content
The data set contents 180 observations (6 activities x 30 subjects) of the 66 variables (means of each average and standard deviation) from the original UCI HAR dataset.  
The first line of the file consists of the header with the variables names.

---
### Credits for original data set
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

---
**Thanks for reading this file until the end!**
