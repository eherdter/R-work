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

idx <- data_wk$nConvertedLong <= -87  ## for samples from the northern GOM, longitude for De soto canyon
idxB<- data_wk$nConvertedLong >= -87 ## for samples on WEST FLORIDA SHELF 

data_wk_NGM <- data_wk[idx,]
data_wk_NGM <- data_wk_NGM[complete.cases(data_wk_NGM$nConvertedLong),]


data_wk_WFS <- data_wk[idxB,]
data_wk_WFS <- data_wk_WFS[complete.cases(data_wk_WFS$nConvertedLong),]

data_wk_NGM$nJune.U = as.numeric(as.character(data_wk_NGM$June.U));
data_wk_NGM$nJuly.U = as.numeric(as.character(data_wk_NGM$July.U));
data_wk_NGM$nAugust.U = as.numeric(as.character(data_wk_NGM$August.U));
data_wk_NGM$nSeptember.U = as.numeric(as.character(data_wk_NGM$September.U));
data_wk_NGM$nOctober.U = as.numeric(as.character(data_wk_NGM$October.U));
data_wk_NGM$nNovember.U = as.numeric(as.character(data_wk_NGM$November.U));
data_wk_NGM$nDecember.U = as.numeric(as.character(data_wk_NGM$December.U));

data_wk_NGM$nJune.V = as.numeric(as.character(data_wk_NGM$June.V));
data_wk_NGM$nJuly.V = as.numeric(as.character(data_wk_NGM$July.V));
data_wk_NGM$nAugust.V = as.numeric(as.character(data_wk_NGM$August.V));
data_wk_NGM$nSeptember.V = as.numeric(as.character(data_wk_NGM$September.V));
data_wk_NGM$nOctober.V = as.numeric(as.character(data_wk_NGM$October.V));
data_wk_NGM$nNovember.V = as.numeric(as.character(data_wk_NGM$November.V));
data_wk_NGM$nDecember.V = as.numeric(as.character(data_wk_NGM$December.V));

data_wk_NGM$nAvg.Discharge= as.numeric(as.character(data_wk_NGM$Avg.Discharge))

data_wk_NGM$nJune.MSLA = as.numeric(as.character(data_wk_NGM$June.MSLA))
data_wk_NGM$nJuly.MSLA = as.numeric(as.character(data_wk_NGM$July.MSLA))
data_wk_NGM$nAugust.MSLA = as.numeric(as.character(data_wk_NGM$August.MSLA))
data_wk_NGM$nSeptember.MSLA = as.numeric(as.character(data_wk_NGM$September.MSLA))
data_wk_NGM$nOctober.MSLA = as.numeric(as.character(data_wk_NGM$October.MSLA))
data_wk_NGM$nNovember.MSLA = as.numeric(as.character(data_wk_NGM$November.MSLA))
data_wk_NGM$nDecember.MSLA = as.numeric(as.character(data_wk_NGM$December.MSLA))

data_wk_NGM$nJune.WSC = as.numeric(as.character(data_wk_NGM$June.WSC))
data_wk_NGM$nJuly.WSC = as.numeric(as.character(data_wk_NGM$July.WSC))
data_wk_NGM$nAugust.WSC = as.numeric(as.character(data_wk_NGM$August.WSC))
data_wk_NGM$nSeptember.WSC = as.numeric(as.character(data_wk_NGM$September.WSC))
data_wk_NGM$nOctober.WSC = as.numeric(as.character(data_wk_NGM$October.WSC))
data_wk_NGM$nNovember.WSC = as.numeric(as.character(data_wk_NGM$November.WSC))
data_wk_NGM$nDecember.WSC = as.numeric(as.character(data_wk_NGM$December.WSC))

# Instead of using a smoothing term we can transform the data based on the Boxcox transformation found on March 17th and then zero center the x and see what the residuals look like 
### FIND ultimate boxcox transform for data ###
library(MASS)
b <- boxcox(lm(Increment.Width ~ Increment.Number, data=data_wk_NGM), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]


## make all variables their own
Av.Dis <- data_wk_NGM$nAvg.Discharge 

CatchYr <- data_wk_NGM$Catch.Year

Fish.ID <- data_wk_NGM$Fish.ID

Age.at.Catch <- data_wk_NGM$Age.at.Catch

IncNum <- data_wk_NGM$Increment.Number

IncW <- data_wk_NGM$Increment.Width

U_winds= cbind(data_wk_NGM$nJune.U, data_wk_NGM$nJuly.U, data_wk_NGM$nAugust.U, data_wk_NGM$nSeptember.U, data_wk_NGM$nOctober.U, data_wk_NGM$nNovember.U, data_wk_NGM$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk_NGM$nJune.V, data_wk_NGM$nJuly.V, data_wk_NGM$nAugust.V, data_wk_NGM$nSeptember.V, data_wk_NGM$nOctober.V, data_wk_NGM$nNovember.V, data_wk_NGM$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk_NGM$nJune.MSLA, data_wk_NGM$nJuly.MSLA,data_wk_NGM$nAugust.MSLA,data_wk_NGM$nSeptember.MSLA,data_wk_NGM$nOctober.MSLA,data_wk_NGM$nNovember.MSLA,data_wk_NGM$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk_NGM$nJune.WSC, data_wk_NGM$nJuly.WSC,data_wk_NGM$nAugust.WSC,data_wk_NGM$nSeptember.WSC,data_wk_NGM$nOctober.WSC,data_wk_NGM$nNovember.WSC,data_wk_NGM$nDecember.WSC)

WSC_median=apply(WSC,1,median)

data_wk1=cbind(IncW, IncW^(.181),log(IncW+1), IncNum, data_wk_NGM$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(data_wk1) = c("IncW", "IncW_trans","IncW_logtrans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "WSC","CatchYr", "Fish")

data_wkdf_NGM = data.frame(data_wk1)

#test3 <- cbind(data_wkdf_NGM, data$Fish.ID)-- if I want to retain actual FISH.ID names

data_wkdf_NGM$fYr.Inc.Form= factor(data_wkdf_NGM$Yr.Inc.Form)


# lets also zero center the environmental variables

data_wkdf_NGM$Av.Dis_zc <- data_wkdf_NGM$Av.Dis - mean(data_wkdf_NGM$Av.Dis, na.rm=TRUE)


data_wkdf_NGM$Uwind_zc <- data_wkdf_NGM$Uwind - mean(data_wkdf_NGM$Uwind, na.rm=TRUE)

data_wkdf_NGM$Vwind_zc <- data_wkdf_NGM$Vwind - mean(data_wkdf_NGM$Vwind, na.rm=TRUE)

data_wkdf_NGM$MSLA_zc <- data_wkdf_NGM$MSLA -mean(data_wkdf_NGM$MSLA, na.rm=TRUE)

data_wkdf_NGM$WSC_zc <- data_wkdf_NGM$WSC - mean(data_wkdf_NGM$WSC, na.rm=TRUE)

library(nlme)
## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(IncW_trans~ IncNum+ fYr.Inc.Form, method="REML", data=data_wkdf_NGM, na.action=na.omit)
Mtest.lme <- lme(IncW_trans ~ IncNum + fYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wkdf_NGM, na.action=na.omit)
Mtest2.lme <- lme(IncW_trans ~IncNum + fYr.Inc.Form, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf_NGM, na.action=na.omit)
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
plot(data_wkdf_NGM$IncNum, y = E, xlab= "IncNum", ylab=MyYlab)
plot(E ~ data_wkdf_NGM$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf_NGM$IncW_trans, E, xlab="IncWtrans", ylab="Residuals")
par(op)


## I think this is the best its going to get at this point.


## at this point I think this is the best that I can get it. we will use lme with IncW_trans from the new data set with only increment numbers 3, 4, 5, 6 and 7 with a random term Fish.ID included. Now we can start adding the environmental covariates and see if any are important or make better for an AIC criterion

data_wkdf_NGM <- data_wkdf_NGM[complete.cases(data_wkdf_NGM$Vwind_zc, data_wkdf_NGM$Av.Dis_zc),]   ## removing NA present in v wind
data_wkdf_NGM_sm <-  data_wkdf_NGM[complete.cases(data_wkdf_NGM$WSC_zc),]  ### removing NA present in wsc


### for this, make sure that you use the appropriate data_wkdf_NGM, because it will matter when it comes to evaluating the p values. 

Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + MSLA_zc + WSC_zc + Av.Dis_zc)

## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135

library(nlme)



Mfull2.lme <- lme(Form, random=~1|Fish, method="ML", data=data_wkdf_NGM_sm, na.action=na.omit)
M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.lme, .~. - Uwind_zc)
M1.C <- update(Mfull2.lme, .~. - Vwind_zc)
M1.D <- update(Mfull2.lme, .~. - MSLA_zc)
M1.E <- update(Mfull2.lme, .~. - WSC_zc)
anova(Mfull2.lme, M1.A)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -2553.342 -2510.708 1286.671                        
# M1.A           2  9 -2540.120 -2501.750 1279.060 1 vs 2 15.22149   1e-04


anova(Mfull2.lme, M1.B)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -2553.342 -2510.708 1286.671                        
# M1.B           2  9 -2529.344 -2490.973 1273.672 1 vs 2 25.99799  <.0001

anova(Mfull2.lme, M1.C)

# Model df       AIC       BIC   logLik   Test    L.Ratio p-value
# Mfull2.lme     1 10 -2553.342 -2510.708 1286.671                          
# M1.C           2  9 -2555.318 -2516.948 1286.659 1 vs 2 0.02329675  0.8787

anova(Mfull2.lme, M1.D)
# 
# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -2553.342 -2510.708 1286.671                        
# M1.D           2  9 -2552.780 -2514.409 1285.390 1 vs 2 2.561769  0.1095


anova(Mfull2.lme, M1.E)  ## incorrect number of observations
# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -2553.342 -2510.708 1286.671                         
# M1.E           2  9 -2554.542 -2516.171 1286.271 1 vs 2 0.7998054  0.3712


summary(Mfull2.lme)


## So, it seems that WSC_zc and MSLA and Vwind are not significant so we will omit them from the model. Now, we will refit the model with U and V winds.

Form2= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc)
Mfull3.lme <- lme(Form2, random=~1|Fish, method="ML", data=data_wkdf_NGM, na.action=na.omit)


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

Mfinal <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc, random=~1|Fish, method="REML", data=data_wkdf_NGM, na.action=na.omit)

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







