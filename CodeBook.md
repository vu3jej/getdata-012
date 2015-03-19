---
title: 'CodeBook'
author: 'Jithesh Eriyakkadan Janardhanan'
---

___IMPORANT___ For instructions on reading the tidy data set, please refer [README](https://github.com/vu3jej/getdata-012#reading-the-tidy-data-set-uploaded-to-coursera).

### PROJECT DESCRIPTION

The goal of this project is to create a tidy data set that can be user for later analysis. In this prject, we use the data collected from the accelerometers from the Samsung Galaxy S smartphone and create a tidy data set with the average of each variable for each activity and each subject.

### COLLECTION AND PROCESSING OF DATA

##### COLLECTION OF RAW DATA

The zip file containing the raw data was downloaded from [this](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) link using the `download.file()` function and the data was extracted in to the working directory using `unzip`.

##### NOTES ON RAW DATA

The raw data contains data set from an an experiment that's been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II). The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. For each record in the data, following details are available.

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and Frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

##### NOTES OF PROCESSING DATA

___Note___ This is a general overview of the cleaning steps performed on the raw data to create a tidy data set. For more detailed instruction as to how the code in `run_analysis.R` works, please refer to the [README](https://github.com/vu3jej/getdata-012#run_analysisr).

1. Read the data in from the `train` and `test` data sets using `read.table()` along with headers from `features.txt`
2. Merged the `train` and `test` data sets
3. Using subsetting and with little bit of help from `grep`, extracted the measurements on mean and standard deviation
4. Added descriptive activity names like this -> `activity$V1[activity$V1 == 1] <- 'WALKING'`
5. Added descripive variable names with a series of `gsub` + `names()` calls
6. Merged the activity & subject data with the measurement data
7. Using `melt` from `reshape2` package, restructured it into a format where each measured variable is in its own row
8. Using `dcast`, reshaped the data into a wide format with the average of each variable for each activity and each subject.
9. In the final step, wrote the tidy data set into a txt file using `write.table()` with `row.names` set to `FALSE`


### VARIABLES AND DESCRIPTIONS

###### subject
    - Group of 30 volunteers within an age bracket of 19-48 years
    - Integer
    - Values 1-30

###### activity
    - Group of Activity labels
    - Character
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING

###### time.bodyacceleration.meanx
    - Time domain signal
    - Numeric
###### time.bodyacceleration.meany
    - Time domain signal
    - Numeric
###### time.bodyacceleration.meanz
    - Time domain signal
    - Numeric
###### time.bodyacceleration.stdx
    - Time domain signal
    - Numeric
###### time.bodyacceleration.stdy
    - Time domain signal
    - Numeric
###### time.bodyacceleration.stdz
    - Time domain signal
    - Numeric
###### time.gravityacceleration.meanx
    - Time domain signal
    - Numeric
###### time.gravityacceleration.meany
    - Time domain signal
    - Numeric
###### time.gravityacceleration.meanz
    - Time domain signal
    - Numeric
###### time.gravityacceleration.stdx
    - Time domain signal
    - Numeric
###### time.gravityacceleration.stdy
    - Time domain signal
    - Numeric
###### time.gravityacceleration.stdz
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerk.meanx
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerk.meany
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerk.meanz
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerk.stdx
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerk.stdy
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerk.stdz
    - Time domain signal
    - Numeric
###### time.bodygyro.meanx
    - Time domain signal
    - Numeric
###### time.bodygyro.meany
    - Time domain signal
    - Numeric
###### time.bodygyro.meanz
    - Time domain signal
    - Numeric
###### time.bodygyro.stdx
    - Time domain signal
    - Numeric
###### time.bodygyro.stdy
    - Time domain signal
    - Numeric
###### time.bodygyro.stdz
    - Time domain signal
    - Numeric
###### time.bodygyrojerk.meanx
    - Time domain signal
    - Numeric
###### time.bodygyrojerk.meany
    - Time domain signal
    - Numeric
###### time.bodygyrojerk.meanz
    - Time domain signal
    - Numeric
###### time.bodygyrojerk.stdx
    - Time domain signal
    - Numeric
###### time.bodygyrojerk.stdy
    - Time domain signal
    - Numeric
###### time.bodygyrojerk.stdz
    - Time domain signal
    - Numeric
###### time.bodyaccelerationmagnitude.mean
    - Time domain signal
    - Numeric
###### time.bodyaccelerationmagnitude.std
    - Time domain signal
    - Numeric
###### time.gravityaccelerationmagnitude.mean
    - Time domain signal
    - Numeric
###### time.gravityaccelerationmagnitude.std
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerkmagnitude.mean
    - Time domain signal
    - Numeric
###### time.bodyaccelerationjerkmagnitude.std
    - Time domain signal
    - Numeric
###### time.bodygyromagnitude.mean
    - Time domain signal
    - Numeric
###### time.bodygyromagnitude.std
    - Time domain signal
    - Numeric
###### time.bodygyrojerkmagnitude.mean
    - Time domain signal
    - Numeric
###### time.bodygyrojerkmagnitude.std
    - Time domain signal
    - Numeric
###### frequency.bodyacceleration.meanx
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.meany
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.meanz
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.stdx
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.stdy
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.stdz
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.meanfreqx
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.meanfreqy
    - Frequency domain signal
    - Numeric
###### frequency.bodyacceleration.meanfreqz
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.meanx
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.meany
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.meanz
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.stdx
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.stdy
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.stdz
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.meanfreqx
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.meanfreqy
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerk.meanfreqz
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.meanx
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.meany
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.meanz
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.stdx
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.stdy
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.stdz
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.meanfreqx
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.meanfreqy
    - Frequency domain signal
    - Numeric
###### frequency.bodygyro.meanfreqz
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationmagnitude.mean
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationmagnitude.std
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationmagnitude.meanfreq
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerkmagnitude.mean
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerkmagnitude.std
    - Frequency domain signal
    - Numeric
###### frequency.bodyaccelerationjerkmagnitude.meanfreq
    - Frequency domain signal
    - Numeric
###### frequency.bodygyromagnitude.mean
    - Frequency domain signal
    - Numeric
###### frequency.bodygyromagnitude.std
    - Frequency domain signal
    - Numeric
###### frequency.bodygyromagnitude.meanfreq
    - Frequency domain signal
    - Numeric
###### frequency.bodygyrojerkmagnitude.mean
    - Frequency domain signal
    - Numeric
###### frequency.bodygyrojerkmagnitude.std
    - Frequency domain signal
    - Numeric
###### frequency.bodygyrojerkmagnitude.meanfreq
    - Frequency domain signal
    - Numeric

### SOURCES

- This amazing [template](https://github.com/JorisSchut/Data-Science/blob/master/Other%20stuff/Codebook%20template.Rmd) for a codebook by Joris Schut
- This invaluable piece of [advice](https://class.coursera.org/getdata-012/forum/thread?thread_id=9) from David Hood, Community TA 