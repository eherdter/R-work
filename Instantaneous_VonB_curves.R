## based on Total_BC_length_by_year_5_13.R


mydata= read.csv('BC_6_5_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Biological.Intercept, Increment.Number))


library(bear)
testdf <-data.frame(summarySE(newdata,measurevar="Biological.Intercept",groupvars=c("Year.of.Increment.Formation","Increment.Number")))
testdf$Year.of.Increment.Formation <- factor(testdf$Year.of.Increment.Formation)

library(ggplot2)
pd <- position_dodge(.05)
test2 <- ggplot(testdf, aes(x=Increment.Number, y=Biological.Intercept, colour= Year.of.Increment.Formation))+ 												   geom_errorbar(aes(ymin=Biological.Intercept-se, ymax=Biological.Intercept+se), width=.15)+ # position=pd)+
					geom_line()+
					geom_point(size=3)+  # changing postion and size of points
					labs(color="Age")+  #changing name of legend
					ylab("Mean Length at Age")+
					xlab("Increment Number/Age")+
					theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank(), 
					      panel.background=element_rect(colour="black"),
					      legend.key=element_blank(), 
					      axis.title.x =element_text(colour="black"),
					      axis.text.x = element_text(colour="black"),
					      axis.title.y =element_text(colour="black"),
					      axis.text.y = element_text(colour="black"),
					      legend.background=element_rect(fill='white', colour = 'black'))+
					scale_x_continuous(limits=c(3, 7), breaks=seq(3, 7,1))+
					scale_y_continuous(limits=c(30,70), breaks=seq(30,70,5))+
					ggtitle("Back-Calculated Length at Age by Year")
	  
