# Getting and Cleaning Data Course Project

# load required modules
library(dplyr)
library(stringr)

# load data
trainX <- read.table("./Data/train/X_train.txt")
trainy <- read.table("./Data/train/y_train.txt")
subjectTrain <- read.table("./Data/train/subject_train.txt")
testX <- read.table("./Data/test/X_test.txt")
testy <- read.table("./Data/test/y_test.txt")
subjectTest <- read.table("./Data/test/subject_test.txt")

# load meta data
label_features = read.table("./Data/features.txt")
colnames(label_features) <- c("featureId", "featureName")

# ready for task 4.
label_features <- label_features %>%
  mutate (featureName = paste(featureId,featureName, sep = ".")) %>%
  mutate (featureName = gsub(",", "", featureName)) %>%
  mutate (featureName = gsub("-", "", featureName)) %>%
  mutate (featureName = gsub("\\s+", "", featureName)) %>%
  mutate (featureName = gsub("[-()]", "", featureName)) %>%
  mutate (featureName = tolower(featureName))
  

label_activities = read.table("./Data/activity_labels.txt")
colnames(label_activities) <- c("activityId", "activityName")

# 1. Merges the training and the test sets to create one data set.
dt.allX <- rbind(trainX, testX)
dt.ally <- rbind(trainy, testy)
dt.allSubjects <- rbind(subjectTrain, subjectTest)

rm(trainX)
rm(trainy)
rm(subjectTrain)
rm(testX)
rm(testy)
rm(subjectTest)

colnames(dt.allX) <- label_features$featureName
colnames(dt.ally) <- c("activityId")
colnames(dt.allSubjects) <- c("subjectId")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
dt.allX <- dt.allX %>%
  select(matches(".*Mean.*"), matches(".*Std.*"))
colnames(dt.allX) <- str_split_fixed(colnames(dt.allX), "[.]", 2)[,2]

dt.all <- cbind(dt.allX, dt.ally, dt.allSubjects)

# 3. Uses descriptive activity names to name the activities in the data set
dt.all <- dt.all %>%
  inner_join(label_activities, by ="activityId") %>%
  select(-activityId)

# 4. Appropriately labels the data set with descriptive variable names.

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dt.tidy <- dt.all %>%
  group_by(subjectId, activityName) %>%
  summarise_all(mean)

# Please upload the tidy data set created in step 5 of the instructions. 
write.table(dt.tidy, file="tidy.txt", row.name=FALSE)

rm(dt.allX)
rm(dt.ally)
rm(dt.allSubjects)
rm(label_activities)
rm(label_features)