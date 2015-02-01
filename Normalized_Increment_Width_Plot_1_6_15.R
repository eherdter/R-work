mydata= read.csv('BC_12_16.csv',header=TRUE)

## I want to plot normalized age specific increment widths over the years along with normalized enviro variables that had the highest correlations. So, according to the file Age specific correlation to enviro variables and then an excel file that has all of the correlations compiled
# I have chosen to add May U which correlates slightly to the 3rd and the 5th increment. I will also chose August U which correlates slightly to the 5th and 6th increment. 
# I also will chose October Discharge becuse it correlates to the 5th and 6th increment. 
# In order to include these data I will obtain values for MayU for 3 and MayU for 5 and then just average over the years. Then I will normalize to add to the plot
# To do discharge I will obtain values for both 5th increment and then 6th increment  and then average over the years like above. Then normalize to add them to the plot. 



newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Increment.Width, Increment.Number,Fish.length.at.capture..Lcpt..cm.,Radius.at.age.Ri..mm.,Otolith.radius.at.capture..Rcpt,Biological.Intercept,Length.Increments, May.U, August.U, October.Discharge))


newdata$Increment.Number = factor(newdata$Increment.Number)

#turn enviro variables to numerics

newdata$May.U = as.numeric(as.character(newdata$May.U))
newdata$August.U = as.numeric(as.character(newdata$August.U))
newdata$October.Discharge = as.numeric(as.character(newdata$October.Discharge))

library(bear)
df <- data.frame(summarySE(newdata, measurevar="Increment.Width", groupvars=c("Increment.Number", "Year.of.Increment.Formation"))) ## this givesthe N values, mean Incrment Width, standard deviation and standard error


### could also use library(plyr) and ddply, # http://www.cookbook-r.com/Manipulating_data/Summarizing_data/ 
## ex: working <- ddply(Length_wk, "Age.f", summarise, N= length(FL), length.mean=mean(FL))
## the one problem with this is that it does not include confidence intervals the way that summarySE function does

library(plyr)
test<-ddply(newdata, c("Increment.Number", "Year.of.Increment.Formation"), summarise, N=length(Increment.Width), iw.mean=mean(Increment.Width), sd=sd(Increment.Width), se=sd/sqrt(N), meanBCFLinc=mean(Length.Increments), BCatAge=mean(Biological.Intercept), meanLcpt= mean(Fish.length.at.capture..Lcpt..cm.), meanRi=mean(Radius.at.age.Ri..mm.), meanRcpt=mean(Otolith.radius.at.capture..Rcpt), mayU = mean(May.U), augustU = mean(August.U), october.dis = mean(October.Discharge) )

idx3 <- test$Increment.Number==3 
idx4<- test$Increment.Number==4 
idx5 <- test$Increment.Number ==5 
idx6 <- test$Increment.Number ==6 
idx7 <- test$Increment.Number==7

data_3 <- test[idx3,]   ## MAKING NORMALIZED PLOTS FOR ALL AGE SPECIFIC INCREMENTS
norm<- scale(data_3$iw.mean)
Norm3 <- cbind(data_3, norm)

data_4 <- test[idx4,]
norm <- scale(data_4$iw.mean)
Norm4 <- cbind(data_4, norm)

data_5 <- test[idx5,]
norm<- scale(data_5$iw.mean)
Norm5 <- cbind(data_5, norm)

data_6 <- test[idx6,]
norm <- scale(data_6$iw.mean)
Norm6 <- cbind(data_6, norm)

##data_7 <- test[idx7,] ## removing the seventh increment

final <- rbind(Norm3, Norm4, Norm5, Norm6)


## MAKE DF with enviro variables
## Start with mayU for 3 and 5. I want the mean of mayU for just 3 and 5 over all years.
# I can apply ddply function to the "test" dataframe to give me just mayU for 3 and 5 over all years

# I can use the previously defined data frame for 3 and 5

mayUcombined<- rbind(data_3, data_5)        ##### ----- MAY U for 3 and 5
mayUcombined2 <- ddply(mayUcombined, c( "Year.of.Increment.Formation"), summarise, meanmayU=mean(mayU))
norm <- scale(mayUcombined2$meanmayU)
mayUcomplete <- cbind(mayUcombined2, norm)

augUcombined<- rbind(data_3, data_5)   ##### ----- AUGUST U for 3 and 5 
augUcombined2 <- ddply(augUcombined, c( "Year.of.Increment.Formation"), summarise, meanAugU=mean(augustU))
norm <- scale(augUcombined2$meanAugU)
augUcomplete <- cbind(augUcombined2, norm)


OctDcombined<- rbind(data_3, data_5)   ##### ----- OCTOBER Dis for 5 and 6
OctDcombined2 <- ddply(OctDcombined, c( "Year.of.Increment.Formation"), summarise, meanOctD=mean(october.dis))
norm <- scale(OctDcombined2$meanOctD)
OctDcomplete <- cbind(OctDcombined2, norm)










library(ggplot2)
pd <- position_dodge(.05)
plot <- ggplot(final, aes(x=Year.of.Increment.Formation, y=norm, group= Increment.Number))+   										
  #geom_errorbar(aes(ymin=Increment.Width-se, ymax=Increment.Width+se), width=.15)+ # position=pd)+ # no standard error present for  normalized mean values
  geom_line(aes(linetype= Increment.Number))+
  geom_line(data=mayUcomplete, aes(x= Year.of.Increment.Formation, y= norm),color="red") + 
  geom_line(data=augUcomplete, aes(x=Year.of.Increment.Formation, y=norm), color="blue") +
  geom_line(data=OctDcomplete, aes(x=Year.of.Increment.Formation, y=norm), color= "green" )+
  geom_point(size=3)+  # changing postion and size of points
  labs(color="Increment Number")+  #changing name of legend
  ylab("Normalized Index")+
  xlab("Year")+
  #scale_colour_discrete(name="Increment\nNumber")+#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/#modifying-the-appearance-of-the-legend-title-and-labels, bumps the name to two lines
  scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2012,1))+
  #scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
        panel.background=element_rect(colour="black", fill="white"),
        legend.key=element_blank(), 
        axis.title.x =element_text(colour="black"),
        axis.text.x = element_text(colour="black"),
        axis.title.y =element_text(colour="black"),
        axis.text.y = element_text(colour="black"),
        legend.background=element_rect(fill='white', colour = 'black'),
        legend.position=c(.92,.35),
        axis.text.x=element_text(colour="black"), #changing  colour of x axis
        axis.text.y=element_text(colour="black"), #changing colour of y acis
        plot.title=element_text(size=14))+ # changing size of plot title)+)+
  ggtitle("Mean Otolith Increment Width by Years")

plot2 <- plot + geom_line(data=norm_may3U, aes(x= Year.of.Increment.Formation, y= normU),color="red") + geom_line(data=norm_may5U, aes(x=Year.of.Increment.Formation, y=normU), color="blue") +geom_line
## Now I will put in some environmental variables: I want to chose the ones that have the highest correlations so, according to the file Age specific correlation to enviro variables and then an excel file that has all of the correlations compiled
# I have chosen to add May U which correlates slightly to the 3rd and the 5th increment. I will also chose August U which correlates slightly to the 5th and 6th increment. 
# I also will chose October Discharge becuse it correlates to the 5th and 6th increment. 
# In order to include these data I will obtain values for MayU for 3 AND 5 and then just average over the years. Then I will normalize to add to the plot
# To do discharge I will obtain values for both 5 AND 6 and then average over the years like above. Then normalize to add them to the plot. 

