## based on Total_BC_length_by_year_5_13.R


mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Biological.Intercept, Increment.Number))


library(bear)
testdf <-data.frame(summarySE(newdata,measurevar="Biological.Intercept",groupvars=c("Year.of.Increment.Formation","Increment.Number")))
testdf$Year.of.Increment.Formation <- factor(testdf$Year.of.Increment.Formation)
## can't change the x axis but I want it to display age and not increment number so I will append a new "Age" following discussed (0+, 1+ etc) convention with steve. this will be based on the Increment.Number column

Age <- rbind("2+", "2+", "3+", "2+", "3+", "4+", "2+","3+","4+", "5+" , "2+", "3+", "4+", "5+", "6+", "2+", "3+", "4+", "5+", "6+", "3+", "4+", "5+", "6+")

testdf_wk <- cbind(testdf, Age)

library(ggplot2)
pd <- position_dodge(.05)
test2 <- ggplot(testdf_wk, aes(x=Age, y=Biological.Intercept, colour= Year.of.Increment.Formation, group=Year.of.Increment.Formation))+
geom_point()+
geom_line()+												   
geom_errorbar(aes(ymin=Biological.Intercept-se, ymax=Biological.Intercept+se), width=.15)+ # position=pd)+
					geom_line()+
					geom_point(size=3)+  # changing postion and size of points
					labs(color="Year")+  #changing name of legend
					theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black", fill="white"),
					      legend.key=element_blank(), 
					      axis.title.x =element_text(colour="black"),
					      axis.text.x = element_text(colour="black"),
					      axis.title.y =element_text(colour="black"),
					      axis.text.y = element_text(colour="black"),
					      legend.background=element_rect(fill='white', colour = 'black'),
					      legend.position=c(.9,.3),
					       axis.text.x=element_text(colour="black"), #changing  colour of x axis
						axis.text.y=element_text(colour="black"), #changing colour of y acis
						plot.title=element_text(size=14))+ # changing size of plot title)+)+
					xlab("Age")+
					scale_y_continuous(limits=c(30,70), breaks=seq(30,70,5), name="Mean Fork Length (cm)")+
					ggtitle("Back-Calculated Growth Curves by Year")
	  
