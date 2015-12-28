##

##Read all the data

features <- read.csv("../features.txt", header=FALSE,  sep="")

subject_Test <- read.csv("../test/subject_test.txt", header=FALSE,  sep="")
X_test <- read.csv("../test/X_test.txt", header=FALSE,  sep="")
y_test <- read.csv("../test/y_test.txt", header=FALSE,  sep="")

subject_Train <- read.csv("../train/subject_train.txt", header=FALSE,  sep="")
X_train <- read.csv("../train/X_train.txt", header = FALSE, sep="")
y_train <- read.csv("../train/y_train.txt", header=FALSE,  sep="")

##Create a new column that indicates wheter is a Train or a Test
X_train2 <- mutate(X_train, typeActivity = "train")
X_test2 <- mutate(X_test, typeActivity = "test")

## Column Bind the Necessary data

X_train2 <- bind_cols(X_train2, subject_Train, y_train)
X_test2 <- bind_cols(X_test2, subject_Test, y_test)

## Row Bind the Test and Train data

totalData <- bind_rows(X_test2, X_train2)
