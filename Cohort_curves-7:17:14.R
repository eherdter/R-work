## based on Total_BC_length_by_year_5_13.R


mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Biological.Intercept, Increment.Number))


library(bear)
#testdf <-#data.frame(summarySE(newdata,measurevar="Biological.Intercept",groupvars=c("Year.of.Increment.Formation","Increment.Number")))
#testdf$Year.of.Increment.Formation <- factor(testdf$Year.of.Increment.Formation)


testdf <- data.frame(summarySE(newdata, measurevar="Biological.Intercept", groupvars=c("Increment.Number", "Year.of.Increment.Formation")))
testdf$Increment.Number <- factor(testdf$Increment.Number)  # need to be treated as factor levels so that ggplot makes them correctly


Cohort <- rbind(2004,2005,2006,2007,2008,2009,2004,2005,2006,2007,2008,2009,2004,2005,2006,2007,2008,2004,2005,2006,2007,2004,2005,2006)


## can't change the x axis but I want it to display age and not increment number so I will append a new "Age" following discussed (0+, 1+ etc) convention with steve. this will be based on the Increment.Number column

Age <- rbind("2+", "2+", "2+", "2+", "2+", "2+", "3+","3+","3+", "3+" , "3+", "3+", "4+", "4+", "4+", "4+", "4+", "5+", "5+", "5+", "5+", "6+", "6+", "6+")

testdf_wk <- cbind(testdf, Cohort, Age)
testdf_wk$Cohort <- as.factor(as.numeric(testdf_wk$Cohort))

library(ggplot2)
pd <- position_dodge(.05)
Cohort_curves <- ggplot(testdf_wk, aes(x=Year.of.Increment.Formation, y=Biological.Intercept,colour=Cohort, group=Cohort, shape=Age))+
			geom_point()+
			scale_shape_manual(values=c(0,1,2,5,6,7,10))+
			geom_line()+												   
			geom_errorbar(aes(ymin=Biological.Intercept-se, ymax=Biological.Intercept+se), width=.15)+ # position=pd)+
			geom_line()+
			geom_point(size=3.5)+  # changing postion and size of points
			labs(color="Cohort")+  #changing name of legend
			scale_x_continuous(limits=c(2005,2013), breaks=seq(2006,2012,1))+
			theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					      legend.key=element_blank(), 
					      axis.title.x =element_text(colour="black"),
					      axis.text.x = element_text(colour="black"),
					      axis.title.y =element_text(colour="black"),
					      axis.text.y = element_text(colour="black"),
					      legend.background=element_rect(fill='white', colour = 'black'),
					      legend.position=c(.925,.5),
					       axis.text.x=element_text(colour="black"), #changing  colour of x axis
						axis.text.y=element_text(colour="black"), #changing colour of y acis
						plot.title=element_text(size=14))+ # changing size of plot title)+)+
			xlab("Year")+
			scale_y_continuous(limits=c(30,70), breaks=seq(30,70,5), name="Fork Length (cm)")+
			ggtitle("Mean Back-Calculated Fork Length at Age plotted by Cohort")
ggsave('/Users/elizabethherdter/Desktop/R_workspace/Figures/Cohort_curves.pdf', plot=Cohort_curves, width=7, height=4.5)	  
