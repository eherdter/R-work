## cant use xtable directly on a nls object so I will have to manually create a table from the outputs

## i made some latex text for the FitM data all of the way at the bottom so I will just obtain estimates in R for all of the others and then I will just use those values in copy and pasted Latex documents. The documents will be labeled the same as the fits


mydata11 <- read.csv("2011_Age_length.csv", header=TRUE,sep=",")


x11 = data.frame(mydata11$Fractional.Age) 

y11 = data.frame(mydata11$Fork.Length..cm.)


small11= cbind(x11, y11)
small11 <- small11[complete.cases(small11),]
smalldf11= data.frame(small11)
colnames(smalldf11) <- c("x11", "y11")

# setting starting variables where P1= Linf, P2= K and P3= t0

p1_11 = 100
p2_11 = .18
p3_11= -5


fit2011 = nls(y11 ~ p1_11*(1-exp(-p2_11*(x11-p3_11))), start=list(p1_11=p1_11, p2_11=p2_11, p3_11=p3_11), data=smalldf11)
summary(fit2011)
library(nlstools)

boot11 <- nlsBoot(fit2011)
boot11$bootCI


names <- c("Linf", "k", "t0")   # will delete the quotes in compiler
names <- matrix(names, ncol=1)

Median <- matrix(rbind(85.0168175,0.2163300,0.8732912))
two <- matrix(rbind(80.2222013,0.1799450,0.260500))
ninesev <- matrix(rbind(89.541797,0.260500, 1.324153))


Latex <- data.frame(cbind(names,Median, two, ninesev))
colnames(Latex) <- c("names", "Median", "2.5%", "97.5%")

Latex_Fit11 <- xtable(Latex, floating=FALSE)




mydata12 <- read.csv("2012_Age_length.csv", header=TRUE,sep=",")


x12 = mydata12$Fractional.Age 

y12 = mydata12$Fork.Length..cm

small12=cbind(x12, y12)
smalldf12= data.frame(small12)

Linf = 80
K = .18
t0= 0


fit2012 = nls(y12 ~ Linf*(1-exp(-K*(x12-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf12)

boot12 <- nlsBoot(fit2012)
boot12$bootCI

mydata13 <- read.csv("2013_Age_length.csv", header=TRUE,sep=",")



x13 = mydata13$Fractional.Age
y13 = mydata13$Fork.Length..cm
small13= cbind(x13, y13)
smalldf13= data.frame(small13)

plot(x13, y13)

# setting starting variables where P1= Linf, P2= K and P3= t0

Linf= 80
K = .18
t0= .55

fit2013 = nls(y13 ~ Linf*(1-exp(-K*(x13-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf13)
boot13 <- nlsBoot(fit2013)
summary(fit2013)
boot13$bootCI



mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")



x = data.frame(mydata$Fractional.Age)
y = data.frame(mydata$Fork.Length..cm)
data <- cbind(x, y)
idx_remove <- x>0.8
data_wk<-data.frame(data[idx_remove,])
data_wk <- data.frame(data_wk[complete.cases(data_wk),])
colnames(data_wk) <- c("x", "y")

data_wk$x <- as.numeric(as.character(data_wk$x))  # for some reason the above values were turned to characters so the below code was acting funny. by changing the x values to numeric values it seems to also change the y values to numeric values




# setting starting variables where P1= Linf, P2= K and P3= t0 where t0= age where organisms would have zero size

p1 = 80
p2 = .18
p3= 0


fit = nls(y ~ p1*(1-exp(-p2*(x-p3))), start=list(p1=p1, p2=p2,p3=p3), data=data_wk)

boot <- nlsBoot(fit)

boot$bootCI


mydata <- read.csv("Raw_Age_length.csv", header=TRUE,sep=",")


logicalF <- (mydata$Sex =="F")
mydataF <-mydata[logicalF,]


FemaleAge = mydataF$Fractional.Age
FemaleLength=mydataF$Fork.Length..cm

small= cbind(FemaleAge, FemaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

remove_idx <- smalldf1$FemaleAge > 0.8

smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wk <- data.frame(smalldf2$FemaleAge, smalldf2$FemaleLength)
colnames(smalldf_wk) <- c("FemaleAge", "FemaleLength")

Linf=80
K=.18
t0=0

fitF= nls(FemaleLength ~  Linf*(1-exp(-K*(FemaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wk)
bootF <- nlsBoot(fitF)

bootF$bootCI




logicalM<- (mydata$Sex =="M")
mydataM <-mydata[logicalM,]

MaleAge = mydataM$Fractional.Age
MaleLength=mydataM$Fork.Length..cm

small= cbind(MaleAge, MaleLength)
smalldf=data.frame(small)
smalldf1 <- data.frame(smalldf[complete.cases(smalldf),])

remove_idx <- smalldf1$MaleAge > 0.8

smalldf2 <- (smalldf1[remove_idx,]) # wont reorder the numbers so I will have to adjust in a few steps following

smalldf_wkM <- data.frame(smalldf2$MaleAge, smalldf2$MaleLength)
colnames(smalldf_wkM) <- c("MaleAge", "MaleLength")

Linf=80
K=.18
t0=0

fitM= nls(MaleLength ~  Linf*(1-exp(-K*(MaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wkM)

names <- c("Linf", "k", "t0")   # will delete the quotes in compiler
names <- matrix(names, ncol=1)

Estimate <- matrix(rbind(78.42656,0.23834,0.69122))
Std.Error <- matrix(rbind(2.08163,0.02488,0.30484))
tvalue <- matrix(rbind(37.676,9.581,2.267))
P <- matrix(rbind("<2e-16***", "<2e-16***", "0.0239*"))

Latex <- data.frame(cbind(names,Estimate, Std.Error, tvalue, P))
colnames(Latex) <- c("names", "Estimate", "Std.Error", "t value", "Pr(>|t|)")

Latex_FitM <- xtable(Latex, floating=FALSE)

bootM<- nlsBoot(fitM)

bootM$bootCI





### borrowed to use stargazer tables ## 
#http://stackoverflow.com/questions/23474766/how-to-get-beautiful-latex-output-of-nls-object

library(stargazer)

### start with an arbitrary lm model, following suited for the given situation
lm1 = lm(rating ~ complaints + privileges + learning - 1, data=attitude)
fakeX = c("complaints", "privileges", "learning")

### nls model to be represented by stargazer
DNase1 <- subset(DNase, Run == 1)
fitM= nls(MaleLength ~  Linf*(1-exp(-K*(MaleAge-t0))), start=list(Linf=Linf, K=K,t0=t0), data=smalldf_wkM)
summary(fitM)

### generate various parts for output
sum_fitM = summary(fitM)
mat_fitM = sum_fitM$coefficients
colnames(mat_fitM) = c("coef","se", "t", "p")
indVarNames = rownames(mat_fitM)

### generate coefficients, se, t-stat and p values 
df_fitM = as.data.frame(mat_fitM)
vCoef = df_fitM$coef; names(vCoef)=fakeX
vSE = df_fitM$se; names(vSE)=fakeX
vT = df_fitM$t; names(vT)=fakeX
vP = df_fitM$p; names(vP)=fakeX

formulaTxt = sum_fitM$formula
nParameters = sum_fitM$df[1]
nDF = sum_fitM$df[2]
rss = round(sum_fitM$sigma, 3)
convTolerance = fitM$m$conv()

### various aesthetics for stargazer
vTitle = "Regression Results Model: "
vType = "latex"
vDepLabel = c("density")
outFile=c("./model.tex")
vLines=c(sprintf("RSE: %0.3f", rss), sprintf("df = %d", nDF))
vNotes=c(sprintf("Achieved convergence tolerance: %0.5f", convTolerance))

### and the output follows
outStar = stargazer(lm1, title = vTitle, out=outFile, out.header=T,
    no.space=T, digits=3, type=vType, single.row=T,
    omit.stat = c("rsq","adj.rsq", "f", "n", "ser"),
    covariate.labels = indVarNames, dep.var.labels = vDepLabel,
    add.lines=list(vLines),
    notes=vNotes, notes.append=T,
    coef=list(vCoef), se=list(vSE), t=list(vT), p=list(vP)
    )