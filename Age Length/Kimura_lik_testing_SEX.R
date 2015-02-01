## For some reason this code is broken.. not sure whats going on -9/2/14


mydata = read.csv('AgeLengthWeight_master.csv', header=TRUE)





library(fishmethods)
results<- vblrt(mydata$Fork.Length..cm, mydata$Fractional.Age, group=mydata$Sex, error=1, select=2,Linf=80, K=.20, t0=-.18, plottype=0)