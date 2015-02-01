mydata= read.csv('BC_10_20_14.csv',header=TRUE)

newdata <- data.frame(subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation,June.MSLA, July.MSLA, August.MSLA, September.MSLA, October.MSLA, November.MSLA, December.MSLA)))

newdata <- newdata[complete.cases(newdata),]


newdata$June.MSLA <- as.numeric(as.character(newdata$June.MSLA))
newdata$July.MSLA <- as.numeric(as.character(newdata$July.MSLA))
newdata$August.MSLA <- as.numeric(as.character(newdata$August.MSLA))
newdata$September.MSLA <- as.numeric(as.character(newdata$September.MSLA))
newdata$October.MSLA <- as.numeric(as.character(newdata$October.MSLA))
newdata$November.MSLA <- as.numeric(as.character(newdata$November.MSLA))
newdata$December.MSLA <- as.numeric(as.character(newdata$December.MSLA))

library(matrixStats)
newdata$meanMSLA <- rowMeans(subset(newdata, select = c(June.MSLA, July.MSLA, August.MSLA, September.MSLA, October.MSLA, November.MSLA, December.MSLA)), na.rm=TRUE) #, na.rm=TRUE) # "August.MSLA", "September.MSLA", "October.MSLA", "November.MSLA", "December.MSLA")), na.rm=TRUE)
#newdata$medianMSLA <- rowMedians(newdata, na.rm=TRUE) #, na.rm=TRUE) # "August.MSLA", "September.MSLA", "October.MSLA", "November.MSLA", "December.MSLA")), na.rm=TRUE)
newdata$medianMSLA <- apply(newdata[,c("June.MSLA", "July.MSLA", "August.MSLA", "September.MSLA", "October.MSLA", "November.MSLA", "December.MSLA")],1, median, na.rm=TRUE) ## to create a MSLA over the growing season
 
## now zero center the median to use in plot

newdata$medianMSLA_zc <- newdata$medianMSLA -mean(newdata$medianMSLA, na.rm=TRUE)



newdata <- newdata[complete.cases(newdata),]
library(plyr)

df_meanMSLA <- ddply(newdata, c("Year.of.Increment.Formation"), summarise, N=length(medianMSLA_zc), mean.MSLA=mean(medianMSLA_zc), sd=sd(medianMSLA_zc), se=sd/sqrt(N))

#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
testMSLA <- ggplot(df_meanMSLA, aes(x=Year.of.Increment.Formation, y=mean.MSLA))+ 											
  geom_errorbar(aes(ymin=mean.MSLA-se, ymax=mean.MSLA+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3)+  # changing postion and size of points
			ylab("Mean Sea Level Anomaly (m)")+
			xlab("Year")+
			
			scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
			#scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
			theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					  
					      axis.title.x =element_text(colour="black", size=10),
					      axis.text.x = element_text(colour="black", size=8),
					      axis.title.y =element_text(colour="black", size=10),
					      axis.text.y = element_text(colour="black", size=8),
					      plot.title=element_text(size=12))+
					      #legend.background=element_rect(fill='white', colour = 'black'),
					      #legend.position=c(.92,.25))+
					ggtitle("Zero Centered Mean Sea Level Anomaly")
