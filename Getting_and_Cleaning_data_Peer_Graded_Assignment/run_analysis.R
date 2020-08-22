library(dplyr)

# Loading data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./data/dataset.zip", method = "curl")

#Unzipping
unzip("./data/dataset.zip", exdir = "./data")

# Assigning data frames

activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
                       col.names = c("no", "activity"))
features <- read.table("./data/UCI HAR Dataset/features.txt", 
                       col.names = c("no","functions"))
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", 
                          col.names = "subject")
test_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$functions)
test_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt", 
                     col.names = "no")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",
                           col.names = "subject")
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt", 
                      col.names = features$functions)
train_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt", 
                      col.names = "no")

# Merging datasets
sumbu_X <- bind_rows(train_x, test_x)
sumbu_Y <- bind_rows(train_y, test_y)
subjects <- bind_rows(subjectTrain, subjectTest)
merged <- bind_cols(subjects, sumbu_X, sumbu_Y)

# Select only mean and standard deviation
tidydata <- merged %>% select(subject,no, contains("mean"), contains("std"))

#naming the index
tidydata$no <- activity[tidydata$no, 2]
colnames(tidydata)[2] <- "activity"

# renaming variables with appropriate label
names(tidydata) <-gsub("BodyBody", "Body", names(tidydata))
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("^f", "Frequency", names(tidydata))
names(tidydata) <- gsub("tBody", "TimeBody", names(tidydata))

# Average of each variable with new tidy dataset
result <- tidydata %>% group_by(subject, activity) %>% 
  summarize_all(mean)
write.table(result, "./data/resultassignment.txt", row.names = F)

