# find total back calculated length through all years
## May 22- made new changes to BC spread sheet- must update in this code below###
mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Biological.Intercept, Increment.Number))

### change the Age.i. to Increment.Number and Back.Calculated length to Biological Intercept and Year.of.Growth to Increment formation


# logical3 <- (mydata$Age.i. ==3)
# logical4 <- (mydata$Age.i. ==4)
# logical5 <- (mydata$Age.i. ==5)
# logical6 <- (mydata$Age.i. ==6)
# logical7 <- (mydata$Age.i. ==7)

# mydata3 <- mydata[logical3,]
# mydata4 <- mydata[logical4,]
# mydata5 <- mydata[logical5,]
# mydata6 <- mydata[logical6,]
# mydata7 <- mydata[logical7,]

#mydata_c <- rbind(mydata3, mydata4, mydata5, mydata6, mydata7)
#newdata$Year.of.Growth <- as.numeric(levels(newdata$Year.of.Growth))[newdata$Year.of.Growth]
#ag_wk <- aggregate(Biological.Intercept ~ Age.i. + Year.of.Growth, FUN=mean, data = newdata)
library(bear)
testdf <- data.frame(summarySE(newdata, measurevar="Biological.Intercept", groupvars=c("Increment.Number", "Year.of.Increment.Formation")))
## where Biological Intercept is the back calculated length and increment number is semi equal to age
testdf$Increment.Number <- factor(testdf$Increment.Number)  # need to be treated as factor levels so that ggplot makes them correctly


#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
testBC <- ggplot(testdf, aes(x=Year.of.Increment.Formation, y=Biological.Intercept, colour= Increment.Number))+ 												   geom_errorbar(aes(ymin=Biological.Intercept-se, ymax=Biological.Intercept+se), width=.15)+ # position=pd)+
					geom_line()+
					geom_point(size=3)+  # changing postion and size of points
					labs(color="Increment Number")+  #changing name of legend
					ylab("Fork Length (cm)")+
					xlab("Year")+
					scale_colour_discrete(name="Age", breaks=c("3","4","5","6","7"), labels=c("2+","3+","4+","5+","6+"))+ 
					scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
					scale_y_continuous(limits=c(30,70), breaks=seq(30,70,5))+#changing the legend names
					theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					      legend.key=element_blank(), 
					      axis.title.x =element_text(colour="black"),
					      axis.text.x = element_text(colour="black"),
					      axis.title.y =element_text(colour="black"),
					      axis.text.y = element_text(colour="black"),
					      legend.background=element_rect(fill='white', colour = 'black'),
					      legend.position=c(.925,.35),
					       axis.text.x=element_text(colour="black"), #changing  colour of x axis
						axis.text.y=element_text(colour="black"), #changing colour of y acis
						plot.title=element_text(size=14))+ # changing size of plot title)+)+
					ggtitle("Mean Total Back-Calculated Fork Length at Age Through Years")

ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Total_BC_length.tiff', plot=testBC, width=7, height=4, units="in", dpi=300)
					
					

## DISREGARD BELOW TEXT ###
# logical3 <- (ag_wk[,1] ==3)
# logical4 <- (ag_wk[,1] ==4)
# logical5 <- (ag_wk[,1] ==5)
# logical6 <- (ag_wk[,1] ==6)
# logical7 <- (ag_wk[,1] ==7)

# ag3 <- ag_wk[logical3,]
# ag3df <- data.frame(ag3)
# ag4 <- ag_wk[logical4,]
# ag4df <- data.frame(ag4)
# ag5 <- ag_wk[logical5,]
# ag5df <- data.frame(ag5)
# ag6 <- ag_wk[logical6,]
# ag6df<- data.frame(ag6)
# ag7 <- ag_wk[logical7,]
# ag7df <- data.frame(ag7)

# library(ggplot2)
# p <- ggplot(ag3df, aes(Year.of.Growth, Biological.Intercept)) +    geom_line(aes(color="3"))+ geom_line(data=ag4df, aes(color="4"))    +    geom_line(data=ag5df, aes(color="5"))   +    geom_line(data=ag6df, aes(color="6")) + geom_line(data=ag7df, aes(color="7")) + labs(color="Age") 
# p+ ylab("Mean Length at Age") + xlab("Year") +     theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank(), panel.background= element_rect(fill='white', colour='black'), legend.key=element_blank(), legend.background=element_rect(fill='white', colour='black'))     +     scale_x_continuous(limits=c(2007,2013), breaks=seq(2007, 2013,1))   + scale_y_continuous(limits= c(40,70), breaks=seq(40,70, 5))   +  ggtitle("Back-Calculated Length Through Years") 


#logical_age <- (mydata$Age.i. != 1 & mydata$Age.i. != 2 & mydata$Age.i. != 3.5 & mydata$Age.i. != 4.5 & mydata$Age.i. != 5.5 & #mydata$Age.i. !=6.5 & mydata$Age.i. != 7.5 & mydata$Age.i. != 8.5 & mydata$Age.i. !=9.5 & mydata$Age.i. != 9)

#mydata_sm = mydata[logical_age,]


#mydata_sm$Year.of.Growth <- factor(mydata_sm$Year.of.Growth)  #factor to create new levels with newly created data frame

#mydata_sm$Year.of.Growth <- as.character(mydata_sm$Year.of.Growth) 
#mydata_sm$Year.of.Growth <- as.numeric(levels(mydata_sm$Year.of.Growth))[mydata_sm$Year.of.Growth]


# library(plyr)
# mean_values_3 <- ddply(mydata3, "Year.of.Growth", transform, grp.mean.values=mean(Back.Calculated.Length))



#ag_sm <- aggregate(Back.Calculated.Length ~ Age.i. + Year.of.Growth, FUN=mean, data=mydata_sm)

#ag_dm <- data.matrix(ag)
# logical3 <- (ag_wk[,1] ==3)
# logical4 <- (ag_wk[,1] ==4)
# logical5 <- (ag_wk[,1] ==5)
# logical6 <- (ag_wk[,1] ==6)
# logical7 <- (ag_wk[,1] ==7)

# ag3 <- ag_sm[logical3,]
# ag3df <- data.frame(ag3)
# ag4 <- ag_sm[logical4,]
# ag4df <- data.frame(ag4)
# ag5 <- ag_sm[logical5,]
# ag5df <- data.frame(ag5)
# ag6 <- ag_sm[logical6,]
# ag6df<- data.frame(ag6)
# ag7 <- ag_sm[logical7,]
# ag6df <- data.frame(ag7)

# ag3_Length = ag3[,3]
# ag3_Year = ag3[,2]
# ag4_Length = ag4[,3]
# ag4_Year = ag4[,2]
# ag5_Length = ag5[,3]
# ag5_Year = ag5[,2]

# ag6_Year = ag6[,2]
# ag6_Length = ag6[,3]

# ag7_Year = ag7[,2]
# ag7_Length =ag7[,3]



# p <- ggplot(ag3df, aes(Year.of.Growth, Back.Calculated.Length)) + geom_line(aes(color="3"))+ geom_line(data=ag4df, aes(color="4")) + labs(color="Legend text")

# xlab= "Year of Growth"
# ylab= "Back-Calculated Fork Length"
# x_range = range(ag_sm[,2])

# #labels = c( "2006-2007", "2007-2008", "2008-2009", "2009-2010", "2010-2011", "2011-2012", "2012-2013")

# plot(ag3_Year, ag3_Length, main="Total Back-Calculated Length at Age", type="o", col="blue", ylim= c(20,70), xlim=x_range, xlab= "Year of Growth", ylab = "Back-Calculated Fork Length")
# #axis(1, at =3:9, labels= c( "2006-2007", "2007-2008", "2008-2009", "2009-2010", "2010-2011", "2011-2012", "2012-2013"))
# #text(1, str=45, at=3:9, labels= c( "2006-2007", "2007-2008", "2008-2009", "2009-2010", "2010-2011", "2011-2012", "2012-2013"))

# #text(axTicks(1), par("usr")[3] -2, srt =45,  adj=1, at=3:9, labels= c( "2006-2007", "2007-2008", "2008-2009", "2009-2010", "2010-2011", "2011-2012", "2012-2013"), xpd=T, cex=0.8)

# par(new=T)
# plot(ag4_Year, ag4_Length, type= "o", col="red", axes=F, xlab= xlab, ylab = ylab)
# text(1, at= 2)

# par(new=T)
# plot(ag5_Year, ag5_Length, type="o", col= "green", axes=F, xlab=xlab, ylab=ylab)
# plot()

# help(plot
# )

# plot(ag_Year)



# library(reshape)
# library(ggplot2)
# ag_smdf <- data.frame(ag_sm)
# ag_smdf.melt <- melt(ag_smdf, id = "Year.of.Growth")

# ggplot(data=ag_smdf.melt, aes(x=Year.of.Growth, y=Age.i.))