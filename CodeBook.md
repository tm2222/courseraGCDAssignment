Following are the columns contained in the dataset.
---------------------------------------------------

**Column 1: Activity**  
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

**Column 2: Subject**  
1 through 30 indicating the subject from whom the observations were drawn

**Columns 3 through 48 and 56 through 88**  

The names of these columns are given below.  
The column names have been coded in the following way  
1. The first letter is either 't' or 'f' and this indicates the measurement being in the time or frequency domain respectively.  
2. The word following the first letter indicates body or gravity acceleration signals. Ex. "tBodyAcc-mean()-X", "tGravityAcc-mean()-X"  
3. 'Gyro' indicates gyroscope measurements, 'Acc' indicates acceleration, 'Jerk' indicates jerk signals  
and 'mag' indicates calculated magnitudes of these signals.  
4. All values are means of measurements. mean(), std(), meanFreq() indicate the reading being the mean of mean, mean of standard deviation and mean of mean frequency respectively.  
5. Finally 'X', 'Y', or 'Z' suffix indicates one of the three directions (spatial dimensions) in which the measurements were taken.  
Also note that, the values have been normalized to be between -1 and 1.

Thus, for example, "tBodyAcc-mean()-X" would be read as "mean of body acceleration along the X axis in the time domain".

**Columns 49 through 55**  
These columns represents the mean of angles between variables. The values are in radians and have been normalized to be between -1 and 1.
