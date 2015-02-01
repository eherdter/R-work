# Correlation anaylsis with master chronology and averages of environmental variables in northern GOM and WFS

## to parse data from West Florida Shelf#########################

data= read.csv("BC_11_17_14.csv", header=TRUE)

idx3 <- data$Increment.Number==3 
idx4<- data$Increment.Number==4 
idx5 <- data$Increment.Number ==5 
idx6 <- data$Increment.Number ==6 
idx7 <- data$Increment.Number==7

data_3 <- data[idx3,]
data_4 <- data[idx4,]
data_5 <- data[idx5,]
data_6 <- data[idx6,]
data_7 <- data[idx7,]

data_wk= data.frame(rbind(data_3, data_4, data_5, data_6, data_7))



data_wk$nJune.U = as.numeric(as.character(data_wk$June.U));
data_wk$nJuly.U = as.numeric(as.character(data_wk$July.U));
data_wk$nAugust.U = as.numeric(as.character(data_wk$August.U));
data_wk$nSeptember.U = as.numeric(as.character(data_wk$September.U));
data_wk$nOctober.U = as.numeric(as.character(data_wk$October.U));
data_wk$nNovember.U = as.numeric(as.character(data_wk$November.U));
data_wk$nDecember.U = as.numeric(as.character(data_wk$December.U));

data_wk$nJune.V = as.numeric(as.character(data_wk$June.V));
data_wk$nJuly.V = as.numeric(as.character(data_wk$July.V));
data_wk$nAugust.V = as.numeric(as.character(data_wk$August.V));
data_wk$nSeptember.V = as.numeric(as.character(data_wk$September.V));
data_wk$nOctober.V = as.numeric(as.character(data_wk$October.V));
data_wk$nNovember.V = as.numeric(as.character(data_wk$November.V));
data_wk$nDecember.V = as.numeric(as.character(data_wk$December.V));

data_wk$nAvg.Discharge= as.numeric(as.character(data_wk$Avg.Discharge))

data_wk$nJune.MSLA = as.numeric(as.character(data_wk$June.MSLA))
data_wk$nJuly.MSLA = as.numeric(as.character(data_wk$July.MSLA))
data_wk$nAugust.MSLA = as.numeric(as.character(data_wk$August.MSLA))
data_wk$nSeptember.MSLA = as.numeric(as.character(data_wk$September.MSLA))
data_wk$nOctober.MSLA = as.numeric(as.character(data_wk$October.MSLA))
data_wk$nNovember.MSLA = as.numeric(as.character(data_wk$November.MSLA))
data_wk$nDecember.MSLA = as.numeric(as.character(data_wk$December.MSLA))

data_wk$nJune.WSC = as.numeric(as.character(data_wk$June.WSC))
data_wk$nJuly.WSC = as.numeric(as.character(data_wk$July.WSC))
data_wk$nAugust.WSC = as.numeric(as.character(data_wk$August.WSC))
data_wk$nSeptember.WSC = as.numeric(as.character(data_wk$September.WSC))
data_wk$nOctober.WSC = as.numeric(as.character(data_wk$October.WSC))
data_wk$nNovember.WSC = as.numeric(as.character(data_wk$November.WSC))
data_wk$nDecember.WSC = as.numeric(as.character(data_wk$December.WSC))





Av.Dis <- data_wk$nAvg.Discharge 

Year.of.Increment.Formation <- data_wk$Year.of.Increment.Formation

CatchYr <- data_wk$Catch.Year

Fish.ID <- data_wk$Fish.ID

Age.at.Catch <- data_wk$Age.at.Catch

IncNum <- data_wk$Increment.Number

Detrended <- data_wk$R.Detrended

U_winds= cbind(data_wk$nJune.U, data_wk$nJuly.U, data_wk$nAugust.U, data_wk$nSeptember.U, data_wk$nOctober.U, data_wk$nNovember.U, data_wk$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk$nJune.V, data_wk$nJuly.V, data_wk$nAugust.V, data_wk$nSeptember.V, data_wk$nOctober.V, data_wk$nNovember.V, data_wk$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk$nJune.MSLA, data_wk$nJuly.MSLA,data_wk$nAugust.MSLA,data_wk$nSeptember.MSLA,data_wk$nOctober.MSLA,data_wk$nNovember.MSLA,data_wk$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk$nJune.WSC, data_wk$nJuly.WSC,data_wk$nAugust.WSC,data_wk$nSeptember.WSC,data_wk$nOctober.WSC,data_wk$nNovember.WSC,data_wk$nDecember.WSC)

WSC_median=apply(WSC,1,median)

data_wk1=cbind(Detrended, IncNum, Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)

data_wkdf = data.frame(data_wk1)


library(plyr)
U_mean<-ddply(data_wkdf, .(Year.of.Increment.Formation), summarise, N=length(!is.na(U_wind_median)), U.mean=mean(U_wind_median, na.rm=TRUE), sd=sd(U_wind_median, na.rm=TRUE), se=sd/sqrt(N))
V_mean <- ddply(data_wkdf, .(Year.of.Increment.Formation), summarise, N=length(!is.na(V_wind_median)), V.mean=mean(V_wind_median, na.rm=TRUE), sd=sd(V_wind_median, na.rm=TRUE), se=sd/sqrt(N))
MSLA_mean <- ddply(data_wkdf, .(Year.of.Increment.Formation), summarise, N=length(!is.na(MSLA_median)), MSLA.mean=mean(MSLA_median, na.rm=TRUE), sd=sd(MSLA_median, na.rm=TRUE), se=sd/sqrt(N))
WSC_mean <- ddply(data_wkdf, .(Year.of.Increment.Formation), summarise, N=length(!is.na(WSC_median)), WSC.mean=mean(WSC_median, na.rm=TRUE), sd=sd(WSC_median, na.rm=TRUE), se=sd/sqrt(N))
Av.Dis_mean <- ddply(data_wkdf, .(Year.of.Increment.Formation), summarise, N=length(!is.na(Av.Dis)), Av.Dis.mean=mean(Av.Dis, na.rm=TRUE), sd=sd(Av.Dis, na.rm=TRUE), se=sd/sqrt(N))


## correlate to master chronology
IW = read.csv('Increments(-1st and last).csv', header=T, row.names=1)


col <- colnames(IW)
row <- rownames(IW)

library(dplR)
rwi <- detrend(IW, method="ModNegExp")
rwi.crn <- chron(rwi)# creates mean chronology based on Tukeys biweight robust mean (an average unaffected by outliers)

rwi.crn <- rwi.crn[1:10,]

time <- c(2004:2013)
new_rwi.crn <- cbind(time, rwi.crn)

plot(new_rwi.crn$xxxstd[3:9], Av.Dis_mean$Av.Dis.mean)
plot(new_rwi.crn$xxxstd[3:9], WSC_mean$WSC.mean)
plot(new_rwi.crn$xxxstd[3:9], MSLA_mean$MSLA.mean)
plot(new_rwi.crn$xxxstd[3:9], V_mean$V.mean)
plot(new_rwi.crn$xxxstd[3:9], U_mean$U.mean)

newdata <- cbind(new_rwi.crn$xxxstd[3:9], Av.Dis_mean$Av.Dis.mean, WSC_mean$WSC.mean, MSLA_mean$MSLA.mean, V_mean$V.mean, U_mean$U.mean)
pairs(newdata)
cor(newdata)

