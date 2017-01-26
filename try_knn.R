library(class)
library(gmodels)
library(caret)
library(ggplot2)
#Read input file
prc <- read.csv("C:\\Users\\Niranjan\\Documents\\R\\Prostate_Cancer.csv",stringsAsFactors = F)
str(prc)

#remove column id from the dataset
prc <- prc[-1]

#Check for the classification of the predictor values
table(prc$diagnosis_result)

#Rename Bening and Malignant cancer
prc$diagnosis_result <- factor(prc$diagnosis_result,levels = c("B","M"),labels = c("Bening","Malignant"))
round(prop.table(table(prc$diagnosis_result))*100,digits = 1)

#Normalise the data
normalise <- function(x){
  return( (x- min(x))/(max(x) - min(x)) )
}

prc_n <- as.data.frame(lapply(prc[2:9],normalise))
summary(prc_n)

#Create training and testing dataset
prc_train <- prc_n[1:65,]
prc_test  <- prc_n[66:100,]

prc_train_lable <- prc[1:65,1]
prc_test_lable  <- prc[66:100,1]

#knn
knn_value = sqrt(nrow(prc)) # value of k is usually square root of the total number of observations
prc_test_pred <- knn(prc_train,prc_test,prc_train_lable,k= knn_value)

#Evaluating knn
CrossTable(x= prc_test_lable, y = prc_test_pred,prop.chisq = F)




