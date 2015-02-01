mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Increment.Width, Increment.Number, Length.Increments))


newdata$Increment.Number = factor(newdata$Increment.Number)

library(bear)
df <- data.frame(summarySE(newdata, measurevar="Length.Increments", groupvars=c("Increment.Number", "Year.of.Increment.Formation"))) ## this givesthe N values, mean Incrment Width, standard deviation and standard error


df$Increment.Number <- factor(df$Increment.Number)  # need to be treated as factor levels so that ggplot makes them correctly

#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
test4 <- ggplot(df, aes(x=Year.of.Increment.Formation, y=Length.Increments, colour= Increment.Number))+ 											geom_errorbar(aes(ymin=Length.Increments-se, ymax=Length.Increments+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3)+  # changing postion and size of points
			labs(color="Increment Number")+  #changing name of legend
			ylab("Back Calculated Fork Length Increments (cm)")+
			xlab("Year")+
			scale_colour_discrete(name="Increment\nNumber")+#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/#modifying-the-appearance-of-the-legend-title-and-labels, bumps the name to two lines
			scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
			#scale_y_continuous(limits=c(.05,.35), breaks=seq(.05,.35,.05))+#changing the legend names
			theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					      legend.key=element_blank(), 
					      axis.title.x =element_text(colour="black"),
					      axis.text.x = element_text(colour="black"),
					      axis.title.y =element_text(colour="black"),
					      axis.text.y = element_text(colour="black"),
					      legend.background=element_rect(fill='white', colour = 'black'),
					      legend.position=c(.92,.25),
					      axis.text.x=element_text(colour="black"), #changing  colour of x axis
						axis.text.y=element_text(colour="black"), #changing colour of y acis
						plot.title=element_text(size=14))+ # changing size of plot title)+)+
					ggtitle("Mean Back Calculated Fork Length Increments")
					
ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Total_BC_length.tiff', plot=test4, width=7, height=4, units="in", dpi=300)