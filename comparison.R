data= read.csv("BC_6_5_14.csv", header=TRUE)

data$nJune.U = as.numeric(as.character(data$June.U));
data$nJuly.U = as.numeric(as.character(data$July.U));
data$nAugust.U = as.numeric(as.character(data$August.U));
data$nSeptember.U = as.numeric(as.character(data$September.U));
data$nOctober.U = as.numeric(as.character(data$October.U));
data$nNovember.U = as.numeric(as.character(data$November.U));
data$nDecember.U = as.numeric(as.character(data$December.U));

data$nJune.V = as.numeric(as.character(data$June.V));
data$nJuly.V = as.numeric(as.character(data$July.V));
data$nAugust.V = as.numeric(as.character(data$August.V));
data$nSeptember.V = as.numeric(as.character(data$September.V));
data$nOctober.V = as.numeric(as.character(data$October.V));
data$nNovember.V = as.numeric(as.character(data$November.V));
data$nDecember.V = as.numeric(as.character(data$December.V));
 
data$nAvg.Discharge= as.numeric(as.character(data$Avg.Discharge))

data$nJune.MSLA = as.numeric(as.character(data$June.MSLA))
data$nJuly.MSLA = as.numeric(as.character(data$July.MSLA))
data$nAugust.MSLA = as.numeric(as.character(data$August.MSLA))
data$nSeptember.MSLA = as.numeric(as.character(data$September.MSLA))
data$nOctober.MSLA = as.numeric(as.character(data$October.MSLA))
data$nNovember.MSLA = as.numeric(as.character(data$November.MSLA))
data$nDecember.MSLA = as.numeric(as.character(data$December.MSLA))


## make all variables their own
Av.Dis <- data$nAvg.Discharge 


CatchYr <- data$Catch.Year

Fish.ID <- data$Fish.ID

Age.at.Catch <- data$Age.at.Catch

IncNum <- data$Increment.Number

IncW <- data$Increment.Width

U_winds= cbind(data$nJune.U, data$nJuly.U, data$nAugust.U, data$nSeptember.U, data$nOctober.U, data$nNovember.U, data$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data$nJune.V, data$nJuly.V, data$nAugust.V, data$nSeptember.V, data$nOctober.V, data$nNovember.V, data$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data$nJune.MSLA, data$nJuly.MSLA,data$nAugust.MSLA,data$nSeptember.MSLA,data$nOctober.MSLA,data$nNovember.MSLA,data$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)


data_wk = cbind(IncW, IncW^(.303),log(IncW+1), IncNum, data$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median, CatchYr, Fish.ID)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(data_wk) = c("IncW", "IncW_trans","IncW_logtrans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "CatchYr", "Fish.ID")
data_wkdf = data.frame(data_wk)
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


# Step 1- look for outliers, page 533 in Zuur
# produce Cleveland dotplots

op <- par(mfrow= c(5,2), mar = c(3,3,3,1))
dotchart(data_wkdf$IncW, main="IncW", group=data_wkdf$Yr.Inc.Form)
plot(0,0, type="n", axes=FALSE)
dotchart(data_wkdf$IncNum, main="IncNum", group= data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Yr.Inc.Form, main= "Year of Increment Formation", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Uwind, main= "U med", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Vwind, main= "V med", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$Av.Dis, main="AvDis", group = data_wkdf$Yr.Inc.Form)
dotchart(data_wkdf$MSLA, main="MSLA", group= data_wkdf$Yr.Inc.Form)
par(op)

# Check for collinearity among 3 environmental variables

Z <- cbind(U_wind_median, V_wind_median, Av.Dis,MSLA_median IncW)
pairs(Z, lower.panel=panel.smooth2, upper.panel= panel.cor, diag.panel=panel.hist)  ## must load functions from the HighstatLibV6.R document for this to run correctly because AED package is no longer available


# another way to assess colinearity is VIF (variance inflation factors- all VIF  below 3 indicate no collinearity in variables)
corvif(Z[,c(-1,-4)])  ## most load both corvif functions from the HighstatLibV6.R document for this to run corrently because AED package is no longer available


# ####### STEP 1 ###### Try a Linear Regression first- based on pages 130- in Zuur
# M.lm <- lm(IncW ~ IncNum + fYr.Inc.Form*U_wind_median + fYr.Inc.Form*V_wind_median + fYr.Inc.Form*Av.Dis, data= data_wkdf) # one of the prime aims is to find the year of increment formation effect, we also include the interaction between sex and each of the other variables- page 130 Zuur


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


# fit using a gls, lme, gam and gamm
library(nlme)
M.gls <- gls(IncW~ IncNum +Yr.Inc.Form +Uwind +Vwind +Av.Dis +MSLA_median, data=data_wkdf, na.action=na.omit)
M1.lme <- lme(IncW ~ IncNum + Yr.Inc.Form+ Uwind + Vwind + Av.Dis +MSLA_median, random= ~1|CatchYr, method= "REML", data=data_wkdf, na.action=na.omit)
M2.lme <- lme(IncW ~ IncNum +Yr.Inc.Form + Uwind + Vwind +Av.Dis +MSLA_median, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf, na.action=na.omit)

# compare AIC of M.gls, M1.lme and M2.lme
AIC(M.gls, M1.lme, M2.lme)

       # df       AIC
# M.gls   8 -925.9301
# M1.lme  9 -925.6426
# M2.lme 10 -921.9301

# but plotting residuals shows problem so we cannot trust these outputs. and we know that its important to include a random variable  so lets try a gam. In this format we cannot include a random variable but we will see what shows up. 

library(mgcv)
# first-put smoothers on everything and see if they are significant
M.gam <- gam(IncW ~ s(IncNum) + fYr.Inc.Form + s(Uwind) + s(Vwind) + Av.Dis, method="REML", data=data_wkdf, na.action=na.omit)
summary(M.gam)
# the only two significant smoothers are for Vwind and IncNum, therefor no smoother for Uwind needs to be used

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
# results in .303 so all IncNum must be raised to the .303
IncW_trans <- IncW^(.303)

# zero center X 
mean <- mean(IncNum)
IncNum_zc <- IncNum- mean

# we can check the residuals
# lm <- lm(IncW_trans~IncNum)
# E <- resid(lm)
# plot(E)
 # op <- par(mfrow=c(2,2))
# plot(lm, add.smooth=FALSE)
# par(op)


# still doesnt look totally right
# lets remove increment numbers 1 and 2

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

data_wkdf_new= data.frame(rbind(data_wkdf_3, data_wkdf_4, data_wkdf_5, data_wkdf_6, data_wkdf_7))
data_wkdf_new$IncNum_zc2 <-data_wkdf_new$IncNum- mean(data_wkdf_new$IncNum)

# must refactor the years and remove the old factored column

data_wkdf_new$fnewYr.Inc.Form <- factor(data_wkdf_new$Yr.Inc.Form)

data_wkdf_new["fYr.Inc.Form"] <- NULL

# lets also zero center the environmental variables

data_wkdf_new$Av.Dis_zc <- data_wkdf_new$Av.Dis - mean(data_wkdf_new$Av.Dis, na.rm=TRUE)


data_wkdf_new$Uwind_zc <- data_wkdf_new$Uwind - mean(data_wkdf_new$Uwind, na.rm=TRUE)

data_wkdf_new$Vwind_zc <- data_wkdf_new$Vwind - mean(data_wkdf_new$Vwind, na.rm=TRUE)

data_wkdf_new$MSLA_zc <- data_wkdf_new$MSLA -mean(data_wkdf$MSLA, na.rm=TRUE)


## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(IncW_trans~ IncNum+ fnewYr.Inc.Form, method="REML", data=data_wkdf_new, na.action=na.omit)
Mtest.lme <- lme(IncW_trans ~ IncNum + fnewYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wkdf_new, na.action=na.omit)
Mtest2.lme <- lme(IncW_trans ~IncNum + fnewYr.Inc.Form, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", data=data_wkdf_new, na.action=na.omit)
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

# F2 <- fitted(Mtest.lme) ### page 134
# E <-resid(Mtest.lme)
# op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
# MyYlab <- "residuals"
# plot(x=F2, y=E, xlab="fitted values", ylab= MyYlab)
# plot(data_wkdf_new$IncNum, y = E, xlab= "IncNum", ylab=MyYlab)
# plot(E ~ data_wkdf_new$fnewYr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
# plot(data_wkdf_new$IncW_trans, E, xlab="IncWtrans", ylab="Residuals")
# plot(data_wkdf_new$MSLA, E, xlab="MSLA", ylab="Residuals")
# par(op)


## I think this is the best its going to get at this point.


## at this point I think this is the best that I can get it. we will use lme with IncW_trans from the new data set with only increment numbers 3, 4, 5, 6 and 7 with a random term Fish.ID included. Now we can start adding the environmental covariates and see if any are important or make better for an AIC criterion
data_wkdf_new <-  data_wkdf_new[complete.cases(data_wkdf_new$Vwind_zc),]  ### removing NA present in Vwindzc
Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + Av.Dis_zc + MSLA_zc)


## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135
Mfull.lme <- lme(Form, random=~1|Fish.ID, method="REML", data=data_wkdf_new, na.action=na.omit)


Mfull2.lme <- lme(Form, random=~1|Fish.ID, method="ML", data=data_wkdf_new, na.action=na.omit)
M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.lme, .~. - Uwind_zc)
M1.C <- update(Mfull2.lme, .~. - Vwind_zc)
M1.D <- update(Mfull2.lme, .~. - MSLA_zc)

anova(Mfull2.lme, M1.A)
# > anova(Mfull2.lme, M1.A)
           # Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1  8 -2840.653 -2804.524 1428.327                         
# M1.A           2  7 -2842.029 -2810.416 1428.015 1 vs 2 0.6241115  0.4295


anova(Mfull2.lme, M1.B)
# > anova(Mfull2.lme, M1.B)
           # Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1  8 -2840.653 -2804.524 1428.327                         
# M1.B           2  7 -2842.413 -2810.800 1428.207 1 vs 2 0.2399926  0.6242

anova(Mfull2.lme, M1.C)

 # anova(Mfull2.lme, M1.C)
           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1  8 -2840.653 -2804.524 1428.327                        
# M1.C           2  7 -2808.372 -2776.759 1411.186 1 vs 2 34.28138  <.0001

anova(Mfull2.lme, M1.D)
# anova(Mfull2.lme, M1.D)
           # Model df       AIC       BIC   logLik   Test    L.Ratio p-value
# Mfull2.lme     1  9 -2836.562 -2795.916 1427.281                          
# M1.D           2  8 -2838.548 -2802.419 1427.274 1 vs 2 0.01319318  0.9086
> 



## So, it seems that Av.Dis_zc and Uwind_zv are not significant so we will omit them from the model. We have reached the end of the selection process. 
## Now, we need to refit with REML and then Validate the Model page=138

Mfinal <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Vwind_zc, random=~1|Fish.ID, method="REML", data=data_wkdf_new, na.action=na.omit)

summary(Mfinal)

> summary(Mfinal)
# Linear mixed-effects model fit by REML
 # Data: data_wkdf_new 
        # AIC       BIC   logLik
  # -2799.989 -2772.928 1405.995

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)   Residual
# StdDev:  0.02131711 0.02456769

# Fixed effects: IncW_trans ~ IncNum + Yr.Inc.Form + Vwind_zc 
                # Value Std.Error  DF    t-value p-value
# (Intercept) 17.295432  3.381362 485   5.114930       0
# IncNum      -0.023181  0.001680 485 -13.797645       0
# Yr.Inc.Form -0.008249  0.001686 485  -4.892856       0
# Vwind_zc     0.022722  0.003183 485   7.138666       0
 # Correlation: 
            # (Intr) IncNum Yr.I.F
# IncNum       0.848              
# Yr.Inc.Form -1.000 -0.849       
# Vwind_zc     0.260  0.007 -0.260

# Standardized Within-Group Residuals:
         # Min           Q1          Med           Q3          Max 
# -2.463278260 -0.623796048  0.006044137  0.576973834  3.519287237 

# Number of Observations: 676
# Number of Groups: 188 
# > 


op <- par(mfrow= c(4,2), mar=c(5,4,1,2))
plot(Mfinal)
E <- resid(Mfinal)
hist(E)
qqnorm(E)
F4 <- fitted(Mfinal)

plot(y=E, x= F4, xlab="fitted values", ylab= "Residuals")
plot(data_wkdf_new$IncNum, y = E, xlab= "IncNum", ylab=MyYlab)
plot(E ~ data_wkdf_new$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf_new$IncW_trans, E, xlab="IncWtrans", ylab="Residuals")
plot(data_wkdf_new$Vwind_zc, E, xlab="Vwinds", yab= "Residuals")
par(op)
