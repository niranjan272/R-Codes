df1<-read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data")
names(df1)<-c("CRIM", "ZN", "INDUS", "CHAS", "NOX", "RM", "AGE", "DIS", "RAD", "TAX",
              "PTRATIO", "B", "LSTAT", "MEDV")
dim(df1)
summary(df1$CRIM)
summary(df1$ZN)
summary(df1$INDUS)
plot(df1$CRIM)
plot(df1$INDUS)
plot(df1$CHAS)
install.packages("corrplot")
cor(df1[,"CRIM"],df1[,"INDUS"])
library(corrplot)
M<-cor(df1)
corrplot(M,method = "circle")
corrplot(M,method="number")
df1[which(df1$V14 > 20),]
sample(1:nrow(df1),0.8*nrow(df1))
df1[sample(1:nrow(df1),0.8*nrow(df1)),]


iris

df2<-read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")
names(df2)<-c("CRIM")
dim(df2)
summary(df2$CRIM)
plot(df2$CRIM)
summary(iris)
colnames(iris)
df2[which(df2$V1 > 20),]
sample(1:nrow(df2),0.8*nrow(df2))
df2[sample(1:nrow(df2),0.8*nrow(df2)),]