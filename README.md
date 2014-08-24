courseraGCDAssignment
=====================

This repo contains the course project files for 'Getting and Cleaning Data' course

How the script works
---------------------

The script begins by setting the working directory to the folder that contains the extracted  
"UCI HAR Dataset" dataset.

Then the script follows the steps given in the course project description in the same order.

**Step1**  
There are 3 types of files in two directories each  ('test' and 'train') that are to be merged.  
The script reads in these 6 files. Merging is done in two stages.  
In the first stage, the rows from the training and test datasets are appended together using rbind().  
That is, the "X\_train" dataset is appended to the "X\_test' dataset, "y\_train" to "y\_test" and so on to  
yield three datasets. These two datasets are then bound together using cbind().  
This is named 'combinedData'

**Step2**  
1. The variables that contain 'mean' or 'std' are extracted from the features.txt file.
2. These variables are used to then extract mean and standard deviation columns from 'combinedData'

**Step3**  
Activity codes in the 'combinedData' are replaced by the activity name.  
This is done by merging the 'combinedData' with the data from the 'activity_labels.txt' file.

**Step4**  
Variable names from the features.txt file are used to name the columns of 'combinedData'

**Step5**  
The reshape2 library is used to melt 'combinedData' and recast it.  
Recasting is done to extract means over the combination of 'Activity' and 'Subject'.  
'Activity' has 6 factors and 'Subject' has 30, thus the resultant dataset has 6x30=180 rows.
