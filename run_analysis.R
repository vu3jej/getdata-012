## Importing necessary packages
library(reshape2)

## Reading column names for measurement data
cNames <- read.table(file = 'UCI HAR Dataset/features.txt')

## Reading training data
trainMeasurement <- read.table(file = './UCI HAR Dataset/train/X_train.txt', col.names = cNames$V2)
trainActivity <- read.table(file = './UCI HAR Dataset/train/y_train.txt')
trainSubject <- read.table(file = './UCI HAR Dataset/train/subject_train.txt')

## Reading test data
testMeasurement <- read.table(file = './UCI HAR Dataset/test/X_test.txt', col.names = cNames$V2)
testActivity <- read.table(file = './UCI HAR Dataset/test/y_test.txt')
testSubject <- read.table(file = './UCI HAR Dataset/test/subject_test.txt')


## 1. Merging training and test datasets
measurement <- rbind(trainMeasurement, testMeasurement)
activity <- rbind(trainActivity, testActivity)
subject <- rbind(trainSubject, testSubject)

## 2. Extracting the measurements on the mean and standard deviation for each measurement
meanStdColumnNames <- grep('mean|std', names(x = measurement), value = TRUE)
meanStdColumns <- measurement[meanStdColumnNames]

## 3. Adding descriptive activity names
activity$V1[activity$V1 == 1] <- 'WALKING'
activity$V1[activity$V1 == 2] <- 'WALKING_UPSTAIRS'
activity$V1[activity$V1 == 3] <- 'WALKING_DOWNSTAIRS'
activity$V1[activity$V1 == 4] <- 'SITTING'
activity$V1[activity$V1 == 5] <- 'STANDING'
activity$V1[activity$V1 == 6] <- 'LAYING'

## 4. Adding descriptive variable names
names(meanStdColumns) <- gsub(pattern = '*\\.*', replacement = '', x = names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = '^t', replacement = 'time.', x = names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = '^f', replacement = 'frequency.', x = names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = 'Acc', replacement = 'Acceleration', x =  names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = 'Mag', replacement = 'Magnitude', x = names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = 'mean', replacement = '.mean', x = names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = 'std', replacement = '.std', x = names(meanStdColumns))
names(meanStdColumns) <- gsub(pattern = 'BodyBody', replacement = 'Body', x =  names(meanStdColumns))
names(meanStdColumns) <- tolower(names(meanStdColumns))

## 5. Creating tidy data set with the average of each variable for each activity and each subject

## Merging activity and subject with meanStdColumns
mergedData <- cbind(meanStdColumns, activity, subject)
colnames(x = mergedData)[80] <- 'activity'
colnames(x = mergedData)[81] <- 'subject'

## Making tidy data set
meltedData <- melt(data = mergedData, id = c('subject', 'activity'))
tidyData <- dcast(data = meltedData, formula = subject + activity ~ variable, mean)

## Writing tidy data set to a text file
write.table(x = tidyData, file = 'tidydataset.txt', row.names = FALSE)
