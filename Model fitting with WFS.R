## to parse data from West Florida Shelf#########################

data= read.csv("BC_10_20_14.csv", header=TRUE)

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

data_wk$nConvertedLong = as.numeric(as.character(data_wk$Converted.Long))

  ## for samples from the northern GOM, longitude for Apachicola
idxB<- data_wk$nConvertedLong >= -87 ## for samples on WEST FLORIDA SHELF 


data_wk_WFS <- data_wk[idxB,]
data_wk_WFS <- data_wk_WFS[complete.cases(data_wk_WFS$nConvertedLong),]



data_wk_WFS$nJune.U = as.numeric(as.character(data_wk_WFS$June.U));
data_wk_WFS$nJuly.U = as.numeric(as.character(data_wk_WFS$July.U));
data_wk_WFS$nAugust.U = as.numeric(as.character(data_wk_WFS$August.U));
data_wk_WFS$nSeptember.U = as.numeric(as.character(data_wk_WFS$September.U));
data_wk_WFS$nOctober.U = as.numeric(as.character(data_wk_WFS$October.U));
data_wk_WFS$nNovember.U = as.numeric(as.character(data_wk_WFS$November.U));
data_wk_WFS$nDecember.U = as.numeric(as.character(data_wk_WFS$December.U));

data_wk_WFS$nJune.V = as.numeric(as.character(data_wk_WFS$June.V));
data_wk_WFS$nJuly.V = as.numeric(as.character(data_wk_WFS$July.V));
data_wk_WFS$nAugust.V = as.numeric(as.character(data_wk_WFS$August.V));
data_wk_WFS$nSeptember.V = as.numeric(as.character(data_wk_WFS$September.V));
data_wk_WFS$nOctober.V = as.numeric(as.character(data_wk_WFS$October.V));
data_wk_WFS$nNovember.V = as.numeric(as.character(data_wk_WFS$November.V));
data_wk_WFS$nDecember.V = as.numeric(as.character(data_wk_WFS$December.V));

data_wk_WFS$nAvg.Discharge= as.numeric(as.character(data_wk_WFS$Avg.Discharge))

data_wk_WFS$nJune.MSLA = as.numeric(as.character(data_wk_WFS$June.MSLA))
data_wk_WFS$nJuly.MSLA = as.numeric(as.character(data_wk_WFS$July.MSLA))
data_wk_WFS$nAugust.MSLA = as.numeric(as.character(data_wk_WFS$August.MSLA))
data_wk_WFS$nSeptember.MSLA = as.numeric(as.character(data_wk_WFS$September.MSLA))
data_wk_WFS$nOctober.MSLA = as.numeric(as.character(data_wk_WFS$October.MSLA))
data_wk_WFS$nNovember.MSLA = as.numeric(as.character(data_wk_WFS$November.MSLA))
data_wk_WFS$nDecember.MSLA = as.numeric(as.character(data_wk_WFS$December.MSLA))

data_wk_WFS$nJune.WSC = as.numeric(as.character(data_wk_WFS$June.WSC))
data_wk_WFS$nJuly.WSC = as.numeric(as.character(data_wk_WFS$July.WSC))
data_wk_WFS$nAugust.WSC = as.numeric(as.character(data_wk_WFS$August.WSC))
data_wk_WFS$nSeptember.WSC = as.numeric(as.character(data_wk_WFS$September.WSC))
data_wk_WFS$nOctober.WSC = as.numeric(as.character(data_wk_WFS$October.WSC))
data_wk_WFS$nNovember.WSC = as.numeric(as.character(data_wk_WFS$November.WSC))
data_wk_WFS$nDecember.WSC = as.numeric(as.character(data_wk_WFS$December.WSC))

# Instead of using a smoothing term we can transform the data based on the Boxcox transformation found on March 17th and then zero center the x and see what the residuals look like 
### FIND ultimate boxcox transform for data ###
library(MASS)
b <- boxcox(lm(Increment.Width ~ Increment.Number, data=data_wk_WFS), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]


## make all variables their own
Av.Dis <- data_wk_WFS$nAvg.Discharge 

CatchYr <- data_wk_WFS$Catch.Year

Fish.ID <- data_wk_WFS$Fish.ID

Age.at.Catch <- data_wk_WFS$Age.at.Catch

IncNum <- data_wk_WFS$Increment.Number

IncW <- data_wk_WFS$Increment.Width

U_winds= cbind(data_wk_WFS$nJune.U, data_wk_WFS$nJuly.U, data_wk_WFS$nAugust.U, data_wk_WFS$nSeptember.U, data_wk_WFS$nOctober.U, data_wk_WFS$nNovember.U, data_wk_WFS$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk_WFS$nJune.V, data_wk_WFS$nJuly.V, data_wk_WFS$nAugust.V, data_wk_WFS$nSeptember.V, data_wk_WFS$nOctober.V, data_wk_WFS$nNovember.V, data_wk_WFS$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk_WFS$nJune.MSLA, data_wk_WFS$nJuly.MSLA,data_wk_WFS$nAugust.MSLA,data_wk_WFS$nSeptember.MSLA,data_wk_WFS$nOctober.MSLA,data_wk_WFS$nNovember.MSLA,data_wk_WFS$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk_WFS$nJune.WSC, data_wk_WFS$nJuly.WSC,data_wk_WFS$nAugust.WSC,data_wk_WFS$nSeptember.WSC,data_wk_WFS$nOctober.WSC,data_wk_WFS$nNovember.WSC,data_wk_WFS$nDecember.WSC)

WSC_median=apply(WSC,1,median)

data_wk1=cbind(IncW, IncW^(.747),log(IncW+1), IncNum, data_wk_WFS$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(data_wk1) = c("IncW", "IncW_trans","IncW_logtrans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "WSC","CatchYr", "Fish")

data_wkdf_WFS = data.frame(data_wk1)

#test3 <- cbind(data_wkdf_WFS, data$Fish.ID)-- if I want to retain actual FISH.ID names

data_wkdf_WFS$fYr.Inc.Form= factor(data_wkdf_WFS$Yr.Inc.Form)


# lets also zero center the environmental variables

data_wkdf_WFS$Av.Dis_zc <- data_wkdf_WFS$Av.Dis - mean(data_wkdf_WFS$Av.Dis, na.rm=TRUE)


data_wkdf_WFS$Uwind_zc <- data_wkdf_WFS$Uwind - mean(data_wkdf_WFS$Uwind, na.rm=TRUE)

data_wkdf_WFS$Vwind_zc <- data_wkdf_WFS$Vwind - mean(data_wkdf_WFS$Vwind, na.rm=TRUE)

data_wkdf_WFS$MSLA_zc <- data_wkdf_WFS$MSLA -mean(data_wkdf_WFS$MSLA, na.rm=TRUE)

data_wkdf_WFS$WSC_zc <- data_wkdf_WFS$WSC - mean(data_wkdf_WFS$WSC, na.rm=TRUE)

library(nlme)
## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(IncW_trans~ IncNum+ fYr.Inc.Form, method="REML", data=data_wkdf_WFS, na.action=na.omit)
Mtest.lme <- lme(IncW_trans ~ IncNum + fYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wkdf_WFS, na.action=na.omit)
Mtest2.lme <- lme(IncW_trans ~IncNum + fYr.Inc.Form, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf_WFS, na.action=na.omit)
AIC(Mtest.gls, Mtest.lme, Mtest2.lme)
# 
# df       AIC
# Mtest.gls   9 -2520.891
# Mtest.lme  10 -2619.772
# Mtest2.lme 11 -2617.772
# 
# # > '

anova(Mtest.gls, Mtest.lme)
# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mtest.gls     1  9 -2520.891 -2482.085 1269.445                        
# Mtest.lme     2 10 -2619.772 -2576.655 1319.886 1 vs 2 100.8817  <.0001

# > 

## so it looks like just Fish ID should be used as random 
# lets look at a plot

F2 <- fitted(Mtest.lme) ### page 134
E <-resid(Mtest.lme)
op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
MyYlab <- "residuals"
plot(x=F2, y=E, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf_WFS$IncNum, y = E, xlab= "IncNum", ylab=MyYlab)
plot(E ~ data_wkdf_WFS$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf_WFS$IncW_trans, E, xlab="IncWtrans", ylab="Residuals")
par(op)


## I think this is the best its going to get at this point.


## at this point I think this is the best that I can get it. we will use lme with IncW_trans from the new data set with only increment numbers 3, 4, 5, 6 and 7 with a random term Fish.ID included. Now we can start adding the environmental covariates and see if any are important or make better for an AIC criterion

data_wkdf_WFS <- data_wkdf_WFS[complete.cases(data_wkdf_WFS$Vwind_zc, data_wkdf_WFS$Av.Dis_zc),]   ## removing NA present in v wind
data_wkdf_WFS_sm <-  data_wkdf_WFS[complete.cases(data_wkdf_WFS$WSC_zc),]  ### removing NA present in wsc


### for this, make sure that you use the appropriate data_wkdf_WFS, because it will matter when it comes to evaluating the p values. 

Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + MSLA_zc + WSC_zc + Av.Dis_zc)

## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135

library(nlme)



Mfull2.lme <- lme(Form, random=~1|Fish, method="ML", data=data_wkdf_WFS, na.action=na.omit)
M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.lme, .~. - Uwind_zc)
M1.C <- update(Mfull2.lme, .~. - Vwind_zc)
M1.D <- update(Mfull2.lme, .~. - MSLA_zc)
M1.E <- update(Mfull2.lme, .~. - WSC_zc)
anova(Mfull2.lme, M1.A)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -202.3957 -181.9652 111.1979                        
# M1.A           2  9 -201.1170 -182.7295 109.5585 1 vs 2 3.278765  0.0702

anova(Mfull2.lme, M1.B)

# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -202.3957 -181.9652 111.1979                         
# M1.B           2  9 -203.9567 -185.5692 110.9783 1 vs 2 0.4390766  0.5076

anova(Mfull2.lme, M1.C)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -202.3957 -181.9652 111.1979                        
# M1.C           2  9 -203.2903 -184.9028 110.6451 1 vs 2 1.105486  0.2931

anova(Mfull2.lme, M1.D)
# 
# Model df       AIC       BIC   logLik   Test    L.Ratio p-value
# Mfull2.lme     1 10 -202.3957 -181.9652 111.1979                          
# M1.D           2  9 -204.3691 -185.9817 111.1846 1 vs 2 0.02662477  0.8704


anova(Mfull2.lme, M1.E)  ## incorrect number of observations
# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -202.3957 -181.9652 111.1979                         
# M1.E           2  9 -204.2196 -185.8321 111.1098 1 vs 2 0.1761604  0.6747


summary(Mfull2.lme)



Form2= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc)
Mfull3.lme <- lme(Form2, random=~1|Fish, method="ML", data=data_wkdf_WFS, na.action=na.omit)


M2.A <- update(Mfull3.lme, .~. -Av.Dis_zc)
M2.B <- update(Mfull3.lme, .~. -Uwind_zc)

anova(Mfull3.lme, M2.A)  
anova(Mfull3.lme, M2.B)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.lme     1  6 -2547.175 -2521.595 1279.588                        
# M2.B           2  5 -2513.614 -2492.297 1261.807 1 vs 2 35.56108  <.0001

# > anova(Mfull3.lme, M2.B)
# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.lme     1  7 -3279.073 -3247.439 1646.536                        
# M2.B           2  6 -3234.144 -3207.029 1623.072 1 vs 2 46.92869  <.0001



## Now, we need to refit with REML and then Validate the Model page=138

Mfinal <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc, random=~1|Fish, method="REML", data=data_wkdf_WFS, na.action=na.omit)

summary(Mfinal)



op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
ModelResiduals <- resid(Mfinal)
hist(ModelResiduals)
qqnorm(ModelResiduals)
F3 <- fitted(Mfinal)
MyYlab <- "residuals"
plot(x=F3, y=ModelResiduals, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf$IncNum, y = ModelResiduals, xlab= "IncNum", ylab=MyYlab)
plot(ModelResiduals ~ data_wkdf$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf$IncW_trans, ModelResiduals, xlab="IncWtrans", ylab="Residuals")
plot(data_wkdf$Vwind_zc, ModelResiduals, xlab= "Vwinds", ylab="Residuals")
par(op)








