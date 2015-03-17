## Read training data
trainMeasurement <- read.table(file = './UCI HAR Dataset/train/X_train.txt')
trainActivity <- read.table(file = './UCI HAR Dataset/train/y_train.txt')

## Read the test data
testMeasurement <- read.table(file = './UCI HAR Dataset/test/X_test.txt')
testActivity <- read.table(file = './UCI HAR Dataset/test/y_test.txt')

## Merging training and test datasets
Measurement <- rbind(trainMeasurement, testMeasurement)
Activity <- rbind(trainActivity, testActivity)

