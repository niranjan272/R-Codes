library(datasets)
library(ggplot2)
set.seed(20)
head(iris)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

iriscluster <- kmeans(iris[,3:4],3,nstart = 20)
iriscluster
table(iriscluster$cluster,iris$Species)
iriscluster$cluster <- as.factor(iriscluster$cluster)

