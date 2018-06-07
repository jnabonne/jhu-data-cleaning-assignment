# Loading required libs
library(data.table)
library(dplyr)
library(stringr)

## This section download and unzip the project data but has been disable for security reason
## (IMHO that should be manualy be done and not hidden in a script...)
# zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(zipURL, "UCI HAR Dataset.zip", method="curl")
# unzip(filename) 
##

# loading columns id and definition from features.txt
lcols <- fread(file="UCI HAR Dataset/features.txt", col.names=c("col_id", "feature"))
# Selecting only columns about mean and standart deviation measures
lcols <- lcols[grep(".+(mean|std)\\(\\).*", feature),]

# Loading train data set
strain <- fread(file="UCI HAR Dataset/train/subject_train.txt", col.names="subject_id")
ytrain <- fread(file="UCI HAR Dataset/train/y_train.txt",       col.names="activity")
xtrain <- fread(file="UCI HAR Dataset/train/X_train.txt", select=lcols$col_id, col.names=lcols$feature) # reading columns based on previous selection

# Loading test data set
stest  <- fread(file="UCI HAR Dataset/test/subject_test.txt",   col.names="subject_id")
ytest  <- fread(file="UCI HAR Dataset/test/y_test.txt",         col.names="activity")
xtest  <- fread(file="UCI HAR Dataset/test/X_test.txt", select=lcols$col_id, col.names=lcols$feature) # reading columns based on previous selection

# Changing activities id for their corresponding descriptive names (based on activity_labels.txt)
ytest  <- mutate(ytest,  activity = case_when(activity==1 ~ "WALKING",
												activity==2 ~ "WALKING_UPSTAIRS",
												activity==3 ~ "WALKING_DOWNSTAIRS",
												activity==4 ~ "SITTING",
												activity==5 ~ "STANDING",
												activity==6 ~ "LAYING"))
ytrain <- mutate(ytrain, activity = case_when(activity==1 ~ "WALKING",
												activity==2 ~ "WALKING_UPSTAIRS",
												activity==3 ~ "WALKING_DOWNSTAIRS",
												activity==4 ~ "SITTING",
												activity==5 ~ "STANDING",
												activity==6 ~ "LAYING"))

# Renaming variable names with more descriptive ones
names(xtrain) %<>%
	str_replace_all("mean\\(\\)",	"mean")			%>% # removing useless parenthesis function call '()'
	str_replace_all("std\\(\\)",	"stdDev")		%>% # removing useless parenthesis function call '()'
	str_replace_all("Acc",			"Acceleration")	%>%
	str_replace_all("Gyro",			"Gyroscope")	%>%
	str_replace_all("Mag",			"Magnitude")	%>%
	str_replace_all("^t",			"time")			%>% # renaming intial t for a more explicit time
	str_replace_all("^f",			"freq")			%>% # renaming intial f for a more explicit freq (frequency)
	str_replace_all("BodyBody",		"Body")             # correcting the typo (double Body)
names(xtest) %<>%  # exact same changes than for xtrain
	str_replace_all("mean\\(\\)",	"mean")			%>%
	str_replace_all("std\\(\\)",	"stdDev")		%>%
	str_replace_all("Acc",			"Acceleration")	%>%
	str_replace_all("Gyro",			"Gyroscope")	%>%
	str_replace_all("Mag",			"Magnitude")	%>%
	str_replace_all("^t",			"time")			%>%
	str_replace_all("^f",			"freq")			%>%
	str_replace_all("BodyBody",		"Body")

# Merging columns from all 3 subsets (to get subject and activity info for all measurments)
train <- cbind(strain, ytrain, xtrain)
test  <- cbind(stest,  ytest,  xtest)

# Combining both train and test data
udata <- rbind(train,  test)

# Dummy check to get sure there are no NA values
if (sum(colSums(is.na(udata))) != 0) print("WARNING: some NA values detected!")  # checking for NA values

# Create final data set by aggregating by subject and activity and computing the mean for each measurments
sdata <- udata %>% melt(id = c("activity", "subject_id")) %>% dcast(activity + subject_id ~ variable, mean)

# Writing the resulting tidy data set to "tidydataset.txt" file
write.table(sdata, "tidydataset.txt", row.name=FALSE, quote=FALSE)