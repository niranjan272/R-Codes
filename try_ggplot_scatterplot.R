library(ggplot2)
library(gcookbook)
library(hexbin)
library(reshape2)
heightweight[,c("ageYear","heightIn")]
ggplot(heightweight,aes(x = ageYear, y = heightIn)) + geom_point()
ggplot(heightweight,aes(x = ageYear, y = heightIn)) + geom_point(shape = 21,size = 4)

#grouping data

ggplot(heightweight,aes(x= ageYear, y = heightIn,colour = sex)) + geom_point()
ggplot(heightweight,aes(x= ageYear, y = heightIn,shape = sex)) + geom_point()
ggplot(heightweight,aes(x = ageYear,y = heightIn,shape = sex ,colour = sex)) + geom_point()
ggplot(heightweight,aes(x = ageYear,y = heightIn,shape = sex ,colour = sex)) + geom_point() +
  scale_shape_manual(values = c(1,2)) + scale_color_brewer(palette = "Set1")

# Different point shapes
ggplot(heightweight,aes(x = ageYear, y= heightIn,shape = sex)) + geom_point(size = 3) +
  scale_shape_manual(values = c(1,4))


hw <- heightweight
hw$weightGroup <- cut(hw$weightLb,breaks = c(-Inf,0,Inf),labels = c("<100",">=100"))
ggplot(hw,aes(x = ageYear, y = heightIn, shape = sex, fill = weightGroup)) + geom_point(size = 2.5) +
  scale_shape_manual(values = c(21,14)) + scale_fill_manual(values = c(NA,"black"),
                                              guide = guide_legend(override.aes = list(shape = 21)))

#Mapping Continuous Variables
ggplot(heightweight,aes(x = ageYear,y = heightIn,colour = weightLb)) +geom_point()
ggplot(heightweight,aes(x = ageYear,y = heightIn,size = weightLb)) +geom_point()

ggplot(heightweight, aes(x=weightLb, y=heightIn, fill=ageYear)) +
  geom_point(shape=21, size=2.5) +
  scale_fill_gradient(low="black", high="white")

ggplot(heightweight, aes(x=weightLb, y=heightIn, fill=ageYear)) +
  geom_point(shape=21, size=2.5) +
  scale_fill_gradient(low="black", high="white", breaks=12:17,
                      guide=guide_legend())

ggplot(heightweight,aes(x = ageYear,y = heightIn,size = weightLb, colour = sex)) + 
  geom_point(alpha = 0.5) +
  scale_size_area() +
  scale_color_brewer(palette = "Set2")
  
#dealing with overplotting
sp <- ggplot(diamonds,aes(x= carat,y = price))
sp +geom_point()
sp + geom_point(alpha = 0.1)
sp + geom_point(alpha = 0.01)
sp + stat_bin2d()
sp + stat_bin2d( bins = 50) +
  scale_fill_gradient(low = "lightblue",high = "red",limits = c(0,6000))

sp + stat_binhex() +
  scale_fill_gradient(low = "lightblue",high = "red",limits = c(0,8000))

sp + stat_binhex() +
  scale_fill_gradient(low = "lightblue",high = "red",
                      breaks = c(0,250,500,1000,2000,4000),
                      limits = c(0,8000))

sp1 <- ggplot(ChickWeight,aes(x = Time, y= weight))
sp1 + geom_point()
sp1 + geom_point(position = "jitter")
sp1 + geom_point(position = position_jitter(width = 0.5,height =0))
sp1 + geom_boxplot(aes(group = Time))

#Adding Regression line
sp <- ggplot(heightweight,aes(x= ageYear, y = heightIn))
sp + geom_point() +stat_smooth(method = lm)
sp + geom_point() +stat_smooth(method = lm, level = 0.99)
sp + geom_point() +stat_smooth(method = lm, se = F)


#adding line to regression model
model <- lm(heightIn ~ ageYear, heightweight)
summary(model)
pred  <- predict(model, "ageYear","heightIn")


#adding labels
sp <- ggplot(subset(countries,Year == 2009 & healthexp > 2000),aes(x= healthexp,y = infmortality))
sp +annotate("text",x= 4350,y=5.4,label = "Canada") + annotate("text", x=7400, y=6.8, label="USA")
sp + geom_text(aes(label = Name),size = 4 , vjust = 0 )
sp + geom_text(aes( y = infmortality + .1,label = Name),size = 4 , vjust = 0 )

#Ballon Plot
cdat <- subset(countries, Year==2009 &
                 Name %in% c("Canada", "Ireland", "United Kingdom", "United States",
                             "New Zealand", "Iceland", "Japan", "Luxembourg",
                             "Netherlands", "Switzerland"))

colnames(cdat)
p <- ggplot(cdat,aes(x = healthexp, y = infmortality, size = GDP)) + 
  geom_point(shape = 21, colour = "black",fill = "cornsilk")
p
p + scale_size_area(max_size = 15)

hec <- HairEyeColor[,,"Male"] + HairEyeColor[,,"Female"]
hec <- melt(hec, value.name="count")
hec

ggplot(hec, aes(x = Eye, y= Hair)) +
  geom_point(aes(size = count),shape = 21,colour = "black",fill = "cornsilk") +
  scale_size_area(max_size = 20,guide = F) +
  geom_text(aes(y = as.numeric(Hair)- as.numeric(count)/22,label = count),vjust = 1,colour = "grey60",size =4)


#Scatter Plot Matrix
c2009 <- subset(countries, Year==2009,
                select=c(Name, GDP, laborrate, healthexp, infmortality))
