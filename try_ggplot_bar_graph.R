library(ggplot2)
library(gcookbook)
library(plyr)
ggplot(pg_mean,aes(x= group, y = weight)) + geom_bar(stat = "identity")
ggplot(BOD, aes(x = Time,y = demand)) + geom_bar(stat = "identity")
ggplot(BOD, aes(x = factor(Time),y = demand)) + geom_bar(stat = "identity")
ggplot(pg_mean,aes(x = group, y = weight )) + geom_bar(stat = "identity", fill = "pink" , color = "blue") 

ggplot(cabbage_exp,aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_bar(stat = "identity",position = "dodge") + 
  scale_fill_brewer(palette = "Pastel1")

#Bar graph of count
ggplot(diamonds,aes(x = cut)) + geom_bar()
ggplot(diamonds,aes(x= carat)) + geom_bar()


#color bar plot
ups <- subset(uspopchange,rank(Change) > 40)
ups
ggplot(ups,aes(x = Abb, y = Change, fill = Region)) + geom_bar(stat = "identity")
ggplot(ups,aes(x = reorder(Abb,Change), y = Change, fill = Region)) + 
  geom_bar(stat = "identity", colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  xlab("State")

csub <- subset(climate,Source == "Berkeley" & Year >= 1900)
csub$pos  <- csub$Anomaly10y >= 0 

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
  geom_bar(stat="identity", position="identity", colour = "black", size = 0.25) +
  scale_fill_manual(values=c("#CCEEFF", "#FFDDDD"), guide=FALSE)


ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity", width=0.5, position=position_dodge(0.7))


cabbage_exp
ggplot(cabbage_exp,aes(x=  Date, y = Weight, fill = Cultivar)) +
  geom_bar(stat = "identity") +
  guides(fill = guide_legend(reserve = T))


ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar , order = desc(Cultivar))) + 
  geom_bar(stat = "identity")


ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity", colour="black") +
  guides(fill=guide_legend(reverse=TRUE)) +
  scale_fill_brewer(palette="Pastel1")


ce  <- ddply(cabbage_exp,"Date", transform,percent_weight = Weight/sum(Weight) * 100)
ggplot(ce, aes(x = Date, y = percent_weight, fill = Cultivar)) + geom_bar(stat ="identity")



ggplot(cabbage_exp,aes(x= interaction(Date,Cultivar),y = Weight)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Weight),vjust = -0.2)


ce  <- ddply(cabbage_exp,"Date",transform,label_y = cumsum(Weight))
ggplot(ce, aes(x = Date, y = Weight,fill = Cultivar)) +
  geom_bar(stat = "identity") +
  geom_text(aes(y = label_y, label = Weight),vjust = 1.5,colour = "white")


ce <- arrange(cabbage_exp,Date,Cultivar)
ce  <- ddply(ce,"Date",transform,label_y = cumsum(Weight)-0.5*Weight)
ggplot(ce, aes(x = Date, y = Weight,fill = Cultivar)) +
  geom_bar(stat = "identity") +
  geom_text(aes(y = label_y, label = Weight),vjust = 1.5,colour = "white")

#Cleveland Dot Plot
tophit <- tophitters2001[1:25,]
tophit
ggplot(tophit,aes(x= avg, y = name)) + geom_point()

tophit <- tophitters2001[,c("name","lg","avg")]
ggplot(tophit,aes(x= avg,y = reorder(name,avg))) + geom_point(size = 3) +
  theme_bw() +
  theme(axis.text.x = element_text(angle=60, hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey60",linetype = "dashed"))
  


