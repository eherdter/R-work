## May 27, 2014 -
# Loading data, doing exploration, fitting models and then validating models

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




## make all variables their own
Av.Dis <- data_wk$nAvg.Discharge 

CatchYr <- data_wk$Catch.Year

Fish.ID <- data_wk$Fish.ID

Age.at.Catch <- data_wk$Age.at.Catch

IncNum <- data_wk$Increment.Number

IncW <- data_wk$Increment.Width

U_winds= cbind(data_wk$nJune.U, data_wk$nJuly.U, data_wk$nAugust.U, data_wk$nSeptember.U, data_wk$nOctober.U, data_wk$nNovember.U, data_wk$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk$nJune.V, data_wk$nJuly.V, data_wk$nAugust.V, data_wk$nSeptember.V, data_wk$nOctober.V, data_wk$nNovember.V, data_wk$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk$nJune.MSLA, data_wk$nJuly.MSLA,data_wk$nAugust.MSLA,data_wk$nSeptember.MSLA,data_wk$nOctober.MSLA,data_wk$nNovember.MSLA,data_wk$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk$nJune.WSC, data_wk$nJuly.WSC,data_wk$nAugust.WSC,data_wk$nSeptember.WSC,data_wk$nOctober.WSC,data_wk$nNovember.WSC,data_wk$nDecember.WSC)

WSC_median=apply(WSC,1,median)

# Instead of using a smoothing term we can transform the data based on the Boxcox transformation found on March 17th and then zero center the x and see what the residuals look like 
### FIND ultimate boxcox transform for data ###
library(MASS)
b <- boxcox(lm(IncW ~ IncNum, data=data_wk), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]

data_wk1=cbind(IncW, IncW^(.181),log(IncW+1), IncNum, data_wk$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(data_wk1) = c("IncW", "IncW_trans","IncW_logtrans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "WSC","CatchYr", "Fish")

data_wkdf = data.frame(data_wk1)

#test3 <- cbind(data_wkdf, data$Fish.ID)-- if I want to retain actual FISH.ID names

data_wkdf$fYr.Inc.Form= factor(data_wkdf$Yr.Inc.Form)


#IncW = Increment Width = continuous response
#IncNum = Increment Number = continuous explanatory 
#YrIncFor= Year of Increment formation= categorical explanatory
#Umed = U median winds = continuous explanatory
#Vmed = V median winds = continuous explanatory
#AvDis = Average Miss Riv Discharge=  continous explanatory
#MSLA= median mean sea level anomalies= continous explanatory
#FishID=  Fish ID = random variable
#CatchYr = Catch Year= random variable 


Step 1- look for outliers, page 533 in Zuur
produce Cleveland dotplots

op <- par(mfrow= c(5,2), mar = c(3,3,3,1))
hist(data_wkdf$IncW_trans, main="IncW", group=data_wkdf$Yr.Inc.Form)
plot(0,0, type="n", axes=FALSE)
dotchart(data_wkdf$IncNum, main="IncNum", group= data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Yr.Inc.Form, main= "Year of Increment Formation", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Uwind, main= "U med", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Vwind, main= "V med", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Av.Dis, main="AvDis", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$MSLA, main="MSLA", group= data_wkdf$Yr.Inc.Form)
par(op)

# Check for collinearity among 3 environmental variables

# # Z <- cbind(U_wind_median, V_wind_median, Av.Dis,MSLA_median IncW)
# pairs(Z, lower.panel=panel.smooth2, upper.panel= panel.cor, diag.panel=panel.hist)  ## must load functions from the HighstatLibV6.R document for this to run correctly because AED package is no longer available


# # another way to assess colinearity is VIF (variance inflation factors- all VIF  below 3 indicate no collinearity in variables)
# corvif(Z[,c(-1,-4)])  ## most load both corvif functions from the HighstatLibV6.R document for this to run corrently because AED package is no longer available


# # ####### STEP 1 ###### Try a Linear Regression first- based on pages 130- in Zuur
# # M.lm <- lm(IncW ~ IncNum + fYr.Inc.Form*U_wind_median + fYr.Inc.Form*V_wind_median + fYr.Inc.Form*Av.Dis, data= data_wkdf) # one of the prime aims is to find the year of increment formation effect, we also include the interaction between sex and each of the other variables- page 130 Zuur


## lets look at the residuals to see what is going on- based on Model Validation on page 23 Zuur

# op <- par(mfrow= c(4,2), mar=c(5,4,1,2))
# plot(M.lm, add.smooth=FALSE, which=1)
# E <-resid(M.lm)
# hist(E, xlab="Residuals", main="")
# plot(data_wkdf$IncNum, E, xlab= "IncNum", ylab="Residuals")
# plot(data_wkdf$fYr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
# plot(data_wkdf$Uwind, xlab="Uwind", ylab= "residuals")
# plot(data_wkdf$Vwind, xlab="Vwind", ylab="residuals")
# plot(data_wkdf$Av.Dis, xlab="Av.Dis", ylab="Residuals")
# par(op)

### another way to look at the plots
# op <- par(mfrow=c(2,2))
# plot(M.lm, add.smooth=FALSE)
# par(op)

##plots A and C appear to be violating homogeneity, no surprise however since increment width and increment number can't be modeled straight forward with a lm


# # fit using a gls, lme, gam and gamm
# library(nlme)
# M.gls <- gls(IncW~ IncNum +Yr.Inc.Form +Uwind +Vwind +Av.Dis +MSLA_median, data=data_wkdf, na.action=na.omit)
# M1.lme <- lme(IncW ~ IncNum + Yr.Inc.Form+ Uwind + Vwind + Av.Dis +MSLA_median, random= ~1|CatchYr, method= "REML", data=data_wkdf, na.action=na.omit)
# M2.lme <- lme(IncW ~ IncNum +Yr.Inc.Form + Uwind + Vwind +Av.Dis +MSLA_median, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf, na.action=na.omit)

# # compare AIC of M.gls, M1.lme and M2.lme
# AIC(M.gls, M1.lme, M2.lme)

       # # df       AIC
# # M.gls   8 -925.9301
# # M1.lme  9 -925.6426
# # M2.lme 10 -921.9301

# # but plotting residuals shows problem so we cannot trust these outputs. and we know that its important to include a random variable  so lets try a gam. In this format we cannot include a random variable but we will see what shows up. 

# library(mgcv)
# # first-put smoothers on everything and see if they are significant
# M.gam <- gam(IncW ~ s(IncNum) + fYr.Inc.Form + s(Uwind) + s(Vwind) + Av.Dis, method="REML", data=data_wkdf, na.action=na.omit)
# summary(M.gam)
# # the only two significant smoothers are for Vwind and IncNum, therefor no smoother for Uwind needs to be used

# M1.gam <- gam(IncW~ s(IncNum)+ fYr.Inc.Form, method="REML", data=data_wkdf, na.action=na.omit)
# M2.gam <- gam(IncW ~ s(IncNum) + fYr.Inc.Form + Uwind, method="REML", data=data_wkdf, na.action=na.omit)
# M3.gam <- gam(IncW~ s(IncNum) + fYr.Inc.Form + Uwind + s(Vwind), method="REML", data=data_wkdf, na.action= na.omit)
# M4.gam <- gam(IncW ~s(IncNum)+ fYr.Inc.Form + Uwind + s(Vwind) + Av.Dis, method="REML", data= data_wkdf, na.action=na.omit)
# M5.gam <- gam(IncW ~ s(IncNum) + fYr.Inc.Form + s(Vwind), method="REML", data=data_wkdf, na.action=na.omit)
# M6.gam <- gam(IncW ~ s(IncNum)+ fYr.Inc.Form + Uwind + Av.Dis, method="REML", data=data_wkdf, na.action=na.omit)

# M7.gam <- gam(IncW ~ s(IncNum) + fYr.Inc.Form + s(Vwind)+ Av.Dis, method="REML", data=data_wkdf, na.action=na.omit)



# AIC(M1.gam, M2.gam, M3.gam, M4.gam, M5.gam, M6.gam, M7.gam)

# # > AIC(M1.gam, M2.gam, M3.gam, M4.gam, M5.gam, M6.gam, M7.gam)
             # # df       AIC
# # M1.gam 19.67477 -3503.648
# # M2.gam 19.59552 -3401.941
# # M3.gam 22.51431 -3417.982
# # M4.gam 22.51029 -3417.978
# # M5.gam 21.95910 -3419.773
# # M6.gam 19.59526 -3401.941
# # M7.gam 21.95653 -3419.771

# summary(M1.gam)

# check1 <- gam.check(M1.gam)
# ## so yes, it graphically does seem to follow all assumptions


# #refit the model with the significant terms from the summary
# M1.gam_update <- gam(IncW ~ s(IncNum)+ fYr.Inc.Form , method="REML", data=data_wkdf, na.action=na.omit)


# M5.gamm <- gamm(IncW ~ s(IncNum) + fYr.Inc.Form, random=list(Fish.ID = ~1), method="REML", data=data_wkdf, na.action=na.omit)





# # results in .303 so all IncNum must be raised to the .303
# IncW_trans <- IncW^(.303)

# # zero center X 
# mean <- mean(IncNum)
# IncNum_zc <- IncNum- mean

# # we can check the residuals
# lm <- lm(IncW_trans~IncNum)
# E <- resid(lm)
# plot(E)
 # op <- par(mfrow=c(2,2))
# plot(lm, add.smooth=FALSE)
# par(op)




# lets also zero center the environmental variables

data_wkdf$Av.Dis_zc <- data_wkdf$Av.Dis - mean(data_wkdf$Av.Dis, na.rm=TRUE)


data_wkdf$Uwind_zc <- data_wkdf$Uwind - mean(data_wkdf$Uwind, na.rm=TRUE)

data_wkdf$Vwind_zc <- data_wkdf$Vwind - mean(data_wkdf$Vwind, na.rm=TRUE)

data_wkdf$MSLA_zc <- data_wkdf$MSLA -mean(data_wkdf$MSLA, na.rm=TRUE)

data_wkdf$WSC_zc <- data_wkdf$WSC - mean(data_wkdf$WSC, na.rm=TRUE)

library(nlme)
## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(IncW_trans~ IncNum+ fYr.Inc.Form, method="REML", data=data_wkdf, na.action=na.omit)
Mtest.lme <- lme(IncW_trans ~ IncNum + fYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wkdf, na.action=na.omit)
Mtest2.lme <- lme(IncW_trans ~IncNum + fYr.Inc.Form, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf, na.action=na.omit)
AIC(Mtest.gls, Mtest.lme, Mtest2.lme)

           df       AIC
Mtest.gls   9 -3053.063
Mtest.lme  10 -3191.674
Mtest2.lme 11 -3189.674


# > 
 anova(Mtest.gls, Mtest.lme)
          # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mtest.gls     1  9 -3053.063 -3012.497 1535.531                        
# Mtest.lme     2 10 -3191.674 -3146.601 1605.837 1 vs 2 140.6112  <.0001
# > 

## so it looks like just Fish ID should be used as random 
# lets look at a plot

F2 <- fitted(Mtest.lme) ### page 134
E <-resid(Mtest.lme)
op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
MyYlab <- "residuals"
plot(x=F2, y=E, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf$IncNum, y = E, xlab= "IncNum", ylab=MyYlab)
plot(E ~ data_wkdf$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf$IncW_trans, E, xlab="IncWtrans", ylab="Residuals")
par(op)


## I think this is the best its going to get at this point.


## at this point I think this is the best that I can get it. we will use lme with IncW_trans from the new data set with only increment numbers 3, 4, 5, 6 and 7 with a random term Fish.ID included. Now we can start adding the environmental covariates and see if any are important or make better for an AIC criterion

data_wkdf <- data_wkdf[complete.cases(data_wkdf$Vwind_zc, data_wkdf$Av.Dis_zc),]   ## removing NA present in v wind
data_wkdf_sm <-  data_wkdf[complete.cases(data_wkdf$WSC_zc),]  ### removing NA present in wsc


### for this, make sure that you use the appropriate data_wkdf, because it will matter when it comes to evaluating the p values. 

Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + MSLA_zc + WSC_zc + Av.Dis_zc)

## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135

library(nlme)



Mfull2.lme <- lme(Form, random=~1|Fish, method="ML", data=data_wkdf, na.action=na.omit)
M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.lme, .~. - Uwind_zc)
M1.C <- update(Mfull2.lme, .~. - Vwind_zc)
M1.D <- update(Mfull2.lme, .~. - MSLA_zc)
M1.E <- update(Mfull2.lme, .~. - WSC_zc)
anova(Mfull2.lme, M1.A)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -3108.492 -3063.878 1564.246                        
# M1.A           2  9 -3087.711 -3047.558 1552.856 1 vs 2 22.78074  <.0001


anova(Mfull2.lme, M1.B)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -3108.492 -3063.878 1564.246                        
# M1.B           2  9 -3076.875 -3036.722 1547.438 1 vs 2 33.61731  <.0001


anova(Mfull2.lme, M1.C)

# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -3108.492 -3063.878 1564.246                         
# M1.C           2  9 -3110.314 -3070.160 1564.157 1 vs 2 0.1784971  0.6727

anova(Mfull2.lme, M1.D)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -3108.492 -3063.878 1564.246                        
# M1.D           2  9 -3108.983 -3068.830 1563.492 1 vs 2 1.508718  0.2193

 
anova(Mfull2.lme, M1.E)  ## only works if using data_wkdf_sm

# Model df       AIC       BIC   logLik   Test    L.Ratio p-value
# Mfull2.lme     1 10 -3108.492 -3063.878 1564.246                          
# M1.E           2  9 -3110.462 -3070.309 1564.231 1 vs 2 0.03002286  0.8624


summary(Mfull2.lme)


## So, it seems that WSC_zc and MSLA and Vwind are not significant so we will omit them from the model. Now, we will refit the model with U and V winds.

Form2= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc)
Mfull3.lme <- lme(Form2, random=~1|Fish, method="ML", data=data_wkdf, na.action=na.omit)

M2.A <- update(Mfull3.lme, .~. -Uwind_zc)
M2.B <- update(Mfull3.lme, .~. -Av.Dis_zc)

anova (Mfull3.lme, M2.A)  ### only works if using data_wkdf_sm.. not sure why 

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.lme     1  7 -3111.674 -3080.443 1562.837                        
# M2.A           2  6 -3077.840 -3051.072 1544.920 1 vs 2 35.83334  <.0001

anova(Mfull3.lme, M2.B)

# > anova(Mfull3.lme, M2.B)

           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.lme     1  7 -2828.828 -2797.215 1421.414                        
# M2.B           2  6 -2793.584 -2766.487 1402.792 1 vs 2 37.24386  <.0001

Form3= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc)
Test1 <- lme(Form3, random=~1|Fish, method="ML", data=data_wkdf, na.action=na.omit)

Form4 = formula(IncW_trans ~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc)
Test2 <- lme(Form4, random= ~1|Fish, method="ML", data=data_wkdf, na.action=na.omit)

anova(Test2, Test1)
# Model df       AIC       BIC   logLik
# Test1     1  6 -3080.744 -3053.975 1546.372
# Test2     2  6 -3077.840 -3051.072 1544.920

## Now, we need to refit with REML and then Validate the Model page=138

Mfinal <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc, random=~1|Fish, method="REML", data=data_wkdf, na.action=na.omit)
Mfinal_test <- lme(IncW_trans ~ IncNum + fYr.Inc.Form, random=~1|Fish, data=data_wkdf, na.action=na.omit)


summary(Mfinal)

# Linear mixed-effects model fit by REML
# Data: data_wkdf 
# AIC       BIC   logLik
# -3206.966 -3175.384 1610.483
# 
# Random effects:
#   Formula: ~1 | Fish
# (Intercept)   Residual
# StdDev:  0.01499778 0.01811165
# 
# Fixed effects: IncW_trans ~ IncNum + Yr.Inc.Form + Uwind_zc + Av.Dis_zc 
# Value Std.Error  DF    t-value p-value
# (Intercept)  8.233048 2.3042478 485   3.572987  0.0004
# IncNum      -0.017263 0.0011901 485 -14.505807  0.0000
# Yr.Inc.Form -0.003686 0.0011490 485  -3.208153  0.0014
# Uwind_zc    -0.006111 0.0011132 485  -5.489030  0.0000
# Av.Dis_zc    0.000031 0.0000068 485   4.503863  0.0000
# Correlation: 
#   (Intr) IncNum Yr.I.F Uwnd_z
# IncNum       0.865                     
# Yr.Inc.Form -1.000 -0.866              
# Uwind_zc     0.011  0.042 -0.011       
# Av.Dis_zc    0.055  0.036 -0.055 -0.092
# 
# Standardized Within-Group Residuals:
#   Min          Q1         Med          Q3         Max 
# -2.45381077 -0.61445916  0.02050831  0.59160496  3.15331030 
# 
# Number of Observations: 678
# Number of Groups: 189 





## page 134 Zuur
op <- par(mfrow= c(6,2), mar=c(6,4,1,2))
ModelResiduals <- resid(Mfinal)
hist(ModelResiduals)
qqnorm(ModelResiduals)
F3 <- fitted(Mfinal)
MyYlab <- "residuals"
plot(x=F3, y=ModelResiduals, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf$IncNum, y = ModelResiduals, xlab= "IncNum", ylab=MyYlab)
plot(ModelResiduals ~ data_wkdf$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf$IncW_trans, ModelResiduals, xlab="IncWtrans", ylab="Residuals")
plot(data_wkdf$Uwind_zc, ModelResiduals, xlab= "Uwinds", ylab="Residuals")
plot(data_wkdf$Av.Dis_zc, ModelResiduals, xlab= "River Discharge", ylab="Residuals")
par(op)




## FORWARD DIFFERENCE CODING TO ASSESS SIGNIFICANCE IN INCREMENT WIDTH BY CATEGORICAL YEARS ##	

## seperate by increment number


idx3 <- data_wkdf$IncNum==3 
idx4<- data_wkdf$IncNum==4 
idx5 <- data_wkdf$IncNum ==5 
idx6 <- data_wkdf$IncNum ==6 
idx7 <- data_wkdf$IncNum==7


data_wkdf_3 <- data_wkdf[idx3,]
data_wkdf_4 <- data_wkdf[idx4,]
data_wkdf_5 <- data_wkdf[idx5,]
data_wkdf_6 <- data_wkdf[idx6,]
data_wkdf_7 <- data_wkdf[idx7,]

## must refactor the years
data_wkdf_3$fYr.Inc.Form <- factor(data_wkdf_3$fYr.Inc.Form)
data_wkdf_4$fYr.Inc.Form <- factor(data_wkdf_4$fYr.Inc.Form)
data_wkdf_5$fYr.Inc.Form <- factor(data_wkdf_5$fYr.Inc.Form)
data_wkdf_6$fYr.Inc.Form <- factor(data_wkdf_6$fYr.Inc.Form)
data_wkdf_7$fYr.Inc.Form <- factor(data_wkdf_7$fYr.Inc.Form)


## FORWARD DIFFERENCE CODING ## compares adjacent levels of a variable (each level minus the next level)

 my.forward.diff= matrix(c(5/6,-1/6,-1/6,-1/6,-1/6,-1/6,4/6,4/6,-2/6,-2/6,-2/6,-2/6,3/6,3/6,3/6,-3/6,-3/6,-3/6,2/6,2/6,2/6,2/6,-4/6,-4/6,1/6,1/6,1/6,1/6,1/6,-5/6), ncol=5)
contrasts(data_wkdf_3$fYr.Inc.Form)=my.forward.diff
lmFD3 <-lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_3, method="REML")
summary(lmFD3)

# Linear mixed-effects model fit by REML
 # Data: data_wkdf_3 
        # AIC       BIC   logLik
  # -625.8686 -600.1928 320.9343

# Random effects:
 # Formula: ~1 | Fish
        # (Intercept)  Residual
# StdDev:  0.03722848 0.0139608

# Fixed effects: IncW ~ fYr.Inc.Form 
                    # Value   Std.Error  DF  t-value p-value
# (Intercept)    0.26524988 0.003887102 183 68.23846  0.0000
# fYr.Inc.Form1 -0.01047917 0.011333365 183 -0.92463  0.3564
# fYr.Inc.Form2  0.03705194 0.008465676 183  4.37673  0.0000
# fYr.Inc.Form3 -0.00112316 0.007683095 183 -0.14619  0.8839
# fYr.Inc.Form4 -0.02588098 0.011391060 183 -2.27204  0.0242
# fYr.Inc.Form5 -0.01817974 0.018880393 183 -0.96289  0.3369
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1  0.112                                
# fYr.Inc.Form2  0.137 -0.515                         
# fYr.Inc.Form3 -0.081  0.000  -0.342                 
# fYr.Inc.Form4 -0.212  0.000   0.000  -0.420         
# fYr.Inc.Form5 -0.387  0.000   0.000   0.000  -0.432 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.67497479 -0.25991205 -0.05087224  0.24349850  0.94998827 

# Number of Observations: 189
# Number of Groups: 189 
# > 
## REVERSE HELMERT CODING - 3rd Increment

my.rev.helmert = matrix(c(-1/2, 1/2, 0,0,0,0,
                          -1/3,-1/3,2/3,0,0,0,
                          -1/4,-1/4,-1/4,3/4,0,0,
                          -1/5,-1/5,-1/5,-1/5,4/5,0, 
                          -1/6, -1/6, -1/6, -1/6, -1/6, 5/6), ncol=5)
contrasts(data_wkdf_3$fYr.Inc.Form)=my.rev.helmert
lmRH3 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_3, method="REML")
summary(lmRH3)

# fYr.Inc.Form1  0.01047917 0.011333365 183  0.92463  0.3564,, compares 07-06
# fYr.Inc.Form2 -0.03181235 0.007374075 183 -4.31408  0.0000, compares 08- 07&06
# fYr.Inc.Form3 -0.02008508 0.007315048 183 -2.74572  0.0066, compares 09, 08-07-06
# fYr.Inc.Form4  0.00522687 0.010976126 183  0.47620  0.2919, compares 10, 09-08-07-06
# fYr.Inc.Form5  0.02795154 0.017264535 183  1.61901  0.1072, compares 11, 10, 09,08-07-06

# I could also compare 11 to 10-06 but I decided to compare 11 to the years before the event


## USER DEFINED CODING
# 1. 2011 to 2009, 2006 ****
# 2. 2011 to 2010, 2008,2006
# 3. 2010 to 2009-2006 ****
# 4. 2006 to 2007, 2009-2011
# 5. 2007 to 2008-2011

mat = matrix(c(1/6,1/6,1/6,1/6,1/6,1/6, -1/4,-1/4, -1/4, -1/4, 0,1, -1/4,-1/4,-1/4,0,-1/4,1,-1/4,-1/4, -1/4, -1/4,1,0,1, -1/4, 0, -1/4, -1/4,-1/4,0,1,-1/4, -1/4, -1/4, -1/4), ncol=6)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:6]
contrasts(data_wkdf_3$fYr.Inc.Form) = my.contrasts
lmUD3 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_3, method="REML")
summary(lmUD3)

# Value   Std.Error  DF  t-value p-value
# (Intercept)    0.26524988 0.003887102 183 68.23846  0.0000
# fYr.Inc.Form1  0.02899692 0.016588986 183  1.74796  0.0821
# fYr.Inc.Form2  0.02252667 0.016694571 183  1.34934  0.1789
# fYr.Inc.Form3  0.01081718 0.010232750 183  1.05711  0.2919
# fYr.Inc.Form4 -0.00101801 0.010329952 183 -0.09855  0.9216
# fYr.Inc.Form5  0.01872414 0.008681629 183  2.15675  0.0323



#### 4th INCREMENT #

my.forward.diff= matrix(c(5/6,-1/6,-1/6,-1/6,-1/6,-1/6,4/6,4/6,-2/6,-2/6,-2/6,-2/6,3/6,3/6,3/6,-3/6,-3/6,-3/6,2/6,2/6,2/6,2/6,-4/6,-4/6,1/6,1/6,1/6,1/6,1/6,-5/6), ncol=5)
 contrasts(data_wkdf_4$fYr.Inc.Form)=my.forward.diff
lmFD4 <-lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_4, method="REML")
summary(lmFD4)

# Linear mixed-effects model fit by REML
 # Data: data_wkdf_4 
        # AIC       BIC   logLik
  # -621.2206 -595.9023 318.6103

# Random effects:
 # Formula: ~1 | Fish
        # (Intercept)   Residual
# StdDev:  0.03484021 0.01306515

# Fixed effects: IncW ~ fYr.Inc.Form 
                    # Value   Std.Error  DF  t-value p-value
# (Intercept)    0.21858426 0.004537143 175 48.17663  0.0000
# fYr.Inc.Form1  0.01391667 0.010606308 175  1.31211  0.1912
# fYr.Inc.Form2 -0.00750117 0.007922586 175 -0.94681  0.3450
# fYr.Inc.Form3  0.03173567 0.007190210 175  4.41373  0.0000
# fYr.Inc.Form4 -0.01898450 0.012148119 175 -1.56275  0.1199
# fYr.Inc.Form5 -0.01732222 0.024018557 175 -0.72120  0.4717
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1  0.090                                
# fYr.Inc.Form2  0.110 -0.515                         
# fYr.Inc.Form3 -0.065  0.000  -0.342                 
# fYr.Inc.Form4 -0.252  0.000   0.000  -0.369         
# fYr.Inc.Form5 -0.529  0.000   0.000   0.000  -0.395 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.67785294 -0.23985463 -0.04325048  0.20288406  0.98688619 

# Number of Observations: 181
# Number of Groups: 181 

## REVERSE HELMERT
my.rev.helmert = matrix(c(-1/2, 1/2, 0,0,0,0, -1/3,-1/3,2/3,0,0,0,-1/4,-1/4,-1/4,3/4,0,0,-1/5,-1/5,-1/5,-1/5,4/5,0, -1/6, -1/6, -1/6, -1/6, -1/6, 5/6), ncol=5)
contrasts(data_wkdf_4$fYr.Inc.Form)=my.rev.helmert
lmRH4 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_4, method="REML")
summary(lmRH4)

# Fixed effects: IncW ~ fYr.Inc.Form 
# Value   Std.Error  DF  t-value p-value
# (Intercept)    0.21858426 0.004537143 175 48.17663  0.0000
# fYr.Inc.Form1 -0.00695833 0.005303154 175 -1.31211  0.1912
# fYr.Inc.Form2  0.00018095 0.002300338 175  0.07866  0.9374
# fYr.Inc.Form3 -0.00784344 0.001711443 175 -4.58294  0.0000
# fYr.Inc.Form4 -0.00090917 0.002241787 175 -0.40555  0.6856
# fYr.Inc.Form5  0.00228093 0.003623594 175  0.62946  0.5299

## USER DEFINED
# 1. 2007 to 2008-2012
# 2. 2011 to 2009-2007 **** this is the primary one
# 3. 2012 to 2010-2007
# 4. 2010, 2012 to 2009,2007 
# 5. 2008 to 2010,2012


mat <- matrix(c(1/6,1/6,1/6,1/6,1/6,1/6,1,-1/5,-1/5,-1/5,-1/5,-1/5,-1/3,-1/3,-1/3,0,1,0,-1/4,-1/4,-1/4,-1/4,0,1, -1/3,-1/3,-1/3,1/3,1/3,1/3,0,1,0,-1/3, -1/3, -1/3), ncol=6)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:6]
contrasts(data_wkdf_4$fYr.Inc.Form) = my.contrasts
lmUD4 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_4, method="REML")
summary(lmUD4)

# (Intercept)    0.21858426 0.004537143 175 48.17663  0.0000
# fYr.Inc.Form1  0.01589889 0.009803123 175  1.62182  0.1066
# fYr.Inc.Form2 -0.01238928 0.011403695 175 -1.08643  0.2788
# fYr.Inc.Form3  0.01277639 0.021720381 175  0.58822  0.5571
# fYr.Inc.Form4 -0.01294337 0.009074286 175 -1.42638  0.1555
# fYr.Inc.Form5  0.00580409 0.010532970 175  0.55104  0.5823

# SECOND USER DEFINED

# 1. 2012 to 2009-2007 **** this is the primary one

mat <- matrix(c(1/6,1/6,1/6,1/6,1/6,1/6,
                -1/3,-1/3,-1/3,0,0,1,
                -1/4,-1/4,-1/4,-1/4,1,0,
                1,-1/4,0,-1/4,-1/4,-1/4, 
                1,0,-1/4,-1/4,-1/4,-1/4,
                0,1,-1/4,-1/4, -1/4, -1/4), ncol=6)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:6]
contrasts(data_wkdf_4$fYr.Inc.Form) = my.contrasts
lmUD4B <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_4, method="REML")
summary(lmUD4B)

# fYr.Inc.Form1  0.00493294 0.021821524 175  0.22606  0.8214
# fYr.Inc.Form2 -0.00454584 0.011208937 175 -0.40555  0.6856
# fYr.Inc.Form3  0.01826974 0.010488051 175  1.74196  0.0833
# fYr.Inc.Form4  0.01639444 0.010416997 175  1.57382  0.1173
# fYr.Inc.Form5  0.00247778 0.009085908 175  0.27271  0.7854


# THIRD USER DEFINED
#1. 2011 and 2012 to 2009-2007
mat <- matrix(c(1/6,1/6,1/6,1/6,1/6,1/6,
                -1/3,-1/3,-1/3,0,1/2,1/2,
                -1/4,-1/4,-1/4,-1/4,1,0,
                1,-1/4,0,-1/4,-1/4,-1/4, 
                1,0,-1/4,-1/4,-1/4,-1/4,
                0,1,-1/4,-1/4, -1/4, -1/4), ncol=6)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:6]
contrasts(data_wkdf_4$fYr.Inc.Form) = my.contrasts
lmUD4C <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_4, method="REML")
summary(lmUD4C)

# (Intercept)    0.21858426 0.004537143 175 48.17663  0.0000
# fYr.Inc.Form1 -0.00372817 0.012605110 175 -0.29577  0.7678
# fYr.Inc.Form2 -0.00454584 0.011208937 175 -0.40555  0.6856
# fYr.Inc.Form3  0.01826974 0.010488051 175  1.74196  0.0833
# fYr.Inc.Form4  0.01639444 0.010416997 175  1.57382  0.1173
# fYr.Inc.Form5  0.00247778 0.009085908 175  0.27271  0.7854


## 5th INCREMENT


my.forward.diff= matrix(c(4/5,-1/5,-1/5,-1/5,-1/5, 3/5,3/5,-2/5,-2/5,-2/5,2/5,2/5,2/5,-3/5,-3/5,1/5,1/5,1/5,1/5,-4/5), ncol=4)
contrasts(data_wkdf_5$fYr.Inc.Form)=my.forward.diff
 lmFD5 <-lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_5, method="REML")
 summary(lmFD5)


 
# Linear mixed-effects model fit by REML
 # Data: data_wkdf_5 
        # AIC       BIC   logLik
  # -568.8556 -547.7346 291.4278

# Random effects:
 # Formula: ~1 | Fish
        # (Intercept)   Residual
# StdDev:  0.03130777 0.01174047

# Fixed effects: IncW ~ fYr.Inc.Form 
                    # Value   Std.Error  DF  t-value p-value
# (Intercept)    0.19347881 0.005297765 151 36.52084  0.0000
# fYr.Inc.Form1 -0.01625000 0.009530934 151 -1.70497  0.0903
# fYr.Inc.Form2  0.03285329 0.007119315 151  4.61467  0.0000
# fYr.Inc.Form3  0.00064940 0.007198033 151  0.09022  0.9282
# fYr.Inc.Form4 -0.02308602 0.024394106 151 -0.94638  0.3455
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3
# fYr.Inc.Form1  0.083                        
# fYr.Inc.Form2  0.102 -0.515                 
# fYr.Inc.Form3 -0.107  0.000  -0.307         
# fYr.Inc.Form4 -0.809  0.000   0.000  -0.205 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.79700462 -0.27899201  0.01060594  0.21936916  1.16321457 

# Number of Observations: 156
# Number of Groups: 156 

## REVERSE HELMERT ###
my.rev.helmert = matrix(c(-1/2, 1/2, 0,0,0, -1/3,-1/3,2/3,0,0,-1/4,-1/4,-1/4,3/4,0,-1/5,-1/5,-1/5,-1/5,4/5), ncol=4)
contrasts(data_wkdf_5$fYr.Inc.Form)=my.rev.helmert
lmRH5 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_5, method="REML")
summary(lmRH5)
# 
# fYr.Inc.Form1  0.01625000 0.009530934 151  1.70497  0.0903
# fYr.Inc.Form2 -0.02472829 0.006201319 151 -3.98758  0.0001
# fYr.Inc.Form3 -0.01713493 0.006921547 151 -2.47559  0.0144
# fYr.Inc.Form4  0.01023483 0.023831136 151  0.42947  0.6682
# Correlation: 

## USER DEFINED for 5
# 1. 2011,12 to 2008,2009 **
# 2. 2008 to 2009,2012 ***
# 3. 2008,09,10 to 12
# 4. 2008,2009 to 11 ***
mat = matrix(c(1/5, 1/5, 1/5, 1/5, 1/5,
               -1/2, -1/2,0,1/2,1/2,
               1, -1/4, -1/4, -1/4,-1/4,
               -1/3, -1/3, -1/3, 0,1,
               -1/2, -1/2, 0, 1, 0), ncol=5)


mymat <- solve(t(mat))
my.contrasts<- mymat[,2:5]
contrasts(data_wkdf_5$fYr.Inc.Form)=my.contrasts
lmUD5 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_5, method="REML")
summary(lmUD5)
# fYr.Inc.Form1 -0.01383468 0.013094952 151 -1.05649  0.2924
# fYr.Inc.Form2  0.00294316 0.009811246 151  0.29998  0.7646
# fYr.Inc.Form3  0.00595110 0.023892472 151  0.24908  0.8036
# fYr.Inc.Form4 -0.02537769 0.007666464 151 -3.31022  0.0012


## SECOND USERS DEFINED
# 1. 2011,12 to 2008,2009 
# 2. 2008 to 2009,2012 
# 3. 2008,09, to 12 ***
# 4. 2008,2009 to 10,11,12 

mat = matrix(c(1/5, 1/5, 1/5, 1/5, 1/5,
               -1/2, -1/2,0,1/2,1/2,
               1, -1/4, -1/4, -1/4,-1/4,
               -1/2, -1/2, 0, 0,1,
               -1/2, -1/2, 1/3, 1/3, 1/3), ncol=5)

mymat <- solve(t(mat))
my.contrasts<- mymat[,2:5]
contrasts(data_wkdf_5$fYr.Inc.Form)=my.contrasts
lmUD5B <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_5, method="REML")
summary(lmUD5B)

# fYr.Inc.Form1 -0.01383468 0.013094952 151 -1.05649  0.2924
# fYr.Inc.Form2  0.00294316 0.009811246 151  0.29998  0.7646
# fYr.Inc.Form3 -0.00229167 0.024118812 151 -0.09502  0.9244
# fYr.Inc.Form4 -0.01746588 0.009517272 151 -1.83518  0.0684



## 6th INCREMENT

my.forward.diff= matrix(c(3/4,-1/4,-1/4,-1/4,1/2,1/2,-1/2,-1/2,1/4,1/4,1/4,-3/4), ncol=3)
contrasts(data_wkdf_6$fYr.Inc.Form)=my.forward.diff
lmFD6 <-lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_6, method="REML")
summary(lmFD6)

# Linear mixed-effects model fit by REML
 # Data: data_wkdf_6 
        # AIC      BIC   logLik
  # -409.3778 -393.687 210.6889

# Random effects:
 # Formula: ~1 | Fish
        # (Intercept)   Residual
# StdDev:  0.02644307 0.00991614

# Fixed effects: IncW ~ fYr.Inc.Form 
                   # Value   Std.Error  DF  t-value p-value
# (Intercept)   0.16344377 0.003192832 101 51.19085  0.0000
# fYr.Inc.Form1 0.03081250 0.008049982 101  3.82765  0.0002
# fYr.Inc.Form2 0.00329990 0.006593327 101  0.50049  0.6178
# fYr.Inc.Form3 0.02252093 0.009914868 101  2.27143  0.0252
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2
# fYr.Inc.Form1  0.145                
# fYr.Inc.Form2  0.076 -0.470         
# fYr.Inc.Form3 -0.483  0.000  -0.284 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.66931033 -0.24477487 -0.04765987  0.21110213  1.07131095 

# Number of Observations: 105
# Number of Groups: 105 

## REVERSE HELMERT ###
my.rev.helmert = matrix(c(-1/2, 1/2, 0,0, -1/3,-1/3,2/3,0,-1/4,-1/4,-1/4,3/4), ncol=3)
contrasts(data_wkdf_6$fYr.Inc.Form)=my.rev.helmert
lmRH6 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_6, method="REML")
summary(lmRH6)

# (Intercept)    0.16344377 0.003192832 101 51.19085   0e+00
# fYr.Inc.Form1 -0.03081250 0.008049982 101 -3.82765   2e-04
# fYr.Inc.Form2 -0.01870615 0.005894793 101 -3.17333   2e-03
# fYr.Inc.Form3 -0.03499170 0.009434919 101 -3.70874   3e-04


## USER DEFINED for 6
# 1. compare 2009 to 11,12
# 2. 2009 to 10,11,12
# 3. 09 and 10 to 12

mat <- matrix(c(1/4,1/4, 1/4, 1/4,
                1,0,-1/2,-1/2,
                1, -1/3,-1/3,-1/3,
                1/2,1/2,0,-1), ncol=4)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:4]
contrasts(data_wkdf_6$fYr.Inc.Form)= my.contrasts
lmUD6 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_6, method="REML")
summary(lmUD6)

# fYr.Inc.Form1 0.04537287 0.008028352 101  5.65158   0e+00
# fYr.Inc.Form2 0.04051941 0.007319176 101  5.53606   0e+00
# fYr.Inc.Form3 0.04122708 0.009795770 101  4.20866   1e-04




## 7th INCREMENT

my.forward.diff= matrix(c(2/3,-1/3,-1/3,1/3,1/3,-2/3), ncol=2)
contrasts(data_wkdf_7$fYr.Inc.Form)=my.forward.diff
lmFD7 <-lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_7, method="REML")
summary(lmFD7)

# Linear mixed-effects model fit by REML
 # Data: data_wkdf_7 
        # AIC       BIC   logLik
  # -164.4711 -155.5501 87.23553

# Random effects:
 # Formula: ~1 | Fish
        # (Intercept)   Residual
# StdDev:  0.02844576 0.01066716

# Fixed effects: IncW ~ fYr.Inc.Form 
                    # Value   Std.Error DF   t-value p-value
# (Intercept)    0.14253987 0.004627617 44 30.801999  0.0000
# fYr.Inc.Form1  0.01048039 0.010021908 44  1.045748  0.3014
# fYr.Inc.Form2 -0.00008039 0.012107275 44 -0.006640  0.9947
 # Correlation: 
              # (Intr) fY.I.F1
# fYr.Inc.Form1 -0.059        
# fYr.Inc.Form2 -0.226 -0.447 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.56748231 -0.24186154 -0.06572017  0.18192022  1.31564974 

# Number of Observations: 47
# Number of Groups: 47 
> 
  
  ## REVERSE HELMERT ###
  
  
  contrasts(data_wkdf_7$fYr.Inc.Form)= contr.helmert(3)
lmRH7 <- lme(IncW ~ fYr.Inc.Form, random=~1|Fish, data=data_wkdf_7, method="REML")
summary(lmRH7)
  
# Value   Std.Error DF   t-value p-value
# (Intercept)    0.14253987 0.004627617 44 30.801999  0.0000
# fYr.Inc.Form1 -0.00524020 0.005010954 44 -1.045748  0.3014
# fYr.Inc.Form2 -0.00171993 0.003611780 44 -0.476201  0.6363





## PLOTS OF ENVIRONMENTAL VARIABLES WITH INCREMENT WIDTH ##
library(ggplot2)

Vwind <- ggplot(data_wkdf, aes(x=Vwind_zc, y=IncW_trans)) + geom_point()

Uwind <- ggplot(data_wkdf, aes(x=Uwind_zc, y=IncW_trans)) + geom_point()
MSLA <- ggplot(data_wkdf, aes(x=MSLA_zc, y=IncW_trans)) + geom_point()
Riv <- ggplot(data_wkdf, aes(x=Av.Dis_zc, y=IncW_trans)) + geom_point()
WSC <- ggplot(data_wkdf, aes(x=WSC_zc, y=IncW_trans)) + geom_point()

# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

multiplot(Vwind, Uwind, MSLA, Riv, WSC, cols=2)


