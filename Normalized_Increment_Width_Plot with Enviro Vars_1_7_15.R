setwd("~/Desktop/R_workspace")
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
test<-ddply(newdata, c("Increment.Number", "Year.of.Increment.Formation"), summarise,  iw.mean=mean(Increment.Width), sd=sd(Increment.Width), se=sd/sqrt(iw.mean), meanBCFLinc=mean(Length.Increments), BCatAge=mean(Biological.Intercept), meanLcpt= mean(Fish.length.at.capture..Lcpt..cm.), meanRi=mean(Radius.at.age.Ri..mm.), meanRcpt=mean(Otolith.radius.at.capture..Rcpt), mayU = mean(May.U), augustU = mean(August.U), october.dis = mean(October.Discharge) )

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

NormInc <- data.frame(rbind(Norm3, Norm4, Norm5, Norm6))


## MAKE DF with enviro variables
## Start with mayU for 3 and 5. I want the mean of mayU for just 3 and 5 over all years.
# I can apply ddply function to the "test" dataframe to give me just mayU for 3 and 5 over all years

# I can use the previously defined data frame for 3 and 5

mayUcombined<- rbind(data_3, data_5)        ##### ----- MAY U for 3 and 5
mayUcombined2 <- ddply(mayUcombined, c( "Year.of.Increment.Formation"), summarise, Average=mean(mayU))
norm <- scale(mayUcombined2$Average)
name <- rep("May U", 7)
mayUcomplete <- cbind(name,mayUcombined2, norm)

augUcombined<- rbind(data_3, data_5)   ##### ----- AUGUST U for 3 and 5 
augUcombined2 <- ddply(augUcombined, c( "Year.of.Increment.Formation"), summarise, Average=mean(augustU))
norm <- scale(augUcombined2$Average)
name <- rep("Aug. U", 7)
augUcomplete <- cbind(name, augUcombined2, norm)


OctDcombined<- rbind(data_3, data_5)   ##### ----- OCTOBER Dis for 5 and 6
OctDcombined2 <- ddply(OctDcombined, c( "Year.of.Increment.Formation"), summarise, Average=mean(october.dis))
norm <- scale(OctDcombined2$Average)
name <- rep("Oct. RD", 7)
OctDcomplete <- cbind(name, OctDcombined2, norm)


EnviroFinal <- rbind(mayUcomplete, augUcomplete, OctDcomplete)



library(ggplot2)
pd <- position_dodge(.05)
plot_both <- ggplot() + geom_line(data=NormInc, aes(x=Year.of.Increment.Formation, y=norm,  color=Increment.Number))+   										
  #geom_errorbar(aes(ymin=Increment.Width-se, ymax=Increment.Width+se), width=.15)+ # position=pd)+ # no standard error present for  normalized mean values
  #scale_linetype_manual(values=c(6,3,4,5))+
  #scale_colour_discrete(name="Increment\nNumber")+
  geom_line(data=EnviroFinal, aes(x= Year.of.Increment.Formation, y= norm, group=name, linetype= name)) + 
  #geom_point(size=3)+  # changing postion and size of points
  #labs(color="Increment Number")+  #changing name of legend
  ylab("Normalized Index")+
  xlab("Year")+
  scale_colour_discrete(name="Increment.Number", breaks=c("3", "4", "5", "6"), labels =c("3", "4", "5", "6"))+#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/#modifying-the-appearance-of-the-legend-title-and-labels, bumps the name to two lines
  scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2012,1))+
  #scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
        panel.background=element_rect(colour="black", fill="white"),
        legend.key=element_blank(), 
        axis.title.x =element_text(family= "Times New Roman", colour="black"),
        axis.text.x = element_text(family= "Times New Roman", colour="black"),
        axis.title.y =element_text(family= "Times New Roman", colour="black"),
        axis.text.y = element_text(family= "Times New Roman", colour="black"),
        legend.title = element_blank(),
        legend.text = element_text(family= "Times New Roman"),
        #legend.background=element_rect(fill='white', colour = 'black'),
        legend.position= c(.91,.65))
        #axis.text.x=element_text(colour="black"), #changing  colour of x axis
        #axis.text.y=element_text(colour="black"), #changing colour of y acis
        #plot.title=element_text(size=14)) # changing size of plot title)+)+
  #ggtitle("Mean Otolith Increment Width by Years")
  
tiff(file="NormalizedIncPlot.tiff", width=2175, height= 1449, units="px", res=300, pointsize=12)
plot(plot_both)
dev.off()





inc <- ggplot() + geom_line(data=NormInc, aes(x=Year.of.Increment.Formation, y=norm,  group=Increment.Number, linetype= Increment.Number), size=1)+     									
  #geom_errorbar(aes(ymin=Increment.Width-se, ymax=Increment.Width+se), width=.15)+ # position=pd)+ # no standard error present for  normalized mean values
  #scale_linetype_manual(values=c(6,3,4,5))+
  #scale_colour_discrete(name="Increment\nNumber")+
  #geom_point(size=3)+  # changing postion and size of points
  #labs(color="Increment Number")+  #changing name of legend
  ylab("Normalized Index")+
  xlab("Year")+
  scale_colour_discrete(name="Increment.Number", breaks=c("3", "4", "5", "6"), labels =c("3", "4", "5", "6"))+#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/#modifying-the-appearance-of-the-legend-title-and-labels, bumps the name to two lines
  scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2012,1))+
  #scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
        panel.background=element_rect(colour="black", fill="white"),
        legend.key=element_blank(), 
        axis.title.x =element_text(family= "Times New Roman", colour="black", size=24),
        axis.text.x = element_text(family= "Times New Roman", colour="black", size=24),
        axis.title.y =element_text(family= "Times New Roman", colour="black", size=24),
        axis.text.y = element_text(family= "Times New Roman", colour="black", size=24),
        legend.title = element_blank(),
        legend.text = element_text(family= "Times New Roman", size=20),
        #legend.background=element_rect(fill='white', colour = 'black'),
        legend.position= c(.9,.7))
#axis.text.x=element_text(colour="black"), #changing  colour of x axis
#axis.text.y=element_text(colour="black"), #changing colour of y acis
#plot.title=element_text(size=14)) # changing size of plot title)+)+
#ggtitle("Mean Otolith Increment With by Years")


enviro <- ggplot() + geom_line(data=EnviroFinal, aes(x= Year.of.Increment.Formation, y= norm, group=name, linetype= name), size=1) + 
   ylab("Normalized Index")+
  xlab("Year")+
  scale_colour_discrete(name="name")+#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/#modifying-the-appearance-of-the-legend-title-and-labels, bumps the name to two lines
  scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2012,1))+
  #scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
        panel.background=element_rect(colour="black", fill="white"),
        legend.key=element_blank(), 
        axis.title.x =element_text(family= "Times New Roman", colour="black", size=24),
        axis.text.x = element_text(family= "Times New Roman", colour="black", size=24),
        axis.title.y =element_text(family= "Times New Roman", colour="black", size=24),
        axis.text.y = element_text(family= "Times New Roman", colour="black", size=24),
        legend.title = element_blank(),
        legend.text = element_text(family= "Times New Roman", size=20),
        #legend.background=element_rect(fill='white', colour = 'black'),
        legend.position= c(.85,.77))
#axis.text.x=element_text(colour="black"), #changing  colour of x axis
#axis.text.y=element_text(colour="black"), #changing colour of y acis
#plot.title=element_text(size=14)) # changing size of plot title)+)+
#ggtitle("Mean Otolith Increment Width by Years")


## PLotting the INC and ENVIRO on TOP of eachother,
# for some reason, when you use grid.arrange you need to specify point size in the tiff() unlike when you just do normal tiff(). In that 
# case you dont specify point size and just depend upon the size within the size() in the theme()
tiff(file="Multiplot_Inc_Enviro.tiff", width=2175, height= 2898, units="px", res=300, pointsize=20)
grid.arrange(inc,enviro, ncol=1)
     dev.off()



### SAVE PLOT AND ADD TO MY WORD DOCUMENT ###

## Now I will put in some environmental variables: I want to chose the ones that have the highest correlations so, according to the file Age specific correlation to enviro variables and then an excel file that has all of the correlations compiled
# I have chosen to add May U which correlates slightly to the 3rd and the 5th increment. I will also chose August U which correlates slightly to the 5th and 6th increment. 
# I also will chose October Discharge becuse it correlates to the 5th and 6th increment. 
# In order to include these data I will obtain values for MayU for 3 AND 5 and then just average over the years. Then I will normalize to add to the plot
# To do discharge I will obtain values for both 5 AND 6 and then average over the years like above. Then normalize to add them to the plot. 

