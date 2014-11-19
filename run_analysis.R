
### This file runs the analysis for the course project
### Author - Rick DeJonghe

### Course info
### Coursera - Getting and Cleaning Data
### by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

### Note - all data is contained in the data directory, but this is not included in the repo.


########################################
##### IMPORT DATA
########################################

#get the names of the measurements
features <- read.table("./data/features.txt")

#first construct the test data frame (test_table)
subjects_test <- read.table("./data/test/subject_test.txt")
activities_test <- read.table("./data/test/y_test.txt")
x_test  <- read.table("./data/test/X_test.txt")
names(x_test) = features[,2]  ### name the measurements
test_table <- cbind(subjects_test, activities_test, x_test)

#next construct the train data frame (train_table)
subjects_train <- read.table("./data/train/subject_train.txt")
activities_train <- read.table("./data/train/y_train.txt")
x_train  <- read.table("./data/train/X_train.txt")
names(x_train) = features[,2] ### name the measurements
train_table <- cbind(subjects_train, activities_train, x_train)




########################################
##### FORM DATA TABLE AND MAKE TIDY
########################################

#merge test_table and train_table into one data set,
#rename subjects and activities column
total_table <- rbind(test_table,train_table)
names(total_table)[1] <- "subjects"
names(total_table)[2] <- "activities"

#give the activities good names
activity_labels <- read.table("./data/activity_labels.txt")
total_table$activities <- factor(total_table$activities,activity_labels$V1,activity_labels$V2)

#extract only those columns which are means and standard deviations
#we take those which are calculated means (ending in mean()), and calculated
# mean frequencies (ending in meanFreq()) - std. devs. all end in std()
means <- c(grep("mean\\(\\)",names(total_table)),grep("meanFreq",names(total_table)))
stds <- grep("std\\(\\)",names(total_table))
measurements <- c(c(1,2),means,stds) ### we also want the subjects and activites
tidy_table <- total_table[,measurements]



########################################
##### FORM TIDY DATA SET FOR OUTPUT
########################################

#create the data frame (small_data) with only subjects and activities
subject_nums <- unique(total_table$subjects)
activity_names <- unique(total_table$activities)
small_data <- expand.grid(subject_nums,activity_names)
names(small_data) <- names(total_table)[1:2]

#fill the data frame column by colum with averages for each measurement
measurement_names <- names(tidy_table[-(1:2)])
for(name in measurement_names) {
  #### fill in a single column
  for( i in 1:nrow(small_data) ) {
    small_data[i,name] <- mean(tidy_table[total_table$subjects == small_data[i,"subjects"] & tidy_table$activities == small_data[i,"activities"] ,name])
  }
}

#write the new data frame which has only the mean for each subject and activity
#to tidy_data.txt file
write.table(small_data,"tidy_data.txt")
