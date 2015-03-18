# Age and Length %frequencies for 2011,2012, 2013 catch with updated data 5-16-14
setwd("~/Desktop/Github Repo/r-work/Age Length")
mydata= read.csv("Raw_Age_Length.csv", header=TRUE)

Age <- data.frame(mydata$Age, mydata$Year)
Age2 <- data.frame(mydata$Age, mydata$Year, mydata$Fork.Length..cm.)
colnames(Age) <- c("Age", "Year")
colnames(Age2) <- c("Age", "Year", "FL")


Age_wk <- Age[complete.cases(Age$Age),]
Age2_wk <- Age2[complete.cases(Age2$FL),]

## plot each age frequency seperately 

log2011 = Age_wk$Year==2011
log2012 = Age_wk$Year==2012
log2013 = Age_wk$Year ==2013

log22011 = Age2_wk$Year==2011
log22012 = Age2_wk$Year==2012
log22013 = Age2_wk$Year ==2013


Age_2011 = Age_wk[log2011,]
Age_2012 = Age_wk[log2012,]
Age_2013 = Age_wk[log2013,]


Age2_2011 = Age2_wk[log22011,]
Age2_2012 = Age2_wk[log22012,]
Age2_2013 = Age2_wk[log22013,]


Age_2011$Age[Age_2011$Age > 10] <- 10 #changing all values of ages greater than 10 to 10
Age_2012$Age[Age_2012$Age > 10] <- 10 #changing all values of ages greater than 10 to 10
Age_2013$Age[Age_2013$Age > 10] <- 10 #changing all values of ages greater than 10 to 10

library(ggplot2)
library(scales)

age_11_basic <- ggplot(Age_2011, aes(x=Age))+ 
  geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+ # plotting in percent frequency
  scale_y_continuous(labels=percent_format(), limits=c(0,.40))+  ## plotting in percent frequency
  ylab("")+ # workaround to make plots same size when only one really has a y axis label
  scale_x_continuous(name="", limits=c(1,11), breaks=seq(1,10,1), labels=c(1,2,3,4,5,6,7,8,9,"10+"))+
  theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), 
        panel.background=element_rect(colour="black",fill="white"), 
        axis.text.x=element_blank(), #removing x axis text
        axis.text.y=element_text(colour="black", size=16, family="Times New Roman"), #changing colour of y acis
        axis.title.x=element_text(size=18, family="Times New Roman"),
        axis.title.y=element_text(size=18, family="Times New Roman", vjust=1),
        plot.margin=unit(c(1,1,-2,1), "mm"))+
  annotate("text", x=10, y=.35, label="2011", size=5, family="Times New Roman")


age_12_basic <- ggplot(Age_2012, aes(x=Age))+ 
  geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+
  ylab("Frequency")+# plotting in percent frequency
  scale_y_continuous(limits=c(0,.40), labels=percent_format()) + ## plotting in percent frequency
  scale_x_continuous(name="", limits=c(1,11), breaks=seq(1,10,1), labels=c(1,2,3,4,5,6,7,8,9,"10+"))+
  theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), 
        panel.background=element_rect(colour="black",fill="white"), 
        axis.text.x=element_blank(), #changing  colour of x axisaxis.text.y=element_text(colour="black"), #changing colour of y acis
        axis.text.y=element_text(colour="black", size=16, family="Times New Roman"), #changing colour of y acis
        axis.title.x=element_text(size=18, family="Times New Roman"),
        axis.title.y=element_text(size=18, family="Times New Roman", vjust=1),
        plot.margin=unit(c(-1,1,1,1), "mm"))+
  annotate("text", x=10, y=.35, label="2012", size=5, family="Times New Roman")


age_13_basic <- ggplot(Age_2013, aes(x=Age))+ 
  geom_histogram(aes(y=(..count..)/sum(..count..)), binwidth=1, origin=-.5, fill="white", color="black")+    # plotting in percent frequency
  scale_y_continuous(labels=percent_format(), limits=c(0,.40))+  ## plotting in percent frequency
  scale_x_continuous(name="Age (years)", limits=c(1,11), breaks=seq(1,10,1), labels=c(1,2,3,4,5,6,7,8,9,"10+"))+
  ylab("")+ # my workaround to make the plots the same size-- creating a blank axis title with the same size will make the plots all of the same size when only one really has a y axis label
  theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), 
        panel.background=element_rect(colour="black",fill="white"), 
        axis.text.x=element_text(colour="black", size=16, family="Times New Roman"), #changing  colour of x axisaxis.text.y=element_text(colour="black"), #changing colour of y acis
        axis.text.y=element_text(colour="black", size=16, family="Times New Roman"), #changing colour of y acis
        axis.title.x=element_text(size=18, family="Times New Roman"),
        axis.title.y=element_text(size=18, family="Times New Roman"),
        plot.title=element_text(size=14),
        plot.margin=unit(c(-3,1,1,1), "mm"))+
  annotate("text", x=10, y=.35, label="2013", size=5, family="Times New Roman")

library(gridExtra)
tiff(file="Multiplot_Age_Histogram.tiff", width=1050, height= 1449, units="px", res=300, pointsize=10)
grid.arrange(age_11_basic,age_12_basic,age_13_basic, ncol=1)
dev.off()

