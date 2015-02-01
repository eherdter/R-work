mydata <- read.csv("2011_Length_weight.csv", header=TRUE,sep=",")



xdata= mydata$Fork.Length..cm
ydata=mydata$Weight..kg

small=cbind(xdata, ydata)
smalldf=data.frame(small)
# setting starting variables W= aL^b, 

a=1
b=3.0

fit2011_lw= nls(ydata ~ a*(xdata^b), start=list(a=a,b=b), data=smalldf)

mydata <- read.csv("2012_Length_weight.csv", header=TRUE,sep=",")



xdata= mydata$Fork.Length..cm
ydata=mydata$Weight..kg

small=cbind(xdata, ydata)
smalldf=data.frame(small)
# setting starting variables W= aL^b, 

a=1
b=3.0

fit2012_lw <-nls(ydata ~ a*(xdata^b), start=list(a=a,b=b), data=smalldf)


mydata <- read.csv("2013_Length_weight.csv", header=TRUE,sep=",")



xdata= mydata$Fork.Length..cm
ydata=mydata$Weight..kg

small = cbind(xdata, ydata)
smalldf= data.frame(small)

# setting starting variables W= aL^b, 

a=1
b=3.0

fit2013_ab= nls(ydata ~ a*(xdata^b), start=list(a=a,b=b), data=smalldf)



### YOU CANT DO THIS ACTUALLY BECAUSE AN ANOVA REALLY COMPARES AND LARGER MODEL WITH A SUB MODEL AND THESE ARE EFFECTIVELY THE SAME MODEL BUT WITH DIFFERENT PARAMETER ESTIMATES ###
anova(fit2011_lw, fit2012_lw)
anova(fit2011_lw, fit2013_ab)
anova(fit2012_lw, fit2013_ab)