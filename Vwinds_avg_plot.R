mydata= read.csv('BC_10_20_14.csv',header=TRUE)

newdata <- data.frame(subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation,June.V, July.V, August.V, September.V, October.V, November.V, December.V)))

newdata <- newdata[complete.cases(newdata),]

newdata$June.V <- as.numeric(as.character(newdata$June.V))
newdata$July.V <- as.numeric(as.character(newdata$July.V))
newdata$August.V <- as.numeric(as.character(newdata$August.V))
newdata$September.V <- as.numeric(as.character(newdata$September.V))
newdata$October.V <- as.numeric(as.character(newdata$October.V))
newdata$November.V <- as.numeric(as.character(newdata$November.V))
newdata$December.V <- as.numeric(as.character(newdata$December.V))

newdata$meanV <- rowMeans(subset(newdata, select = c(June.V, July.V, August.V, September.V, October.V, November.V, December.V))) #, na.rm=TRUE) # "August.V", "September.V", "October.V", "November.V", "December.V")), na.rm=TRUE)
newdata$medianV <- apply(newdata[,c("June.V", "July.V", "August.V", "September.V", "October.V", "November.V", "December.V")],1, median, na.rm=TRUE) ## to create a MSLA over the growing season

newdata$medianV_zc <- newdata$medianV -mean(newdata$medianV, na.rm=TRUE)

library(plyr)

df_V <- ddply(newdata, c("Year.of.Increment.Formation"), summarise, N=length(medianV_zc), V.mean=mean(medianV_zc), sd=sd(medianV_zc), se=sd/sqrt(N))

#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
testV <- ggplot(df_V, aes(x=Year.of.Increment.Formation, y=V.mean))+ 											
  geom_errorbar(aes(ymin=V.mean-se, ymax=V.mean+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3)+  # changing postion and size of points
			ylab(" V winds (m/s)")+
			xlab("Year")+
			scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
			#scale_y_continuous(limits=c(0,3), breaks=seq(0,3,.5))+#changing the legend names
			theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					  
					      axis.title.x =element_text(colour="black", size=10),
					      axis.text.x = element_text(colour="black", size=8),
					      axis.title.y =element_text(colour="black", size=10),
					      axis.text.y = element_text(colour="black", size=8),
					      plot.title=element_text(size=12))+ # changing size of plot title)+)+

					      #legend.background=element_rect(fill='white', colour = 'black'),
					      #legend.position=c(.92,.25))+
					ggtitle("Zero Centered Mean V winds")
