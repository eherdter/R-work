mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5 | Increment.Number==6 | Increment.Number==7, select=c(Year.of.Increment.Formation, Increment.Width, Increment.Number, Catch.Year, Age.at.Catch))


newdata$Increment.Number = factor(newdata$Increment.Number)

#library(bear)
#df <- data.frame(summarySE(newdata, measurevar="Increment.Width", groupvars=c("Increment.Number", "Year.of.Increment.Formation"))) ## this #givesthe N values, mean Incrment Width, standard deviation and standard error

library(plyr)
test<-ddply(newdata, c("Increment.Number", "Year.of.Increment.Formation"), summarise, N=length(Increment.Width), iw.mean=mean(Increment.Width), sd=sd(Increment.Width), se=sd/sqrt(N))


test1<-ddply(newdata, c( "Age.at.Catch","Catch.Year"), summarise, N=length(Increment.Width), iw.mean=mean(Increment.Width), sd=sd(Increment.Width), se=sd/sqrt(N))
