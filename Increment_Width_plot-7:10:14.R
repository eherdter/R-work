
## plotting increment widths

mydata= read.csv('BC_12_16.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Increment.Width, Increment.Number,Fish.length.at.capture..Lcpt..cm.,Radius.at.age.Ri..mm.,Otolith.radius.at.capture..Rcpt,Biological.Intercept,Length.Increments))


newdata$Increment.Number = factor(newdata$Increment.Number)

library(bear)
df <- data.frame(summarySE(newdata, measurevar="Increment.Width", groupvars=c("Increment.Number", "Year.of.Increment.Formation"))) ## this givesthe N values, mean Incrment Width, standard deviation and standard error


### could also use library(plyr) and ddply, # http://www.cookbook-r.com/Manipulating_data/Summarizing_data/ 
## ex: working <- ddply(Length_wk, "Age.f", summarise, N= length(FL), length.mean=mean(FL))
## the one problem with this is that it does not include confidence intervals the way that summarySE function does

library(plyr)
test<-ddply(newdata, c("Increment.Number", "Year.of.Increment.Formation"), summarise, N=length(Increment.Width), iw.mean=mean(Increment.Width), sd=sd(Increment.Width), se=sd/sqrt(N), meanBCFLinc=mean(Length.Increments), BCatAge=mean(Biological.Intercept), meanLcpt= mean(Fish.length.at.capture..Lcpt..cm.), meanRi=mean(Radius.at.age.Ri..mm.), meanRcpt=mean(Otolith.radius.at.capture..Rcpt) )


## where Biological Intercept is the back calculated length and increment number is semi equal to age
df$Increment.Number <- factor(df$Increment.Number)  # need to be treated as factor levels so that ggplot makes them correctly

#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
library(ggplot2)
pd <- position_dodge(.05)
test <- ggplot(df, aes(x=Year.of.Increment.Formation, y=Increment.Width, colour= Increment.Number))+ 											geom_errorbar(aes(ymin=Increment.Width-se, ymax=Increment.Width+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3)+  # changing postion and size of points
			labs(color="Increment Number")+  #changing name of legend
			ylab("Increment Width (mm)")+
			xlab("Year")+
			scale_colour_discrete(name="Increment\nNumber")+#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/#modifying-the-appearance-of-the-legend-title-and-labels, bumps the name to two lines
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
ggsave("/Users/elizabethherdter/Desktop/R_workspace/Figures/Increment_Width.tiff", plot=test, width=7, height=4, units="in", dpi=300)
