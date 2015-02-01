## May 27, 2014 -
# Loading data, doing exploration, fitting models and then validating models

data= read.csv("BC_6_23_14.csv", header=TRUE)

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


### remove outliers for WSC #### based on box plots outliers will be removed 

plot(data_wkdf$Yr.Inc.Form, data_wkdf$WSC)  ### whats interesting is that this seems to follow the plots... hmmmmm



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

data_wk1=cbind(IncW, IncW^(.303),log(IncW+1), IncNum, data_wk$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)
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

# Instead of using a smoothing term we can transform the data based on the Boxcox transformation found on March 17th and then zero center the x and see what the residuals look like 
library(MASS)
b <- boxcox(lm(IncW ~ IncNum, data=data_wkdf), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]




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

           # df       AIC
# Mtest.gls   9 -2623.393
# Mtest.lme  10 -2762.882
# Mtest2.lme 11 -2760.882


# > 
 anova(Mtest.gls, Mtest.lme)
          # Model df       AIC       BIC   logLik   Test L.Ratio p-value
# Mtest.gls     1  9 -2623.393 -2582.828 1320.697                       
# Mtest.lme     2 10 -2762.882 -2717.810 1391.441 1 vs 2 141.489  <.0001
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

data_wkdf <-  data_wkdf[complete.cases(data_wkdf$Vwind_zc),]  ### removing NA present in Vwindzc

Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + MSLA_zc + WSC_zc) # Av.Dis_zc 

## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135

library(nlme)



Mfull2.lme <- lme(Form, random=~1|Fish.ID, method="ML", data=data_wkdf, na.action=na.omit)
#M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.lme, .~. - Uwind_zc)
M1.C <- update(Mfull2.lme, .~. - Vwind_zc)
M1.D <- update(Mfull2.lme, .~. - MSLA_zc)
M1.E <- update(Mfull2.lme, .~. - WSC_zc)
anova(Mfull2.lme, M1.A)

           # Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                         
# M1.A           2  9 -1610.481 -1574.740 814.2407 1 vs 2 0.8686669  0.3513



anova(Mfull2.lme, M1.B)

           # Model df       AIC       BIC   logLik   Test L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                       
# M1.B           2  9 -1606.661 -1570.920 812.3307 1 vs 2  4.6887  0.0304

anova(Mfull2.lme, M1.C)

           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                        
# M1.C           2  9 -1601.682 -1565.941 809.8412 1 vs 2 9.667691  0.0019

anova(Mfull2.lme, M1.D)

           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                        
# M1.D           2  9 -1609.768 -1574.027 813.8841 1 vs 2 1.581848  0.2085


> 
anova(Mfull2.lme, M1.E)

summary(Mfull2.lme)


## So, it seems that Av.Dis_zc and MSLA are not significant so we will omit them from the model. Now, we will refit the model with U and V winds.

Form2= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc)
Mfull3.lme <- lme(Form2, random=~1|Fish.ID, method="ML", data=data_wkdf, na.action=na.omit)

M2.A <- update(Mfull3.lme, .~. -Uwind_zc)
M2.B <- update(Mfull3.lme, .~. -Vwind_zc)

anova (Mfull3.lme, M2.A)
anova(Mfull3.lme, M2.B)

# > anova (Mfull3.lme, M2.A)
           # Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull3.lme     1  7 -2828.828 -2797.215 1421.414                         
# M2.A           2  6 -2830.255 -2803.158 1421.128 1 vs 2 0.5725261  0.4493
# > anova(Mfull3.lme, M2.B)
           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.lme     1  7 -2828.828 -2797.215 1421.414                        
# M2.B           2  6 -2793.584 -2766.487 1402.792 1 vs 2 37.24386  <.0001



## Now, we need to refit with REML and then Validate the Model page=138

Mfinal <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Vwind, random=~1|Fish.ID, method="REML", data=data_wkdf, na.action=na.omit)

summary(Mfinal)

> summary(Mfinal)
# Linear mixed-effects model fit by REML
 # Data: data_wkdf 
       # AIC       BIC  logLik
  # -2784.86 -2757.799 1398.43

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)   Residual
# StdDev:  0.02172621 0.02474786

# Fixed effects: IncW_trans ~ IncNum + Yr.Inc.Form + Vwind_zc 
                # Value Std.Error  DF    t-value p-value
# (Intercept) 12.716350  3.296683 484   3.857317   1e-04
# IncNum      -0.023429  0.001684 484 -13.914476   0e+00
# Yr.Inc.Form -0.005969  0.001644 484  -3.631320   3e-04
# Vwind_zc     0.008741  0.001424 484   6.138846   0e+00
 # Correlation: 
            # (Intr) IncNum Yr.I.F
# IncNum       0.870              
# Yr.Inc.Form -1.000 -0.870       
# Vwind_zc     0.131  0.031 -0.131

# Standardized Within-Group Residuals:
       # Min         Q1        Med         Q3        Max 
# -2.3751703 -0.6505964  0.0127969  0.5766761  3.4675503 

# Number of Observations: 676
# Number of Groups: 189 




## page 134 Zuur
op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
E2 <- resid(Mfinal)
hist(E2)
qqnorm(E2)
F3 <- fitted(Mfinal)
MyYlab <- "residuals"
plot(x=F3, y=E2, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf$IncNum, y = E2, xlab= "IncNum", ylab=MyYlab)
plot(E2 ~ data_wkdf$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf$IncW_trans, E2, xlab="IncWtrans", ylab="Residuals")
plot(data_wkdf$Vwind_zc, E2, xlab= "Vwinds", ylab="Residuals")
par(op)


### evaluating V winds
## apply coding- where the mean of the dependent variable for one level of the categorical variable is compared to the mean of the dependent variable for other levels- Forward Difference Coding

library(bear)
testdf <- data.frame(summarySE(data_wkdf,measurevar="Vwind" , groupvars=c("Yr.Inc.Form")))

 # Yr.Inc.Form   N      Vwind        sd         se         ci
# 1        2006  20 -0.1817516 0.1156250 0.02585454 0.05411418
# 2        2007  52  0.6151907 0.2541112 0.03523889 0.07074501
# 3        2008 123  0.1514212 0.4772812 0.04303500 0.08519207
# 4        2009 166  1.6243357 0.4905011 0.03807027 0.07516768
# 5        2010 183  0.2584684 0.1551749 0.01147086 0.02263296
# 6        2011 109  1.2711452 0.5990446 0.05737807 0.11373328
# 7        2012  25         NA        NA         NA         NA

# for some reason the last entry is not giving an entry so i will try to do this manualy 
#http://stackoverflow.com/questions/19079717/aggregate-function-creates-unwanted-vector-within-data-frame
output <- aggregate(Vwind ~ Yr.Inc.Form, FUN=mean, data=data_wkdf)
output_sd <- aggregate(Vwind ~ Yr.Inc.Form, FUN=sd, data=data_wkdf)
n <- c(20,52,123,166,183,109,25)
final <- cbind(output, (output_sd$Vwind/sqrt(n)))
colnames(final) <- c("Yr.Inc.Form","Vwind_mean","se")

  # Yr.Inc.Form Vwind_mean         se
# 1        2006 -0.1817516 0.02585454
# 2        2007  0.6151907 0.03523889
# 3        2008  0.1514212 0.04303500
# 4        2009  1.6243357 0.03807027
# 5        2010  0.2584684 0.01147086
# 6        2011  1.2711452 0.05737807
# 7        2012  0.9989114 0.04508775

				

Vwind_ggplot <- ggplot(data=final, aes(x=Yr.Inc.Form, y=Vwind_mean, group=1)) +geom_line() +geom_point()+
			geom_errorbar(aes(ymin=Vwind_mean-se, ymax= Vwind_mean+se), width=.15)
			
