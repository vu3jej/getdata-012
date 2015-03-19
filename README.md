# Getting and Cleaning Data Course Project

## run_analysis.R

___Note___ The code blocks used in the README are for illustration only &
are incomplete. Please refer to the script for complete implementation.

This script assumes that the Samsung data is in your working
directory(unzipped).

Here's a step by step explanation of how the script works along with the line
numbers.

###### Imports necessary packages(lines[2:3])

Package `reshape2` need to be imported to use `melt` and `dcast` functions used
for creating tidy data at the end of the script.

###### Read column names for the measurement data(lines[6])

Reads the column names from `features.txt` to be used with `read.table()` while
reading measurement data.

```R
cNames <- read.table(file = 'UCI HAR Dataset/features.txt')
```
###### Read the training and test data sets(lines[8:16])

Reads the measurement, activity and subject data using `read.table()`. Please
note that we are using column names stored in `cNames` variable while reading
the measurement data.

###### Merging the training and test data sets(lines[20:22])

Using `rbind`, we are merging the corresponding training and test data sets.

###### Extracting the measurements based on the mean and standard
###### deviation(lines[25:26])

We use `grep` here to identify and retrieve any measurements with mean or
standard deviation. Note that we are selecting any coulmns with either lowercase
mean or std in it.

```R
grep('mean|std', names(x = measurement), value = TRUE)
```

###### Adding descriptive activity names(lines[29:34])

```R
activity$V1[activity$V1 == 1] <- 'WALKING'
```

The code is pretty much self explanatory to what it is doing here.

###### Adding descriptive variable names(lines[37:45])

Using `gsub`, we are modifying the variable names as per the descriptions
provided with `features_info.txt`.

###### Merging the subject and activity columns with measurement
###### data(lines[50:52])

```R
mergedData <- cbind(meanStdColumns, activity, subject)
```

Uses `cbind`. Code is self explanatory.

###### Making a tidy data set and writing to a txt file(lines[55:59])

We use the `melt` and `dcast` functions from the `reshape2` package we imported
earlier to create a tidy data set with the average of each variable for each
activity and each subject. Finally we use the `write.table()` funtion with
`row.names` set to `FALSE` to create a `tidydataset.txt`.

```R
meltedData <- melt(data = mergedData, id = c('subject', 'activity'))
tidyData <- dcast(data = meltedData, formula = subject + activity ~ variable, mean)

write.table(x = tidyData, file = 'tidydataset.txt', row.names = FALSE)  
```

## Reading the tidy data set uploaded to Coursera

We can use the `read.table()` function in the following way to produce a tidy
data set in our enviornment

`tidyData <- read.table('./TidyData/tidydataset.txt', header = TRUE)`

If you use the `dim()` function on `tidyData`, you can see that it contains
`180` observations of `81` variables.


## CodeBook.md

`CodeBook.md` file in the repo contains descriptions of variables, data and any 
transformations performed to clean up the data.
