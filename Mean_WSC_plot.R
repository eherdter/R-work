mydata= read.csv('BC_10_20_14.csv',header=TRUE)

newdata <- data.frame(subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation,June.WSC, July.WSC, August.WSC, September.WSC, October.WSC, November.WSC, December.WSC)))

newdata <- newdata[complete.cases(newdata),]

newdata$June.WSC <- as.numeric(as.character(newdata$June.WSC))
newdata$July.WSC <- as.numeric(as.character(newdata$July.WSC))
newdata$August.WSC <- as.numeric(as.character(newdata$August.WSC))
newdata$September.WSC <- as.numeric(as.character(newdata$September.WSC))
newdata$October.WSC <- as.numeric(as.character(newdata$October.WSC))
newdata$November.WSC <- as.numeric(as.character(newdata$November.WSC))
newdata$December.WSC <- as.numeric(as.character(newdata$December.WSC))

newdata <- newdata[complete.cases(newdata),]

newdata$meanWSC <- rowMeans(subset(newdata, select = c(June.WSC, July.WSC, August.WSC, September.WSC, October.WSC, November.WSC, December.WSC))) #, na.rm=TRUE) # "August.WSC", "September.WSC", "October.WSC", "November.WSC", "December.WSC")), na.rm=TRUE)
newdata$medianWSC <- apply(newdata[,c("June.WSC", "July.WSC", "August.WSC", "September.WSC", "October.WSC", "November.WSC", "December.WSC")],1, median, na.rm=TRUE) ## to create a MSLA over the growing season

newdata$medianWSC_zc <- newdata$medianWSC -mean(newdata$medianWSC, na.rm=TRUE)



library(plyr)

df_WSC <- ddply(newdata, c("Year.of.Increment.Formation"), summarise, N=length(medianWSC_zc), WSC.mean=mean(medianWSC_zc), sd=sd(medianWSC_zc), se=sd/sqrt(N))

#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
testWSC <- ggplot(df_WSC, aes(x=Year.of.Increment.Formation, y=WSC.mean))+ 											
  geom_errorbar(aes(ymin=WSC.mean-se, ymax=WSC.mean+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3)+  # changing postion and size of points
			ylab("Wind Stress Curl (E-8 N m^-3)")+
			xlab("Year")+
			
			scale_x_continuous(limits=c(2006, 2012), breaks=seq(2006, 2012,1))+
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
					ggtitle("Zero Centered Mean Wind Stress Curl")
