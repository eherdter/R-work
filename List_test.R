mydata= read.csv('BC_6_23_14.csv',header=TRUE)

newdata <- subset(mydata, Increment.Number ==3 | Increment.Number==4 | Increment.Number==5, select=c(Year.of.Increment.Formation, Increment.Width, Increment.Number, Catch.Year, Age.at.Catch))


newdata$Increment.Number = factor(newdata$Increment.Number)

