mydata= read.csv('BC_10_20_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Increment.Width, Increment.Number, Length.Increments, Radius.at.age.Ri..mm.))


library(bear)
df <- data.frame(summarySE(newdata, measurevar="Radius.at.age.Ri..mm.", groupvars=c("Increment.Number", "Year.of.Increment.Formation"))) ## this givesthe N values, mean Incrment Width, standard deviation and standard error
## can also use ddply function from package layr, I believe


df$Increment.Number <- factor(df$Increment.Number)

library(ggplot2)
pd <- position_dodge(.05)
testBC <- ggplot(df, aes(x=Year.of.Increment.Formation, y=Radius.at.age.Ri..mm., colour= Increment.Number))+ 												   geom_errorbar(aes(ymin=Radius.at.age.Ri..mm.-se, ymax=Radius.at.age.Ri..mm.+se), width=.15)+ # position=pd)+
					geom_line()+
					geom_point(size=3)+  # changing postion and size of points
					labs(color="Increment Number")+  #changing name of legend
					ylab("Otolith Radius (mm)")+
					xlab("Year")+
					scale_colour_discrete(name="Age")+ 
					scale_x_continuous(limits=c(2006, 2013), breaks=seq(2006, 2013,1))+
					#scale_y_continuous(limits=c(30,70), breaks=seq(30,70,5))+#changing the legend names
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
					ggtitle("Mean Otolith Radius at Age by Years")

ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Total_otolith_radius_at_age.pdf', plot=testBC, width=7, height=4)
