# Readme for JHU Data Cleaning Assignment
### By Julien Nabonne

This document is about the Assignement for the JHU Data Cleaning course on Coursera.  
More info on [the Coursera assignement page](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

---
## Other related file
* `run_analysis.R` R script performing the actions required to get a tidy data set from original data project
* `tidydataset.txt` resulting tidy data set file from execution of above script
* `Codebook.md` describing the tidy data set structure and contents 

---
## Information
For security reasons (downloads should be done by human, not hidden in scripts), `run_analysis.R` does not download and unzip the project data (but some commented code is provided at the begining of it to do so).  
So **this script has been written to be deployed on the same directory where `UCI HAR Dataset.zip` has been downloaded.**  
Unzipping this archive should create the directory `UCI HAR Dataset` where the script will look for data files.

**Some libraries are required** for the script to run:
* `data.table` for its `fread` function that behave well with white spaces 
* `dplyr` and `stringr` for the mutate fonction (used to set/rename labels)

Please note that the script does not install required libraries if not present (for the same security reasons as for download mentioned at the begining of this document : any package installation should only be done by users).

Instead of removing the unwanted measures after loading data files, **the scripts does only read the necessary columns** from the `X_train.txt` and `X_test.txt` files.  
Those columns are the ones about either `mean()` or `std()` (standard deviation) measurements.  
_(Additional vectors using gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean are NOT considered as they are not given as single measurment but as a computation for the angle variable.)_

**To get some nice descriptive variable names**, the following is performed:
1. activities id are exchanged with their corresponding descriptive names (based on `activity_labels.txt`)
2. variable names (columns) are renamed to more descriptive and understandable ones in both `X_train.txt` and `X_test.txt` files ; This could have been done in only one step after the merge but this way it is more easy to debug the script in case of some strange results.  
It also could be arguable that names could be even more explicit or more grammaticaly correct but a balance between Shakespear and conciseness had to be found!

**The merge of X_train and X_test data** is done after completing them with users information and activity from `subject_test.txt` and both `y_train.txt` and `y_test.txt`.

At last, **the final tidy data set is obtained** by _"averaging each variable for each activity and each subject"_...  
As this sentence is everthing but straitforward (at least for the author of this document ;) and after reading numerous comments on the course forum, it has been decided to apply the following approach: aggregating by activity and subject then applying the mean (resulting in 6 activity x 30 subjects : 180 observations).  
_(it would probably make more sense to aggregate first by subject then activity but I prefer to stick to the instructions)_

After executing `run_analysis.R` script, **you can view the resulting tidy data set** with the following command:  

    tds <- read.table("tidydataset.txt", header=TRUE)
    View(tds)

**Do not forget to check the codebook (`Codebook.md`) for further information about the tidy data set content!**

---
## Credits for the data set
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

---
**Thanks for reading this file until the end!**
