
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

library(MASS)
b <- boxcox(lm(Back.Calculated.Weight..W.aL.b. ~ Increment.Number, data=data_wk), lambda=seq(-2,2,by=.1))
lambda=b$x
like=b$y
c=cbind(lambda, like)
c[order(-like),]


library(nlme)
## NOW with the newest data set we can redo all of the stuff from above and see if it makes a difference
Mtest.gls <- gls(Back.Calculated.Weight..W.aL.b.^(.303)~ Increment.Number+ fYr.Inc.Form, method="REML", data=data_wk, na.action=na.omit)
Mtest.lme <- lme(Back.Calculated.Weight..W.aL.b.^(.303) ~ Increment.Number + fYr.Inc.Form, random= ~1|Fish.ID, method="REML", data=data_wk, na.action=na.omit)
Mtest2.lme <- lme(Back.Calculated.Weight..W.aL.b.^(.303) ~Increment.Number + fYr.Inc.Form, random= list(~1|Fish.ID, ~1|Catch.Year), method="REML", data=data_wk, na.action=na.omit)
AIC(Mtest.gls, Mtest.lme, Mtest2.lme)

 anova(Mtest.gls, Mtest.lme)
           # Model df       AIC       BIC    logLik   Test  L.Ratio p-value
# Mtest.gls     1  9 -1104.189 -1063.623  561.0943                        
# Mtest.lme     2 10 -2235.553 -2190.480 1127.7764 1 vs 2 1133.364  <.0001

 
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


### 3rd INCREMENT


 my.forward.diff= matrix(c(5/6,-1/6,-1/6,-1/6,-1/6,-1/6,4/6,4/6,-2/6,-2/6,-2/6,-2/6,3/6,3/6,3/6,-3/6,-3/6,-3/6,2/6,2/6,2/6,2/6,-4/6,-4/6,1/6,1/6,1/6,1/6,1/6,-5/6), ncol=5)
contrasts(data_wk_3$fYr.Inc.Form)=my.forward.diff
lmFD2plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_3, method="REML")
summary(lmFD2plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_3 
       # AIC      BIC    logLik
  # 183.1658 208.8417 -83.58288

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)  Residual
# StdDev:   0.3395264 0.1273224

# Fixed effects: Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form 
                   # Value  Std.Error  DF  t-value p-value
# (Intercept)    1.3361307 0.03545061 183 37.68992  0.0000
# fYr.Inc.Form1 -0.2339375 0.10336099 183 -2.26331  0.0248
# fYr.Inc.Form2  0.1010431 0.07720749 183  1.30872  0.1923
# fYr.Inc.Form3  0.1775106 0.07007030 183  2.53332  0.0121
# fYr.Inc.Form4  0.1166484 0.10388717 183  1.12284  0.2630
# fYr.Inc.Form5  0.2599020 0.17219034 183  1.50939  0.1329
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1  0.112                                
# fYr.Inc.Form2  0.137 -0.515                         
# fYr.Inc.Form3 -0.081  0.000  -0.342                 
# fYr.Inc.Form4 -0.212  0.000   0.000  -0.420         
# fYr.Inc.Form5 -0.387  0.000   0.000   0.000  -0.432 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.77797737 -0.23471313 -0.04105093  0.19134371  1.27019619 

# Number of Observations: 189
# Number of Groups: 189 

## REVERSE HELMERT CODING - 3rd Increment

my.rev.helmert = matrix(c(-1/2, 1/2, 0,0,0,0, -1/3,-1/3,2/3,0,0,0,-1/4,-1/4,-1/4,3/4,0,0,-1/5,-1/5,-1/5,-1/5,4/5,0, -1/5, -1/5, -1/5, -1/5, 0, 4/5), ncol=5)
contrasts(data_wk_3$fYr.Inc.Form)=my.rev.helmert
lmRH2plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_3, method="REML")
summary(lmRH2plus)

# fYr.Inc.Form1  0.2339375 0.10336099 183  2.26331  0.0248
# fYr.Inc.Form2  0.0159256 0.06725201 183  0.23681  0.8131
# fYr.Inc.Form3 -0.1668936 0.06671368 183 -2.50164  0.0132
# fYr.Inc.Form4 -0.1473693 0.10010294 183 -1.47218  0.1427
# fYr.Inc.Form5 -0.4722467 0.15745362 183 -2.99927  0.0031



## USER DEFINED CODING
# 1. 2011 to 2009, 2006 ****
# 2. 2011 to 2010, 2008,2006
# 3. 2010 to 2009-2006 ****
# 4. 2006 to 2007, 2009-2011
# 5. 2007 to 2008-2011

mat = matrix(c(1/6,1/6,1/6,1/6,1/6,1/6, -1/4,-1/4, -1/4, -1/4, 0,1, -1/4,-1/4,-1/4,0,-1/4,1,-1/4,-1/4, -1/4, -1/4,1,0,1, -1/4, 0, -1/4, -1/4,-1/4,0,1,-1/4, -1/4, -1/4, -1/4), ncol=6)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:6]
contrasts(data_wk_3$fYr.Inc.Form) = my.contrasts
lmUD2plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_3, method="REML")
summary(lmUD2plus)

# fYr.Inc.Form1 -0.5017206 0.15129257 183 -3.31623  0.0011
# fYr.Inc.Form2 -0.4725585 0.15225551 183 -3.10372  0.0022
# fYr.Inc.Form3 -0.2418186 0.09332331 183 -2.59119  0.0103
# fYr.Inc.Form4  0.0982775 0.09420979 183  1.04318  0.2982
# fYr.Inc.Form5  0.3574758 0.07917699 183  4.51490  0.0000


## 4th INCREMENT
my.forward.diff= matrix(c(5/6,-1/6,-1/6,-1/6,-1/6,-1/6,4/6,4/6,-2/6,-2/6,-2/6,-2/6,3/6,3/6,3/6,-3/6,-3/6,-3/6,2/6,2/6,2/6,2/6,-4/6,-4/6,1/6,1/6,1/6,1/6,1/6,-5/6), ncol=5)
 contrasts(data_wk_4$fYr.Inc.Form)=my.forward.diff
lmFD3plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmFD3plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_4 
       # AIC      BIC    logLik
  # 318.0958 343.4141 -151.0479

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)  Residual
# StdDev:    0.510063 0.1912736

# Fixed effects: Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form 
                   # Value Std.Error  DF   t-value p-value
# (Intercept)    1.9576997 0.0664240 175 29.472766  0.0000
# fYr.Inc.Form1 -0.2945000 0.1552769 175 -1.896611  0.0595
# fYr.Inc.Form2  0.1153873 0.1159871 175  0.994829  0.3212
# fYr.Inc.Form3  0.3676941 0.1052651 175  3.493030  0.0006
# fYr.Inc.Form4  0.0285853 0.1778491 175  0.160728  0.8725
# fYr.Inc.Form5  0.6625000 0.3516330 175  1.884067  0.0612
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3 fY.I.F4
# fYr.Inc.Form1  0.090                                
# fYr.Inc.Form2  0.110 -0.515                         
# fYr.Inc.Form3 -0.065  0.000  -0.342                 
# fYr.Inc.Form4 -0.252  0.000   0.000  -0.369         
# fYr.Inc.Form5 -0.529  0.000   0.000   0.000  -0.395 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.77830840 -0.22935658 -0.03598804  0.24357174  0.99531088 

# Number of Observations: 181
# Number of Groups: 181 

## REVERSE HELMERT
my.rev.helmert = matrix(c(-1/2, 1/2, 0,0,0,0, -1/3,-1/3,2/3,0,0,0,-1/4,-1/4,-1/4,3/4,0,0,-1/5,-1/5,-1/5,-1/5,4/5,0, -1/6, -1/6, -1/6, -1/6, -1/6, 5/6), ncol=5)
contrasts(data_wk_4$fYr.Inc.Form)=my.rev.helmert
lmRH3plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmRH3plus)

# fYr.Inc.Form1  0.2945000 0.1552769 175  1.896611  0.0595
# fYr.Inc.Form2  0.0318627 0.1010312 175  0.315375  0.7529
# fYr.Inc.Form3 -0.3464523 0.1002225 175 -3.456832  0.0007
# fYr.Inc.Form4 -0.2884245 0.1640995 175 -1.757620  0.0806
# fYr.Inc.Form5 -0.8932396 0.3182977 175 -2.806302  0.0056


## USER DEFINED
# 1. 2007 to 2008-2012
# 2. 2011 to 2009-2007 **** this is the primary one
# 3. 2012 to 2010-2007
# 4. 2010, 2012 to 2009,2007 
# 5. 2008 to 2010,2012


mat <- matrix(c(1/6,1/6,1/6,1/6,1/6,1/6,1,-1/5,-1/5,-1/5,-1/5,-1/5,-1/3,-1/3,-1/3,0,1,0,-1/4,-1/4,-1/4,-1/4,0,1, -1/3,-1/3,-1/3,1/3,1/3,1/3,0,1,0,-1/3, -1/3, -1/3), ncol=6)
mymat <- solve(t(mat))
my.contrasts <- mymat[,2:6]
contrasts(data_wk_4$fYr.Inc.Form) = my.contrasts
lmUD3plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmUD3plus)

# fYr.Inc.Form1  0.1623604 0.1435183 175  1.131288  0.2595
# fYr.Inc.Form2 -0.3750376 0.1669507 175 -2.246397  0.0259
# fYr.Inc.Form3 -0.9509245 0.3179876 175 -2.990446  0.0032
# fYr.Inc.Form4 -0.5863425 0.1328480 175 -4.413633  0.0000
# fYr.Inc.Form5  0.7229716 0.1542033 175  4.688432  0.0000

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
contrasts(data_wk_4$fYr.Inc.Form) = my.contrasts
lmUD3plusB <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmUD3plusB)

# fYr.Inc.Form1 -1.0375376 0.3194683 175 -3.247701  0.0014
# fYr.Inc.Form2 -0.2884245 0.1640995 175 -1.757620  0.0806
# fYr.Inc.Form3  0.2477287 0.1535456 175  1.613388  0.1085
# fYr.Inc.Form4  0.2765755 0.1525054 175  1.813546  0.0715
# fYr.Inc.Form5  0.5710755 0.1330182 175  4.293214  0.0000



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
contrasts(data_wk_4$fYr.Inc.Form) = my.contrasts
lmUD3plusC <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_4, method="REML")
summary(lmUD3plusC)

# fYr.Inc.Form1 -0.7062876 0.18453951 175 -3.827297  0.0002
# fYr.Inc.Form2 -0.2884245 0.16409946 175 -1.757620  0.0806
# fYr.Inc.Form3  0.2477287 0.15354564 175  1.613388  0.1085
# fYr.Inc.Form4  0.2765755 0.15250540 175  1.813546  0.0715
# fYr.Inc.Form5  0.5710755 0.13301819 175  4.293214  0.0000


## 5th INCREMENT

my.forward.diff= matrix(c(4/5,-1/5,-1/5,-1/5,-1/5, 3/5,3/5,-2/5,-2/5,-2/5,2/5,2/5,2/5,-3/5,-3/5,1/5,1/5,1/5,1/5,-4/5), ncol=4)
contrasts(data_wk_5$fYr.Inc.Form)=my.forward.diff
 lmFD4plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_5, method="REML")
 summary(lmFD4plus)
 
 # Linear mixed-effects model fit by REML
 # Data: data_wk_5 
       # AIC      BIC    logLik
  # 361.3558 382.4767 -173.6779

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)  Residual
# StdDev:   0.6813232 0.2554962

# Fixed effects: Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form 
                   # Value Std.Error  DF   t-value p-value
# (Intercept)    3.0273969 0.1152905 151 26.258857  0.0000
# fYr.Inc.Form1 -0.4980625 0.2074132 151 -2.401306  0.0176
# fYr.Inc.Form2  0.3123019 0.1549313 151  2.015745  0.0456
# fYr.Inc.Form3  0.4515993 0.1566443 151  2.882959  0.0045
# fYr.Inc.Form4 -0.7298387 0.5308671 151 -1.374805  0.1712
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2 fY.I.F3
# fYr.Inc.Form1  0.083                        
# fYr.Inc.Form2  0.102 -0.515                 
# fYr.Inc.Form3 -0.107  0.000  -0.307         
# fYr.Inc.Form4 -0.809  0.000   0.000  -0.205 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.87777417 -0.21103304 -0.03182892  0.22792330  1.02455234 

# Number of Observations: 156
# Number of Groups: 156 
 
## REVERSE HELMERT ###
my.rev.helmert = matrix(c(-1/2, 1/2, 0,0,0, -1/3,-1/3,2/3,0,0,-1/4,-1/4,-1/4,3/4,0,-1/5,-1/5,-1/5,-1/5,4/5), ncol=4)
contrasts(data_wk_5$fYr.Inc.Form)= contr.helmert(5)
lmRH4plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_5, method="REML")
summary(lmRH4plus)

# fYr.Inc.Form1  0.4980625 0.2074132 151  2.401306  0.0176
# fYr.Inc.Form2 -0.0632707 0.1349538 151 -0.468832  0.6399
# fYr.Inc.Form3 -0.4937797 0.1506274 151 -3.278153  0.0013
# fYr.Inc.Form4  0.3595039 0.5186156 151  0.693199  0.4892


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
contrasts(data_wk_5$fYr.Inc.Form)=my.contrasts
lmUD4plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_5, method="REML")
summary(lmUD4plus)

# fYr.Inc.Form1 -0.1499506 0.2849737 151 -0.526191  0.5995
# fYr.Inc.Form2 -0.2204961 0.2135134 151 -1.032704  0.3034
# fYr.Inc.Form3  0.2360590 0.5199504 151  0.454003  0.6505
# fYr.Inc.Form4 -0.5148700 0.1668384 151 -3.086040  0.0024
# 

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
contrasts(data_wk_5$fYr.Inc.Form)=my.contrasts
lmUD4plusB <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_5, method="REML")
summary(lmUD4plusB)

# fYr.Inc.Form1 -0.1499506 0.2849737 151 -0.526191  0.5995
# fYr.Inc.Form2 -0.2204961 0.2135134 151 -1.032704  0.3034
# fYr.Inc.Form3  0.2149688 0.5248761 151  0.409561  0.6827
# fYr.Inc.Form4 -0.1210573 0.2071159 151 -0.584491  0.5598



## 6th INCREMENT

 my.forward.diff= matrix(c(3/4,-1/4,-1/4,-1/4,1/2,1/2,-1/2,-1/2,1/4,1/4,1/4,-3/4), ncol=3)
contrasts(data_wk_6$fYr.Inc.Form)=my.forward.diff
lmFD5plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_6, method="REML")
summary(lmFD5plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_6 
       # AIC      BIC    logLik
  # 286.1034 301.7941 -137.0517

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)  Residual
# StdDev:   0.8271367 0.3101763

# Fixed effects: Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form 
                  # Value Std.Error  DF  t-value p-value
# (Intercept)    3.765682 0.0998715 101 37.70527  0.0000
# fYr.Inc.Form1 -0.461125 0.2518027 101 -1.83129  0.0700
# fYr.Inc.Form2  0.464520 0.2062387 101  2.25234  0.0265
# fYr.Inc.Form3  0.439605 0.3101362 101  1.41746  0.1594
 # Correlation: 
              # (Intr) fY.I.F1 fY.I.F2
# fYr.Inc.Form1  0.145                
# fYr.Inc.Form2  0.076 -0.470         
# fYr.Inc.Form3 -0.483  0.000  -0.284 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.87171488 -0.22203203 -0.05111728  0.20942025  1.10951308 

# Number of Observations: 105
# Number of Groups: 105 


## REVERSE HELMERT ###
my.rev.helmert = matrix(c(-1/2, 1/2, 0,0, -1/3,-1/3,2/3,0,-1/4,-1/4,-1/4,3/4), ncol=3)
contrasts(data_wk_6$fYr.Inc.Form)=my.rev.helmert
lmRH5plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_6, method="REML")
summary(lmRH5plus)


# fYr.Inc.Form1  0.461125 0.2518027 101  1.83129  0.0700
# fYr.Inc.Form2 -0.233958 0.1843886 101 -1.26883  0.2074
# fYr.Inc.Form3 -0.595577 0.2951235 101 -2.01806  0.0462

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
contrasts(data_wk_6$fYr.Inc.Form)= my.contrasts
lmUD5plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_6, method="REML")
summary(lmUD5plus)

# fYr.Inc.Form1  0.223198 0.2511261 101  0.88879  0.3762
# fYr.Inc.Form2 -0.004910 0.2289432 101 -0.02145  0.9829
# fYr.Inc.Form3  0.673562 0.3064108 101  2.19823  0.0302






# 7th INCREMENT

my.forward.diff= matrix(c(2/3,-1/3,-1/3,1/3,1/3,-2/3), ncol=2)
contrasts(data_wk_7$fYr.Inc.Form)=my.forward.diff
lmFD6plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_7, method="REML")
summary(lmFD6plus)

# Linear mixed-effects model fit by REML
 # Data: data_wk_7 
       # AIC      BIC    logLik
  # 155.6689 164.5898 -72.83445

# Random effects:
 # Formula: ~1 | Fish.ID
        # (Intercept)  Residual
# StdDev:    1.081337 0.4055012

# Fixed effects: Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form 
                  # Value Std.Error DF   t-value p-value
# (Intercept)    4.640892 0.1759142 44 26.381572  0.0000
# fYr.Inc.Form1 -0.136676 0.3809726 44 -0.358757  0.7215
# fYr.Inc.Form2  0.104176 0.4602457 44  0.226350  0.8220
 # Correlation: 
              # (Intr) fY.I.F1
# fYr.Inc.Form1 -0.059        
# fYr.Inc.Form2 -0.226 -0.447 

# Standardized Within-Group Residuals:
        # Min          Q1         Med          Q3         Max 
# -0.72092712 -0.21862996 -0.06901657  0.16838325  1.04376154 

# Number of Observations: 47
# Number of Groups: 47 


## REVERSE HELMERT ###

contrasts(data_wk_7$fYr.Inc.Form)= contr.helmert(3)
lmRH6plus <-lme(Back.Calculated.Weight..W.aL.b. ~ fYr.Inc.Form, random=~1|Fish.ID, data=data_wk_7, method="REML")
summary(lmRH6plus)
# fYr.Inc.Form1  0.068338 0.1904863 44  0.358757  0.7215
# fYr.Inc.Form2 -0.011946 0.1372982 44 -0.087008  0.9311

