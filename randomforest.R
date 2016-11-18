library(randomForest)
#library(readr)

set.seed(0)

numTrain <- 10000
numTrees <- 25

train <- read.csv("C:\\Users\\Niranjan\\Documents\\R\\train.csv")
test <- read.csv("C:\\Users\\Niranjan\\Documents\\R\\test.csv")

rows <- sample(1:nrow(train), numTrain)
labels <- as.factor(train[rows,1])
train <- train[rows,-1]

# m = matrix(unlist(train[11,-1]),nrow = 28,byrow = T)
# # Plot that matrix
# image(m,col=grey.colors(255))

rf <- randomForest(train, labels, xtest=test, ntree=numTrees)
print(head(rf,10))
predictions <- data.frame(ImageId=1:nrow(test), Label=levels(labels)[rf$test$predicted])
print(head(predictions))

write.csv(predictions, "rf_benchmark.csv")
