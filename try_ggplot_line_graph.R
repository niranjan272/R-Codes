
library(ggplot2)
library(gcookbook)
library(plyr)

ggplot(BOD, aes(x = Time, y = demand)) + geom_line()

BOD1 <- BOD
BOD1$Time <- factor(BOD1$Time)
ggplot(BOD1, aes(x = Time, y = demand,group = 1)) + geom_line()
#setting limit 
ggplot(BOD, aes(x = Time, y = demand)) + geom_line() + ylim(0, max(BOD$demand))
ggplot(BOD, aes(x = Time, y = demand)) + geom_line() + expand_limits(y= 0)
#Adding point to line
ggplot(BOD, aes(x = Time, y = demand)) + geom_line() +geom_point()
ggplot(worldpop,aes(x= Year, y = Population)) +geom_line() +geom_point() + scale_y_log10()

#Multiple Lines
tg <- ddply(ToothGrowth, c("supp","dose"),summarise,length = mean(len))
tg
ggplot(tg, aes(x= dose, y = length,color = supp)) +geom_line()
ggplot(tg, aes(x= dose, y = length,linetype = supp)) +geom_line()
ggplot(tg, aes(x= factor(dose), y = length,color = supp,group = supp)) +geom_line()
ggplot(tg, aes(x= dose, y = length,shape = supp)) +geom_line() + geom_point(size = 4)
ggplot(tg, aes(x=dose, y=length, fill=supp)) + geom_line() + geom_point(size=4, shape=21)

#dodge point
ggplot(tg, aes(x= dose, y = length,shape = supp)) +geom_line(position = position_dodge(0.2)) + 
  geom_point(position = position_dodge(0.2),size = 4)

#changing appearance of line
ggplot(BOD, aes(x = Time, y = demand)) + geom_line(linetype = 'dashed', size = 1 , colour = "blue")
tg <- ddply(ToothGrowth,c("supp","dose"),summarise,length = mean(len))
ggplot(tg, aes(x = dose, y = length,colour = supp)) + geom_line() +
  scale_color_brewer(palette = "Set1")
ggplot(tg, aes(x = dose, y = length,group = supp)) +geom_line(colour = "darkgreen", size = 2)
ggplot(tg, aes(x = dose, y = length,colour = supp)) +geom_line(linetype = "dashed") +
  geom_point(shape = 22, size = 3, fill = "white")

#Changing appearance of point
ggplot(BOD,aes(x = Time, y=  demand)) + geom_line() + 
  geom_point(size = 4, shape = 22, colour = "darkred",fill = "red")

ggplot(BOD,aes(x = Time, y=  demand)) + geom_line() + 
  geom_point(size = 4, shape = 21,fill = "white")


tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))
pd <- position_dodge(0.2)
ggplot(tg, aes(x= dose, y = length, fill = supp))+ geom_line(position = pd) +
  geom_point(shape= 21, size = 3, position = pd) +
  scale_fill_manual(values = c("white","black"))

#Graph with shaded area
sunspotyear <- data.frame(
  Year = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) + geom_area()
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) + geom_area(colour = "black",fill = "blue",alpha = 0.2)
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) + geom_area(colour = "black",fill = "blue",alpha = 0.2) +
  geom_line()


#Stacked Area Graph
ggplot(uspopage,aes(x = Year, y= Thousands, fill = AgeGroup)) + geom_area()
ggplot(uspopage,aes(x = Year, y= Thousands, fill = AgeGroup)) + 
  geom_area(colour = "black",size = .2, alpha = 0.4) +
  scale_fill_brewer(palette = "Blues",breaks = rev(levels(uspopage$AgeGroup)))
    #reverse order
ggplot(uspopage,aes(x = Year, y= Thousands, fill = AgeGroup, order = desc(AgeGroup))) + 
  geom_area(colour = "black",size = .2, alpha = 0.4) +
  scale_fill_brewer(palette = "Blues")

ggplot(uspopage,aes(x = Year, y= Thousands, fill = AgeGroup, order = desc(AgeGroup))) + 
  geom_area(colour = NA,alpha = 0.4) +
  scale_fill_brewer(palette = "Blues") +
  geom_line(position = "stack" ,size = .2)

#proportional stacked graph
uspopage_prop <- ddply(uspopage, "Year", transform,
                       Percent = Thousands / sum(Thousands) * 100)
ggplot(uspopage_prop, aes(x=Year, y=Percent, fill=AgeGroup)) +
  geom_area(colour="black", size=.2, alpha=.4) +
  scale_fill_brewer(palette="Blues", breaks=rev(levels(uspopage$AgeGroup)))

#Adding Confidence Region
clim <- subset(climate, Source == "Berkeley",select = c("Year","Anomaly10y","Unc10y"))
clim
ggplot(clim,aes(x = Year,y = Anomaly10y)) +
  geom_ribbon(aes(ymin = Anomaly10y - Unc10y,ymax = Anomaly10y+Unc10y),alpha = 0.2) + geom_line()

ggplot(clim,aes(x = Year,y = Anomaly10y)) +
  geom_line(aes(y = Anomaly10y - Unc10y),colour = "grey50",linetype = "dotted") +
  geom_line(aes(y = Anomaly10y + Unc10y),colour = "grey50",linetype = "dotted") +
  geom_line()
  

