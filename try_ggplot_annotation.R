library(ggplot2)
library(gcookbook)
library(plyr)
library(grid)
p <- ggplot(faithful,aes(x = eruptions , y = waiting)) + geom_point()
p+ annotate("text" ,x = 3, y = 48, label = "Group1") +
  annotate("text",x = 5, y = 66,label = "Gruop2" )

p+ 
annotate("text" ,x = 3, y = 48, label = "Group1" , family = "Calibri",fontface = "italic",colour = "darkred",size = 3) +
annotate("text",x = 5, y = 66,label = "Gruop2",family = "Calibri",fontface = "italic",colour = "darkred",size = 3 )


p +
  annotate("text", x= 3, y = 48,label = "Group1", alpha = 0.1) +
  geom_text(x = 4.5,y= 66, label = "group2",alpha = 0.1)

p + 
  annotate("text",x = -Inf,y = Inf, label = "Group1",hjust = -0.2, vjust = 2) +
  annotate("text",x = mean(range(faithful$eruptions)),y = -Inf,vjust = -0.4, label = "Group2")

#Mathematical Expressions
p <- ggplot(data.frame(x = c(-3,3)),aes(x = x )) + stat_function(fun = dnorm)
p +annotate("text",x = 2, y = 0.3, parse = T,label="frac(1, sqrt(2 * pi)) * e ^ {-x^2 / 2}")  
p +annotate("text",x = 2, y = 0.3, parse = T,label="'Function :' * y ==frac(1, sqrt(2 * pi)) * e ^ {-x^2 / 2}")  

#adding lines
p <- ggplot(heightweight,aes(x = ageYear,y = heightIn,colour = sex)) + geom_point()
p + geom_hline(yintercept = 60) + geom_vline(xintercept = 14)
p + geom_abline(intercept =  43,slope = 1.2)

hw_mean <- ddply(heightweight, "sex",summarise,heightIn = mean(heightIn))
p + geom_hline(aes(yintercept = heightIn,colour = sex),data = hw_mean, linetype = "dashed",size = 1)

pg <- ggplot(PlantGrowth,aes(x = PlantGrowth$group,y = weight)) + geom_point()
pg + geom_vline(xintercept = 2)
pg + geom_vline(xintercept = which(levels(PlantGrowth$group)=="ctrl"))


#Line Segemnt and Arrow
p <- ggplot(subset(climate,source = "Berkeley"),aes(x= Year, y = climate$Anomaly10y)) + geom_line()
p +annotate("segment",x= 1950,xend = 1980, y = -.25,yend = -.25)
p +annotate("segment",x= 1950,xend = 1980, y = -.25,yend = -.15,color = "blue", size = 2, arrow = arrow()) +
  annotate("segment",x= 1950,xend = 1980, y = -.25,yend = -.15,
           arrow = arrow(ends = "both", angle = 90,length = unit(0.2,"cm")))

#Shaded Rectangle
p <- ggplot(subset(climate,source = "Berkeley"),aes(x= Year, y = climate$Anomaly10y)) + geom_line()
p + annotate("rect",xmin = 1950,xmax = 1970,ymin = -1, ymax = 1,alpha = 0.1,fill = "blue")

#Highlinting an item
pg <- PlantGrowth
pg$hl <- "no"
pg$hl[pg$group =="trt2"] <- "yes"
ggplot(pg, aes(x= group, y = weight,fill = hl)) + geom_boxplot() +
  scale_fill_manual(values = c("grey85", "#FFDDCC"),guide = F)
                          #or
ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot() +
  scale_fill_manual(values=c("grey85", "grey85", "#FFDDCC"), guide=FALSE)

#Error Bars
ce <- subset(cabbage_exp,Cultivar == "c39")
ggplot(ce, aes(x = ce$Date , y =ce$Weight)) + geom_bar(stat = "identity",fill = "white",color = "black") +
  geom_errorbar(aes(ymin = Weight - se,ymax = Weight + se),width = 0.2)

ggplot(ce, aes(x = Date, y = Weight)) +
  geom_line(aes(group = 1)) +
  geom_point(size = 4) +
  geom_errorbar(aes(ymin = Weight - se, ymax = Weight + se),width = 0.2)

ggplot(cabbage_exp,aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_bar(stat= "identity",position = "dodge") +
  geom_errorbar(aes(ymin = Weight - se , ymax = Weight +se),position = "dodge",width = 0.2)

ggplot(cabbage_exp,aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_bar(stat= "identity",position = "dodge") +
  geom_errorbar(aes(ymin = Weight - se , ymax = Weight +se),position = position_dodge(0.9),width = 0.2)

#Annotation for individual facets
mpg
p <- ggplot(mpg,aes(x = mpg$displ,y = hwy)) + geom_point() + facet_grid(. ~drv)
f_labels <- data.frame(drv = c("4", "f", "r"), label = c("4wd", "Front", "Rear"))
f_labels
p + geom_text(x = 6, y =40,aes(label = label),data = f_labels)
p + annotate(x = 6, y = 40 ,label = "label text")


#For Fucntion
lm_labels <- function(dat) {
  mod <- lm(hwy ~ displ, data=dat)
  formula <- sprintf("italic(y) == %.2f %+.2f * italic(x)",
                     round(coef(mod)[1], 2), round(coef(mod)[2], 2))
  r <- cor(dat$displ, dat$hwy)
  r2 <- sprintf("italic(R^2) == %.2f", r^2)
  data.frame(formula=formula, r2=r2, stringsAsFactors=FALSE)
}
labels <- ddply(mpg, "drv", lm_labels)

p + geom_smooth(method=lm, se=FALSE) +
  geom_text(x=3, y=40, aes(label=formula), data=labels, parse=TRUE, hjust=0) +
  geom_text(x=3, y=35, aes(label=r2), data=labels, parse=TRUE, hjust=0)
