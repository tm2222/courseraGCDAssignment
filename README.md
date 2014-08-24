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
yield three datasets. These two datasets are then bound together using cbind()

