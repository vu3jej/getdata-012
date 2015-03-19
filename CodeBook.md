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
- A 561-feature vector with time and frequency domain variables.
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
    - Integer with values from 1-30

###### activity
    - Character group of 6 activity labels
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING

###### time.bodyacceleration.meanx
###### time.bodyacceleration.meany
###### time.bodyacceleration.meanz
###### time.bodyacceleration.stdx
###### time.bodyacceleration.stdy
###### time.bodyacceleration.stdz
###### time.gravityacceleration.meanx
###### time.gravityacceleration.meany
###### time.gravityacceleration.meanz
###### time.gravityacceleration.stdx
###### time.gravityacceleration.stdy
###### time.gravityacceleration.stdz
###### time.bodyaccelerationjerk.meanx
###### time.bodyaccelerationjerk.meany
###### time.bodyaccelerationjerk.meanz
###### time.bodyaccelerationjerk.stdx
###### time.bodyaccelerationjerk.stdy
###### time.bodyaccelerationjerk.stdz
###### time.bodygyro.meanx
###### time.bodygyro.meany
###### time.bodygyro.meanz
###### time.bodygyro.stdx
###### time.bodygyro.stdy
###### time.bodygyro.stdz
###### time.bodygyrojerk.meanx
###### time.bodygyrojerk.meany
###### time.bodygyrojerk.meanz
###### time.bodygyrojerk.stdx
###### time.bodygyrojerk.stdy
###### time.bodygyrojerk.stdz
###### time.bodyaccelerationmagnitude.mean
###### time.bodyaccelerationmagnitude.std
###### time.gravityaccelerationmagnitude.mean
###### time.gravityaccelerationmagnitude.std
###### time.bodyaccelerationjerkmagnitude.mean
###### time.bodyaccelerationjerkmagnitude.std
###### time.bodygyromagnitude.mean
###### time.bodygyromagnitude.std
###### time.bodygyrojerkmagnitude.mean
###### time.bodygyrojerkmagnitude.std
###### frequency.bodyacceleration.meanx
###### frequency.bodyacceleration.meany
###### frequency.bodyacceleration.meanz
###### frequency.bodyacceleration.stdx
###### frequency.bodyacceleration.stdy
###### frequency.bodyacceleration.stdz
###### frequency.bodyacceleration.meanfreqx
###### frequency.bodyacceleration.meanfreqy
###### frequency.bodyacceleration.meanfreqz
###### frequency.bodyaccelerationjerk.meanx
###### frequency.bodyaccelerationjerk.meany
###### frequency.bodyaccelerationjerk.meanz
###### frequency.bodyaccelerationjerk.stdx
###### frequency.bodyaccelerationjerk.stdy
###### frequency.bodyaccelerationjerk.stdz
###### frequency.bodyaccelerationjerk.meanfreqx
###### frequency.bodyaccelerationjerk.meanfreqy
###### frequency.bodyaccelerationjerk.meanfreqz
###### frequency.bodygyro.meanx
###### frequency.bodygyro.meany
###### frequency.bodygyro.meanz
###### frequency.bodygyro.stdx
###### frequency.bodygyro.stdy
###### frequency.bodygyro.stdz
###### frequency.bodygyro.meanfreqx
###### frequency.bodygyro.meanfreqy
###### frequency.bodygyro.meanfreqz
###### frequency.bodyaccelerationmagnitude.mean
###### frequency.bodyaccelerationmagnitude.std
###### frequency.bodyaccelerationmagnitude.meanfreq
###### frequency.bodyaccelerationjerkmagnitude.mean
###### frequency.bodyaccelerationjerkmagnitude.std
###### frequency.bodyaccelerationjerkmagnitude.meanfreq
###### frequency.bodygyromagnitude.mean
###### frequency.bodygyromagnitude.std
###### frequency.bodygyromagnitude.meanfreq
###### frequency.bodygyrojerkmagnitude.mean
###### frequency.bodygyrojerkmagnitude.std
###### frequency.bodygyrojerkmagnitude.meanfreq

### SOURCES

- This amazing [template](https://github.com/JorisSchut/Data-Science/blob/master/Other%20stuff/Codebook%20template.Rmd) for a codebook by Joris Schut
- This invaluable piece of [advice](https://class.coursera.org/getdata-012/forum/thread?thread_id=9) from David Hood, Community TA 