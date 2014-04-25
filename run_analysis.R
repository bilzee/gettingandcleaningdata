####### Functions ####### 

label <- function(values, labels, input) {
  if (length(values)!=length(labels)){
    stop("labels cannot be applied to values due mismatch in size")
    return
  }
  #further checks could be performed on the input parameter
  output <- input
  for (i in 1:length(values)){
    replacementIndex <- grep(values[i], output, fixed=TRUE)
    output[replacementIndex] =
      gsub(values[i], labels[i], output, fixed=TRUE)[replacementIndex]
  }
  data.frame(as.factor(output))
}



extractVarIndex <- function(patterns, varNames){
  outputLogic <- vector("logical", length=length(varNames))
  for (x in patterns){
    outputLogic <- outputLogic | grepl(x, varNames, fixed=TRUE)
    
  }
  outputLogic
}


############ Main Script Begins ##############

# read in data
actLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
trainAct <- read.table("UCI HAR Dataset/train/y_train.txt")
trainFeat <- read.table("UCI HAR Dataset/train/X_train.txt")
trainSubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
testAct <- read.table("UCI HAR Dataset/test/y_test.txt")
testFeat <- read.table("UCI HAR Dataset/test/X_test.txt")
testSubj <- read.table("UCI HAR Dataset/test/subject_test.txt") 

# assign variable names to the feature data of test and training
names(trainFeat) <- features[[2]]
names(testFeat) <- features[[2]]

# merge test and training for three tables: activity, features and subjects which form columns 
act <- rbind(trainAct,testAct)
feat <- rbind(trainFeat,testFeat)
subj <- rbind(trainSubj,testSubj)

# Extracts only the measurements on the mean and standard deviation for each measurement
toMatch <- c("mean()", "std()")
extractionLogic <- extractVarIndex(toMatch, names(feat)) 
subFeat <- feat[,extractionLogic]

# assign descriptive names to activities equivalent to each activity of the dataset
actDescName <- label(actLabel[[1]], actLabel[[2]], act[[1]])

# Put together the first tidy dataset. but first name vars appropriately
names(subj) <- "subject identification"
names(actDescName) <- "activity"
tidy <- cbind(subj, actDescName, subFeat)   

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidydt <- data.table(tidy)
tidySummary <- tidydt[, lapply(.SD, mean), by=c("subject identification", "activity"), .SDcols = 3:length(names(tidydt))]
tidySummary <- data.frame(tidySummary)


# Write out the tidy datasets to the working directory in csv format
write.csv(tidy, file="tidy.csv")
write.csv(tidySummary, file="tidySummary.csv")







