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

idx <- data_wk$nConvertedLong <= -84.9925

data_wk_adj <- data_wk[idx,]
data_wk_adj$nJune.U = as.numeric(as.character(data_wk_adj$June.U));
data_wk_adj$nJuly.U = as.numeric(as.character(data_wk_adj$July.U));
data_wk_adj$nAugust.U = as.numeric(as.character(data_wk_adj$August.U));
data_wk_adj$nSeptember.U = as.numeric(as.character(data_wk_adj$September.U));
data_wk_adj$nOctober.U = as.numeric(as.character(data_wk_adj$October.U));
data_wk_adj$nNovember.U = as.numeric(as.character(data_wk_adj$November.U));
data_wk_adj$nDecember.U = as.numeric(as.character(data_wk_adj$December.U));

data_wk_adj$nJune.V = as.numeric(as.character(data_wk_adj$June.V));
data_wk_adj$nJuly.V = as.numeric(as.character(data_wk_adj$July.V));
data_wk_adj$nAugust.V = as.numeric(as.character(data_wk_adj$August.V));
data_wk_adj$nSeptember.V = as.numeric(as.character(data_wk_adj$September.V));
data_wk_adj$nOctober.V = as.numeric(as.character(data_wk_adj$October.V));
data_wk_adj$nNovember.V = as.numeric(as.character(data_wk_adj$November.V));
data_wk_adj$nDecember.V = as.numeric(as.character(data_wk_adj$December.V));

data_wk_adj$nAvg.Discharge= as.numeric(as.character(data_wk_adj$Avg.Discharge))

data_wk_adj$nJune.MSLA = as.numeric(as.character(data_wk_adj$June.MSLA))
data_wk_adj$nJuly.MSLA = as.numeric(as.character(data_wk_adj$July.MSLA))
data_wk_adj$nAugust.MSLA = as.numeric(as.character(data_wk_adj$August.MSLA))
data_wk_adj$nSeptember.MSLA = as.numeric(as.character(data_wk_adj$September.MSLA))
data_wk_adj$nOctober.MSLA = as.numeric(as.character(data_wk_adj$October.MSLA))
data_wk_adj$nNovember.MSLA = as.numeric(as.character(data_wk_adj$November.MSLA))
data_wk_adj$nDecember.MSLA = as.numeric(as.character(data_wk_adj$December.MSLA))

data_wk_adj$nJune.WSC = as.numeric(as.character(data_wk_adj$June.WSC))
data_wk_adj$nJuly.WSC = as.numeric(as.character(data_wk_adj$July.WSC))
data_wk_adj$nAugust.WSC = as.numeric(as.character(data_wk_adj$August.WSC))
data_wk_adj$nSeptember.WSC = as.numeric(as.character(data_wk_adj$September.WSC))
data_wk_adj$nOctober.WSC = as.numeric(as.character(data_wk_adj$October.WSC))
data_wk_adj$nNovember.WSC = as.numeric(as.character(data_wk_adj$November.WSC))
data_wk_adj$nDecember.WSC = as.numeric(as.character(data_wk_adj$December.WSC))

# Instead of using a smoothing term we can transform the data based on the Boxcox transformation found on March 17th and then zero center the x and see what the residuals look like 
### FIND ultimate boxcox transform for data ###
library(MASS)
b <- boxcox(lm(Increment.Width ~ Increment.Number, data=data_wk_adj), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]


## make all variables their own
Av.Dis <- data_wk_adj$nAvg.Discharge 

CatchYr <- data_wk_adj$Catch.Year

Fish.ID <- data_wk_adj$Fish.ID

Age.at.Catch <- data_wk_adj$Age.at.Catch

IncNum <- data_wk_adj$Increment.Number

IncW <- data_wk_adj$Increment.Width

U_winds= cbind(data_wk_adj$nJune.U, data_wk_adj$nJuly.U, data_wk_adj$nAugust.U, data_wk_adj$nSeptember.U, data_wk_adj$nOctober.U, data_wk_adj$nNovember.U, data_wk_adj$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk_adj$nJune.V, data_wk_adj$nJuly.V, data_wk_adj$nAugust.V, data_wk_adj$nSeptember.V, data_wk_adj$nOctober.V, data_wk_adj$nNovember.V, data_wk_adj$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk_adj$nJune.MSLA, data_wk_adj$nJuly.MSLA,data_wk_adj$nAugust.MSLA,data_wk_adj$nSeptember.MSLA,data_wk_adj$nOctober.MSLA,data_wk_adj$nNovember.MSLA,data_wk_adj$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk_adj$nJune.WSC, data_wk_adj$nJuly.WSC,data_wk_adj$nAugust.WSC,data_wk_adj$nSeptember.WSC,data_wk_adj$nOctober.WSC,data_wk_adj$nNovember.WSC,data_wk_adj$nDecember.WSC)

WSC_median=apply(WSC,1,median)

data_wk1=cbind(IncW, IncW^(.181),log(IncW+1), IncNum, data_wk_adj$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(data_wk1) = c("IncW", "IncW_trans","IncW_logtrans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "WSC","CatchYr", "Fish")

data_wkdf_adj = data.frame(data_wk1)

#test3 <- cbind(data_wkdf_adj, data$Fish.ID)-- if I want to retain actual FISH.ID names

data_wkdf_adj$fYr.Inc.Form= factor(data_wkdf_adj$Yr.Inc.Form)


# lets also zero center the environmental variables

data_wkdf_adj$Av.Dis_zc <- data_wkdf_adj$Av.Dis - mean(data_wkdf_adj$Av.Dis, na.rm=TRUE)


data_wkdf_adj$Uwind_zc <- data_wkdf_adj$Uwind - mean(data_wkdf_adj$Uwind, na.rm=TRUE)

data_wkdf_adj$Vwind_zc <- data_wkdf_adj$Vwind - mean(data_wkdf_adj$Vwind, na.rm=TRUE)

data_wkdf_adj$MSLA_zc <- data_wkdf_adj$MSLA -mean(data_wkdf_adj$MSLA, na.rm=TRUE)

data_wkdf_adj$WSC_zc <- data_wkdf_adj$WSC - mean(data_wkdf_adj$WSC, na.rm=TRUE)

library(nlme)
## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(IncW_trans~ IncNum+ fYr.Inc.Form, method="REML", data=data_wkdf_adj, na.action=na.omit)
Mtest.lme <- lme(IncW_trans ~ IncNum + fYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wkdf_adj, na.action=na.omit)
Mtest2.lme <- lme(IncW_trans ~IncNum + fYr.Inc.Form, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf_adj, na.action=na.omit)
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
plot(data_wkdf_adj$IncNum, y = E, xlab= "IncNum", ylab=MyYlab)
plot(E ~ data_wkdf_adj$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf_adj$IncW_trans, E, xlab="IncWtrans", ylab="Residuals")
par(op)


## I think this is the best its going to get at this point.


## at this point I think this is the best that I can get it. we will use lme with IncW_trans from the new data set with only increment numbers 3, 4, 5, 6 and 7 with a random term Fish.ID included. Now we can start adding the environmental covariates and see if any are important or make better for an AIC criterion

data_wkdf_adj <- data_wkdf_adj[complete.cases(data_wkdf_adj$Vwind_zc, data_wkdf_adj$Av.Dis_zc),]   ## removing NA present in v wind
data_wkdf_adj_sm <-  data_wkdf_adj[complete.cases(data_wkdf_adj$WSC_zc),]  ### removing NA present in wsc


### for this, make sure that you use the appropriate data_wkdf_adj, because it will matter when it comes to evaluating the p values. 

Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + MSLA_zc + WSC_zc + Av.Dis_zc)

## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135

library(nlme)



Mfull2.lme <- lme(Form, random=~1|Fish, method="ML", data=data_wkdf_adj, na.action=na.omit)
M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.lme, .~. - Uwind_zc)
M1.C <- update(Mfull2.lme, .~. - Vwind_zc)
M1.D <- update(Mfull2.lme, .~. - MSLA_zc)
M1.E <- update(Mfull2.lme, .~. - WSC_zc)
anova(Mfull2.lme, M1.A)
# 
# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -2549.193 -2506.559 1284.597                        
# M1.A           2  9 -2550.428 -2512.057 1284.214 1 vs 2 0.765579  0.3816


anova(Mfull2.lme, M1.B)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -2549.193 -2506.559 1284.597                        
# M1.B           2  9 -2548.400 -2510.029 1283.200 1 vs 2 2.793671  0.0946

anova(Mfull2.lme, M1.C)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -2549.193 -2506.559 1284.597                        
# M1.C           2  9 -2532.896 -2494.525 1275.448 1 vs 2 18.29755  <.0001

anova(Mfull2.lme, M1.D)
# 
# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -2549.193 -2506.559 1284.597                         
# M1.D           2  9 -2550.990 -2512.619 1284.495 1 vs 2 0.2038171  0.6517


anova(Mfull2.lme, M1.E)  ## incorrect number of observations
# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1  9 -3100.731 -3060.577 1559.365                        
# M1.E           2  8 -3100.481 -3064.789 1558.240 1 vs 2 2.249619  0.1336


summary(Mfull2.lme)


## So, it seems that WSC_zc and MSLA and Vwind are not significant so we will omit them from the model. Now, we will refit the model with U and V winds.

Form2= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc)
Mfull3.lme <- lme(Form2, random=~1|Fish, method="ML", data=data_wkdf_adj, na.action=na.omit)


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

Mfinal <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc, random=~1|Fish, method="REML", data=data_wkdf_adj, na.action=na.omit)

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







