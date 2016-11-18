library(ggplot2)
library(gcookbook)
library(MASS)
library(plyr)
ggplot(faithful,aes(x = waiting)) + geom_histogram()
ggplot(faithful,aes(x= waiting)) +geom_histogram(binwidth = 5,fill = "white",colour = "black")

h  <- ggplot(faithful,aes(x= waiting))
h + geom_histogram(binwidth = 8,fill = "white", colour = "black", origin = 31)
h + geom_histogram(binwidth = 8,fill = "white", colour = "black", boundary = 31)

ggplot(birthwt,aes(x = bwt)) + geom_histogram(fill = "white",colour = "black") +
  facet_grid(smoke ~ .)

birthwt1 <- birthwt
birthwt1$smoke <- factor(birthwt1$smoke)
birthwt1$smoke <- revalue(birthwt1$smoke,c("0" = "No Smoke","1" = "Smoke"))
ggplot(birthwt1,aes(x = bwt)) + geom_histogram(fill = "white", colour = "black") +
  facet_grid(smoke ~.)

ggplot(birthwt1,aes(x = bwt, fill = smoke)) +geom_histogram(position = "identity",alpha = 0.4)


#Density Curve
ggplot(faithful,aes(x = waiting)) + geom_density()
ggplot(faithful,aes(x = waiting)) + geom_line(stat = "density") + expand_limits(y = 0)

w<- faithful$waiting
ggplot(NULL, aes(x = w)) + geom_density()


ggplot(faithful,aes(x = waiting)) + geom_line(stat = "density",adjust = 0.25,colour = "red") +
  geom_line(stat = "density") +
  geom_line(stat = "density",adjust = 2, colour = "blue") 


ggplot(faithful, aes(x=waiting)) +
  geom_density(fill="blue", alpha=.2) +
  xlim(35, 105)


#Multiple Density Plot
birthwt1  <- birthwt
birthwt1$smoke <- factor(birthwt1$smoke)
ggplot(birthwt1,aes(x = bwt, colour = smoke)) + geom_density()
ggplot(birthwt1,aes(x = bwt, fill = smoke)) + geom_density(alpha = 0.4)


ggplot(birthwt1,aes(x = bwt)) + geom_density() +facet_grid(smoke ~.)
birthwt1$smoke <- revalue(birthwt1$smoke, c("0" = "No Smoke","1" = "Smoke"))
ggplot(birthwt1,aes(x = bwt)) + geom_density() + facet_grid(smoke ~.)
#histogram and density curve
ggplot(birthwt1,aes(x = bwt, y= ..density..)) +
  geom_histogram(binwidth = 200, fill = "cornsilk", colour = "black",size = 0.2) +
  geom_density() +
  facet_grid(smoke~. )


#Frequency Polygon
ggplot(faithful,aes(x = waiting)) + geom_freqpoly()
ggplot(faithful,aes(x = waiting)) + geom_freqpoly(binwidth = 4)
binsize = diff(range(faithful$waiting))/ 15
ggplot(faithful,aes(x = waiting)) + geom_freqpoly(binwidth = binsize)


#Boxplot
ggplot(birthwt,aes(x = factor(race),y = bwt)) + geom_boxplot()
ggplot(birthwt,aes(x = factor(race),y = bwt)) + geom_boxplot(width = 0.5)
ggplot(birthwt,aes(x = factor(race),y = bwt)) + geom_boxplot(outlier.size = 1.5,outlier.shape = 21)
ggplot(birthwt,aes(x = 1,y = bwt)) + geom_boxplot() +
  scale_x_continuous(breaks = NULL) +
  theme(axis.title.x = element_blank())

#Adding notches to box plot
ggplot(birthwt,aes(x = factor(race),y = bwt)) + geom_boxplot(notch = T)

#Adding means to box plot
ggplot(birthwt,aes(x = factor(race),y = bwt)) + geom_boxplot(fill = "black") +
  stat_summary(fun.y = "mean",geom = "point",shape = 23, size = 3, fill = "white")

#Violin Plot
p <- ggplot(heightweight, aes(x=sex, y=heightIn))
p + geom_violin()
p + geom_violin(trim = F) + geom_boxplot(width=.1, fill="black", outlier.colour=NA) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5)
p + geom_violin(scale = "count")
p + geom_violin(adjust = 2)


ggplot(heightweight, aes(x=sex, y=heightIn)) +
  geom_boxplot(aes(x=as.numeric(sex) + .2, group=sex), width=.25) +
  geom_dotplot(aes(x=as.numeric(sex) - .2, group=sex), binaxis="y",
               binwidth=.5, stackdir="center") +
  scale_x_continuous(breaks=1:nlevels(heightweight$sex),
                     labels=levels(heightweight$sex))
