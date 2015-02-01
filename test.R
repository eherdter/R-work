
test= read.csv("BC_6_5_14.csv", header=TRUE)

test$nJune.U = as.numeric(as.character(test$June.U));
test$nJuly.U = as.numeric(as.character(test$July.U));
test$nAugust.U = as.numeric(as.character(test$August.U));
test$nSeptember.U = as.numeric(as.character(test$September.U));
test$nOctober.U = as.numeric(as.character(test$October.U));
test$nNovember.U = as.numeric(as.character(test$November.U));
test$nDecember.U = as.numeric(as.character(test$December.U));

test$nJune.V = as.numeric(as.character(test$June.V));
test$nJuly.V = as.numeric(as.character(test$July.V));
test$nAugust.V = as.numeric(as.character(test$August.V));
test$nSeptember.V = as.numeric(as.character(test$September.V));
test$nOctober.V = as.numeric(as.character(test$October.V));
test$nNovember.V = as.numeric(as.character(test$November.V));
test$nDecember.V = as.numeric(as.character(test$December.V));
 
test$nAvg.Discharge= as.numeric(as.character(test$Avg.Discharge))

test$nJune.MSLA = as.numeric(as.character(test$June.MSLA))
test$nJuly.MSLA = as.numeric(as.character(test$July.MSLA))
test$nAugust.MSLA = as.numeric(as.character(test$August.MSLA))
test$nSeptember.MSLA = as.numeric(as.character(test$September.MSLA))
test$nOctober.MSLA = as.numeric(as.character(test$October.MSLA))
test$nNovember.MSLA = as.numeric(as.character(test$November.MSLA))
test$nDecember.MSLA = as.numeric(as.character(test$December.MSLA))


test$nJune.WSC = as.numeric(as.character(test$June.WSC))
test$nJuly.WSC = as.numeric(as.character(test$July.WSC))
test$nAugust.WSC = as.numeric(as.character(test$August.WSC))
test$nSeptember.WSC = as.numeric(as.character(test$September.WSC))
test$nOctober.WSC = as.numeric(as.character(test$October.WSC))
test$nNovember.WSC = as.numeric(as.character(test$November.WSC))
test$nDecember.WSC = as.numeric(as.character(test$December.WSC))


Av.Dis <- test$nAvg.Discharge 


CatchYr <- test$Catch.Year

Fish.ID <- test$Fish.ID

Age.at.Catch <- test$Age.at.Catch

IncNum <- test$Increment.Number

IncW <- test$Increment.Width

U_winds= cbind(test$nJune.U, test$nJuly.U, test$nAugust.U, test$nSeptember.U, test$nOctober.U, test$nNovember.U, test$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(test$nJune.V, test$nJuly.V, test$nAugust.V, test$nSeptember.V, test$nOctober.V, test$nNovember.V, test$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(test$nJune.MSLA, test$nJuly.MSLA,test$nAugust.MSLA,test$nSeptember.MSLA,test$nOctober.MSLA,test$nNovember.MSLA,test$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(test$nJune.WSC, test$nJuly.WSC, test$nAugust.WSC, test$nSeptember.WSC, test$nOctober.WSC, test$nNovember.WSC, test$nDecember.WSC)

WSC_median=apply(WSC,1,median)


test_wk = cbind(IncW, IncW^(.303),log(IncW+1), IncNum, test$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median, CatchYr, Fish.ID, WSC_median)
## the IncW^.303 was added based on lines below that determine the optimal Boxcox transformation 
colnames(test_wk) = c("IncW", "IncW_trans","IncW_logtrans", "IncNum", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "CatchYr", "Fish.ID", "WSC")
test_wkdf = data.frame(test_wk)
test_wkdf$fYr.Inc.Form= factor(test_wkdf$Yr.Inc.Form)


idx3 <- test_wkdf$IncNum==3 
idx4<- test_wkdf$IncNum==4 
idx5 <- test_wkdf$IncNum ==5 
idx6 <- test_wkdf$IncNum ==6 
idx7 <- test_wkdf$IncNum==7

test_wk_3 <- test_wkdf[idx3,]
test_wk_4 <- test_wkdf[idx4,]
test_wk_5 <- test_wkdf[idx5,]
test_wk_6 <- test_wkdf[idx6,]
test_wk_7 <- test_wkdf[idx7,]

test_wkdf_new <- rbind(test_wk_3, test_wk_4, test_wk_5, test_wk_6, test_wk_7)



test_wkdf_new$Av.Dis_zc <- test_wkdf_new$Av.Dis - mean(test_wkdf_new$Av.Dis, na.rm=TRUE)

test_wkdf_new$Uwind_zc <- test_wkdf_new$Uwind - mean(test_wkdf_new$Uwind, na.rm=TRUE)

test_wkdf_new$Vwind_zc <- test_wkdf_new$Vwind - mean(test_wkdf_new$Vwind, na.rm=TRUE)

test_wkdf_new$MSLA_zc <- test_wkdf_new$MSLA -mean(test_wkdf_new$MSLA, na.rm=TRUE)

test_wkdf_new$WSC_zc <- test_wkdf_new$WSC- mean(test_wkdf_new$WSC, na.rm=TRUE)


## NOW with the newest test set we can redo all of the stuff from above and see if it makes a # difference
# library(nlme)
# Mtest.gls <- gls(IncW_trans~ IncNum+ YrIncForm, method="REML", test=test_wkdf, na.action=na.omit)
# Mtest.lme <- lme(IncW_trans ~ IncNum + YrIncForm, random= ~1|Fish.ID, method="REML", test=test_wkdf, na.action=na.omit)
# Mtest2.lme <- lme(IncW_trans ~IncNum + YrIncForm, random= list(~1|Fish.ID, ~1|CatchYr), method="REML", test=test_wkdf, na.action=na.omit)
# AIC(Mtest.gls, Mtest.lme, Mtest2.lme)


########
Form= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc + MSLA_zc + WSC_zc) # Av.Dis_zc 

## now we look at the optimal model in terms of the explanatory variables. We could examine the Mfull.lme and drop the least significant terms and reapply the model however the preferred option is the likelihood ratio test. We need to fit the same model again but now with ML. Using the likelihood ratio test, the significance of the dropped term is determined. page 135

library(nlme)



Mfull2.lme_test <- lme(Form, random=~1|Fish.ID, method="ML", test=test_wkdf_new, na.action=na.omit)
#M1.A <- update(Mfull2.lme, .~. - Av.Dis_zc)
M1.B_test <- update(Mfull2.lme_test, .~. - Uwind_zc)
M1.C_test <- update(Mfull2.lme_test, .~. - Vwind_zc)
M1.D_test <- update(Mfull2.lme_test, .~. - MSLA_zc)
M1.E_test <- update(Mfull2.lme_test, .~. - WSC_zc)
anova(Mfull2.lme_test, M1.A_test)

           # Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                         
# M1.A           2  9 -1610.481 -1574.740 814.2407 1 vs 2 0.8686669  0.3513



anova(Mfull2.lme_test, M1.B_test)

           # Model df       AIC       BIC   logLik   Test L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                       
# M1.B           2  9 -1606.661 -1570.920 812.3307 1 vs 2  4.6887  0.0304

anova(Mfull2.lme_test, M1.C_test)

           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                        
# M1.C           2  9 -1601.682 -1565.941 809.8412 1 vs 2 9.667691  0.0019

anova(Mfull2.lme, M1.D_test)

           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.lme     1 10 -1609.350 -1569.637 814.6750                        
# M1.D           2  9 -1609.768 -1574.027 813.8841 1 vs 2 1.581848  0.2085



anova(Mfull2.lme_test, M1.E_test)

summary(Mfull2.lme_test)


## So, it seems that Av.Dis_zc and MSLA are not significant so we will omit them from the model. Now, we will refit the model with U and V winds.

Form2= formula(IncW_trans~ IncNum + Yr.Inc.Form + Uwind_zc + Vwind_zc)
Mfull3.lme_test <- lme(Form2, random=~1|Fish.ID, method="ML", test=test_wkdf_new, na.action=na.omit)

M2.A_test <- update(Mfull3.lme_test, .~. -Uwind_zc)
M2.B_test <- update(Mfull3.lme_test, .~. -Vwind_zc)

anova (Mfull3.lme_test, M2.A_test)
anova(Mfull3.lme_test, M2.B_test)

# > anova (Mfull3.lme, M2.A)
           # Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull3.lme     1  7 -2828.828 -2797.215 1421.414                         
# M2.A           2  6 -2830.255 -2803.158 1421.128 1 vs 2 0.5725261  0.4493
# > anova(Mfull3.lme, M2.B)
           # Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.lme     1  7 -2828.828 -2797.215 1421.414                        
# M2.B           2  6 -2793.584 -2766.487 1402.792 1 vs 2 37.24386  <.0001



## Now, we need to refit with REML and then Validate the Model page=138

Mfinal_test <- lme(IncW_trans ~ IncNum + Yr.Inc.Form + Vwind_zc, random=~1|Fish.ID, method="REML", test=test_wkdf_new, na.action=na.omit)

summary(Mfinal_test)

> summary(Mfinal_test)
# Linear mixed-effects model fit by REML
 # test: test_wkdf 
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
op <- par(mfrow= c(4,2), mar=c(5,4,1,2))
plot(Mfinal_test)
E_test <- rstandard(Mfinal_test)
hist(E_test)
qqnorm(E_test)
F_test <- fitted(Mfinal_test)
MyYlab <- "residuals"
plot(x=F_test, y=E_test, xlab="fitted values", ylab= MyYlab)
plot(test_wkdf_new$IncNum, y = E_test, xlab= "IncNum", ylab=MyYlab)
plot(E_test ~ test_wkdf_new$YrIncForm, xlab="Yr Inc Form", ylab="Residuals")
plot(test_wkdf_new$IncW_trans, E_test, xlab="IncW_trans", ylab="Residuals")
plot(test_wkdf_new$Vwind_zc, E_test, xlab= "Vwinds", ylab="Residuals")
par(op)

