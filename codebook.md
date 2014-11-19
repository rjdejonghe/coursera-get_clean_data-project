

codebook file for course project
==============================

### Getting and Cleaning Data

by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD


Summary
-------------

This repo contains a script run_analysis.R which takes all of the data (contained in the data directory which is ignored in the git repo), extracts only the mean and std. dev. measurements, and puts them into a new, tidy data set, which is then stored as a text file (tab delimited) tidy_data.txt.  This text file is included in the repo.  The repo also includes a codebook.md file describing all the variables in the tidy_data.txt file.


Variables
---------

The following variables are listed by a core name.  Each of these core names corresponds to a number of variables, which are obtained from the core name with both a prefix and a suffix. 

### Prefixes 
Each variable is prefixed by a `t' or an `f' .  The `t' variables were actually measured, the `f' variables where obtained from the `t' variables by applyig a fast foureir transform.  The `t' data were measured at a frequency of 50 Hz, and any components over 20 Hz were filterd out on the assumption that they were noise.

### Suffixes

The suffixes have the following interpretaion:

* mean(), mean()-X, mean()-Y, mean()-Z: These are the means of the described variable, the XYZ refers to the axis relative to which the variable was measured (where applicable).
* meanFreq(), meanFreq()-X, meanFreq()-Y, meanFreq()-Z: These are weighted averages of the described variable (only frequency variables in this case), the XYZ refers to the axis relative to which the variable was measured (where applicable).  The data set does not describe the exact manner of the weighting.
* std(), std()-X, std()-Y, std-Z: These are the standard deviations of the described variable, the XYZ refers to the axis relative to which the variable was measured (where applicable).


### Variable Core Names

* BodyAcc: Linear body acceleration.  The total acceleration was measured, and the body acceleration was determined by passing the acceleration signal through a filter which extracted only the high frequency (> 0.3 Hz) component.

* GravityAcc: Linear acceleration due to gravity.  This was the complemnatry acceleration to BodyAcc (so the <0.3 Hz component to the total acceleration). 
 
* BodyAccJerk: This is the jerk (time derivative of the acceleration) computed from the body acceleration (BodyAcc).

* BodyGyro: It is not clear what this is measuring.  The data description makes it sound like it is measuring angular velocity, but then taking the derivative would yield the angular acceleration, not the Jerk, as the data description suggests.  Also, the raw data for the gyroscope should measure the orientation, not the angular velocity or acceleration.

* BodyGyroJerk:  It is not clear what this variable is measuring.  See BodyGyro description for more detail.

* BodyAccMag: The magntiude of the BodyAcc variable (using the Euclidean norm).

* GravityAccMag: The magntiude of the GravityAcc variable (using the Euclidean norm).

* BodyAccJerkMag: The magntiude of the BodyAccJerk variable (using the Euclidean norm).

* BodyGyroMag: The magntiude of the BodyGyro variable (using the Euclidean norm).

* BodyGyroJerkMag: The magntiude of the BodyGyroJerk variable (using the Euclidean norm).









Original data info 
==================

The following info was taken directly from the original data files for reference purposes.

### README.txt 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### activity_labels.txt

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

### features_info.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


