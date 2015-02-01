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



data_wk$fYr.Inc.Form= factor(data_wk$Year.of.Increment.Formation)


## find ultimate transform and them find equation best describing the fit so I can apply contrast coding scheme to it
library(MASS)
b <- boxcox(lm(Biological.Intercept ~ Increment.Number, data=data_wk), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]


library(nlme)
## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(Biological.Intercept^(.949)~ Increment.Number+ fYr.Inc.Form, method="REML", data=data_wk, na.action=na.omit)
Mtest.lme <- lme(Biological.Intercept^(.949) ~ Increment.Number + fYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wk, na.action=na.omit)
Mtest2.lme <- lme(Biological.Intercept^(.949) ~Increment.Number + fYr.Inc.Form, random= list(~1|Fish.ID, ~1|Catch.Year), method="REML", data=data_wk, na.action=na.omit)
AIC(Mtest.gls, Mtest.lme, Mtest2.lme)

           # df      AIC
# Mtest.gls   9 3630.464
# Mtest.lme  10 2504.986
# Mtest2.lme 11 2506.986

# > 
 anova(Mtest.gls, Mtest.lme)
          # Model df      AIC      BIC    logLik   Test  L.Ratio p-value
# Mtest.gls     1  9 3630.464 3671.030 -1806.232                        
# Mtest.lme     2 10 2504.986 2550.059 -1242.493 1 vs 2 1127.478  <.0001



## FORWARD DIFFERENCE CODING TO ASSESS SIGNIFICANCE IN INCREMENT WIDTH BY CATEGORICAL YEARS ##	

## seperate by increment number


idx3 <- data_wk$Increment.Number==3 
idx4<- data_wk$Increment.Number==4 
idx5 <- data_wk$Increment.Number ==5 
idx6 <- data_wk$Increment.Number ==6 
idx7 <- data_wk$Increment.Number==7


data_wk_3 <- data_wk[idx3,]
data_wk_4 <- data_wk[idx4,]
data_wk_5 <- data_wk[idx5,]
data_wk_6 <- data_wk[idx6,]
data_wk_7 <- data_wk[idx7,]

## must refactor the years
data_wk_3$fYr.Inc.Form <- factor(data_wk_3$fYr.Inc.Form)
data_wk_4$fYr.Inc.Form <- factor(data_wk_4$fYr.Inc.Form)
data_wk_5$fYr.Inc.Form <- factor(data_wk_5$fYr.Inc.Form)
data_wk_6$fYr.Inc.Form <- factor(data_wk_6$fYr.Inc.Form)
data_wk_7$fYr.Inc.Form <- factor(data_wk_7$fYr.Inc.Form)


## FORWARD DIFFERENCE CODING ## compares adjacent levels of a variable (each level minus the next level)

 my.forward.diff= matrix(c(5/6,-1/6,-1/6,-1/6,-1/6,-1/6,4/6,4/6,-2/6,-2/6,-2/6,-2/6,3/6,3/6,3/6,-3/6,-3/6,-3/6,2/6,2/6,2/6,2/6,-4/6,-4/6,1/6,1/6,1/6,1/6,1/6,-5/6), ncol=5)
contrasts(data_wk_3$fYr.Inc.Form)=my.forward.diff
lmFD2plus <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_3, method="REML")
summary(lmFD2plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_3 
       # AIC      BIC    logLik
  # 1036.062 1061.737 -510.0308

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    3.490736 1.309026

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error  DF   t-value p-value
# (Intercept)   42.21434 0.3644746 183 115.82244  0.0000
# fYr.Inc.Form1 -2.40225 1.0626743 183  -2.26058  0.0250
# fYr.Inc.Form2  0.96400 0.7937851 183   1.21444  0.2261
# fYr.Inc.Form3  1.96940 0.7204063 183   2.73374  0.0069
# fYr.Inc.Form4  1.33651 1.0680840 183   1.25132  0.2124
# fYr.Inc.Form5  3.24006 1.7703222 183   1.83021  0.0688
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1  0.112                                
# fYr.Inc.Form2  0.137 -0.515                         
# fYr.Inc.Form3 -0.081  0.000  -0.342                 
# fYr.Inc.Form4 -0.212  0.000   0.000  -0.420         
# fYr.Inc.Form5 -0.387  0.000   0.000   0.000  -0.432 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.95718993 -0.20156416 -0.01036373  0.22193648  1.12364132 

# Number of Observations: 189
# Number of Groups: 189 
> 


my.forward.diff= matrix(c(5/6,-1/6,-1/6,-1/6,-1/6,-1/6,4/6,4/6,-2/6,-2/6,-2/6,-2/6,3/6,3/6,3/6,-3/6,-3/6,-3/6,2/6,2/6,2/6,2/6,-4/6,-4/6,1/6,1/6,1/6,1/6,1/6,-5/6), ncol=5)
 contrasts(data_wk_4$fYr.Inc.Form)=my.forward.diff
lmFD3plus <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmFD3plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_4 
      # AIC      BIC    logLik
  # 1045.69 1071.009 -514.8452

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    4.078057 1.529271

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error  DF  t-value p-value
# (Intercept)   47.88057 0.5310735 175 90.15810  0.0000
# fYr.Inc.Form1 -2.25953 1.2414704 175 -1.82004  0.0705
# fYr.Inc.Form2  0.79522 0.9273403 175  0.85753  0.3923
# fYr.Inc.Form3  3.13119 0.8416155 175  3.72046  0.0003
# fYr.Inc.Form4  0.25019 1.4219397 175  0.17595  0.8605
# fYr.Inc.Form5  6.61591 2.8113768 175  2.35326  0.0197
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1  0.090                                
# fYr.Inc.Form2  0.110 -0.515                         
# fYr.Inc.Form3 -0.065  0.000  -0.342                 
# fYr.Inc.Form4 -0.252  0.000   0.000  -0.369         
# fYr.Inc.Form5 -0.529  0.000   0.000   0.000  -0.395 

# Standardized Within-Group Residuals:
         # Min           Q1          Med           Q3          Max 
# -0.986493983 -0.216730878 -0.005257616  0.241117337  0.900551685 

# Number of Observations: 181
# Number of Groups: 181 


my.forward.diff= matrix(c(4/5,-1/5,-1/5,-1/5,-1/5, 3/5,3/5,-2/5,-2/5,-2/5,2/5,2/5,2/5,-3/5,-3/5,1/5,1/5,1/5,1/5,-4/5), ncol=4)
contrasts(data_wk_5$fYr.Inc.Form)=my.forward.diff
 lmFD4plus <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_5, method="REML")
 summary(lmFD4plus)
 
# Linear mixed-effects model fit by REML
 # Data: data_wk_5 
       # AIC      BIC    logLik
  # 917.3735 938.4945 -451.6868

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    4.294778 1.610542

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error  DF  t-value p-value
# (Intercept)   55.60580  0.726743 151 76.51367  0.0000
# fYr.Inc.Form1 -2.96727  1.307446 151 -2.26952  0.0247
# fYr.Inc.Form2  1.79451  0.976622 151  1.83747  0.0681
# fYr.Inc.Form3  2.91225  0.987421 151  2.94935  0.0037
# fYr.Inc.Form4 -3.72346  3.346365 151 -1.11269  0.2676
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3
# fYr.Inc.Form1  0.083                        
# fYr.Inc.Form2  0.102 -0.515                 
# fYr.Inc.Form3 -0.107  0.000  -0.307         
# fYr.Inc.Form4 -0.809  0.000   0.000  -0.205 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.99903671 -0.18138487 -0.01003678  0.25248261  0.86290177 

# Number of Observations: 156
# Number of Groups: 156 


my.forward.diff= matrix(c(3/4,-1/4,-1/4,-1/4,1/2,1/2,-1/2,-1/2,1/4,1/4,1/4,-3/4), ncol=3)
contrasts(data_wk_6$fYr.Inc.Form)=my.forward.diff
lmFD5plus <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_6, method="REML")
summary(lmFD5plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_6 
      # AIC      BIC    logLik
  # 620.943 636.6338 -304.4715

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    4.339836 1.627439

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error  DF   t-value p-value
# (Intercept)   60.08161 0.5240076 101 114.65788  0.0000
# fYr.Inc.Form1 -2.29165 1.3211632 101  -1.73457  0.0859
# fYr.Inc.Form2  2.27936 1.0820970 101   2.10643  0.0376
# fYr.Inc.Form3  2.42250 1.6272283 101   1.48873  0.1397
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2
# fYr.Inc.Form1  0.145                
# fYr.Inc.Form2  0.076 -0.470         
# fYr.Inc.Form3 -0.483  0.000  -0.284 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -1.00752355 -0.21690639 -0.02909121  0.22536324  0.95916343 

# Number of Observations: 105
# Number of Groups: 105 
# # Number of Groups: 105


my.forward.diff= matrix(c(2/3,-1/3,-1/3,1/3,1/3,-2/3), ncol=2)
contrasts(data_wk_7$fYr.Inc.Form)=my.forward.diff
lmFD6plus <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_7, method="REML")
summary(lmFD6plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_7 
       # AIC      BIC    logLik
  # 289.9688 298.8898 -139.9844

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    4.974542 1.865453

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error DF  t-value p-value
# (Intercept)   64.43349 0.8092691 44 79.61936  0.0000
# fYr.Inc.Form1 -0.47160 1.7526125 44 -0.26908  0.7891
# fYr.Inc.Form2  0.37441 2.1172977 44  0.17683  0.8605
 # Correlation: 
              # (Intr) fY.I.F1
# fYr.Inc.Form1 -0.059        
# fYr.Inc.Form2 -0.226 -0.447 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.86673166 -0.21067722 -0.04728691  0.19641401  0.90289865 

# Number of Observations: 47
# Number of Groups: 47 


##DEVIATION CODING ### compares the mean of the dependent variable for a given level to the overall mean of the dependent variable


contrasts(data_wk_3$fYr.Inc.Form)=contr.sum(6)
lmFD3 <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_3, method="REML")
summary(lmFD3)

# Linear mixed-effects model fit by REML
 # Data: data_wk_3 
       # AIC      BIC    logLik
  # 1039.645 1065.321 -511.8225

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    3.490736 1.309026

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error  DF   t-value p-value
# (Intercept)   42.21434 0.3644746 183 115.82244  0.0000
# fYr.Inc.Form1  0.61101 0.7720976 183   0.79136  0.4298
# fYr.Inc.Form2  3.01326 0.6499229 183   4.63634  0.0000
# fYr.Inc.Form3  2.04926 0.5131733 183   3.99331  0.0001
# fYr.Inc.Form4  0.07985 0.5901922 183   0.13530  0.8925
# fYr.Inc.Form5 -1.25666 0.8233421 183  -1.52629  0.1287
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1 -0.060                                
# fYr.Inc.Form2 -0.255 -0.110                         
# fYr.Inc.Form3 -0.536 -0.039   0.083                 
# fYr.Inc.Form4 -0.367 -0.081   0.017   0.153         
# fYr.Inc.Form5  0.011 -0.188  -0.142  -0.085  -0.118 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.95718993 -0.20156416 -0.01036373  0.22193648  1.12364132 

# Number of Observations: 189
# Number of Groups: 189 

contrasts(data_wk_4$fYr.Inc.Form)=contr.sum(6)
lmFD4 <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmFD4)

# Linear mixed-effects model fit by REML
 # Data: data_wk_4 
       # AIC      BIC   logLik
  # 1049.274 1074.592 -516.637

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept) Residual
# StdDev:    4.078057 1.529271

# Fixed effects: Biological.Intercept ~ fYr.Inc.Form 
                 # Value Std.Error  DF  t-value p-value
# (Intercept)   47.88057 0.5310735 175 90.15810  0.0000
# fYr.Inc.Form1  1.39885 0.9562145 175  1.46291  0.1453
# fYr.Inc.Form2  3.65838 0.8229405 175  4.44550  0.0000
# fYr.Inc.Form3  2.86316 0.6783463 175  4.22079  0.0000
# fYr.Inc.Form4 -0.26803 0.7590358 175 -0.35313  0.7244
# fYr.Inc.Form5 -0.51823 1.1558046 175 -0.44837  0.6544
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1 -0.244                                
# fYr.Inc.Form2 -0.419  0.032                         
# fYr.Inc.Form3 -0.659  0.122   0.248                 
# fYr.Inc.Form4 -0.517  0.069   0.176   0.318         
# fYr.Inc.Form5 -0.030 -0.126  -0.084  -0.033  -0.063 

# Standardized Within-Group Residuals:
         # Min           Q1          Med           Q3          Max 
# -0.986493983 -0.216730878 -0.005257616  0.241117337  0.900551685 

# Number of Observations: 181
# Number of Groups: 181 

contrasts(data_wk_5$fYr.Inc.Form)=my.forward.diff
 lmFD5 <-lme(Biological.Intercept ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_5, method="REML")
 summary(lmFD5)
 