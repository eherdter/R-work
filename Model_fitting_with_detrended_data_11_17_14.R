data= read.csv("BC_11_17_14.csv", header=TRUE)

#after performing detrending, the data were then placed into the csv as a new column of detrended increment widths

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

Detrended <- data_wk$R.Detrended

U_winds= cbind(data_wk$nJune.U, data_wk$nJuly.U, data_wk$nAugust.U, data_wk$nSeptember.U, data_wk$nOctober.U, data_wk$nNovember.U, data_wk$nDecember.U)

U_wind_median = apply(U_winds,1,median)

V_winds= cbind(data_wk$nJune.V, data_wk$nJuly.V, data_wk$nAugust.V, data_wk$nSeptember.V, data_wk$nOctober.V, data_wk$nNovember.V, data_wk$nDecember.V)

V_wind_median= apply(V_winds,1,median)

MSLA = cbind(data_wk$nJune.MSLA, data_wk$nJuly.MSLA,data_wk$nAugust.MSLA,data_wk$nSeptember.MSLA,data_wk$nOctober.MSLA,data_wk$nNovember.MSLA,data_wk$nDecember.MSLA)

MSLA_median=apply(MSLA, 1, median)

WSC = cbind(data_wk$nJune.WSC, data_wk$nJuly.WSC,data_wk$nAugust.WSC,data_wk$nSeptember.WSC,data_wk$nOctober.WSC,data_wk$nNovember.WSC,data_wk$nDecember.WSC)

WSC_median=apply(WSC,1,median)


data_wk1=cbind(Detrended, data_wk$Year.of.Increment.Formation, U_wind_median, V_wind_median, Av.Dis, MSLA_median,WSC_median, CatchYr, Fish.ID)

colnames(data_wk1) = c("Detrended", "Yr.Inc.Form", "Uwind", "Vwind", "Av.Dis", "MSLA", "WSC","CatchYr", "Fish")

data_wkdf = data.frame(data_wk1)

data_wkdf$fYr.Inc.Form= factor(data_wkdf$Yr.Inc.Form)

## zero center environmental variables

data_wkdf$Av.Dis_zc <- data_wkdf$Av.Dis - mean(data_wkdf$Av.Dis, na.rm=TRUE)

data_wkdf$Uwind_zc <- data_wkdf$Uwind - mean(data_wkdf$Uwind, na.rm=TRUE)

data_wkdf$Vwind_zc <- data_wkdf$Vwind - mean(data_wkdf$Vwind, na.rm=TRUE)

data_wkdf$MSLA_zc <- data_wkdf$MSLA -mean(data_wkdf$MSLA, na.rm=TRUE)

data_wkdf$WSC_zc <- data_wkdf$WSC - mean(data_wkdf$WSC, na.rm=TRUE)

op <- par(mfrow=c(5,2))
op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
plot(data_wkdf$Detrended ~ data_wkdf$fYr.Inc.Form)
plot(data_wkdf$Detrended ~ data_wkdf$WSC_zc)
plot(data_wkdf$Detrended ~ data_wkdf$MSLA_zc)
plot(data_wkdf$Detrended ~ data_wkdf$Vwind_zc)
plot(data_wkdf$Detrended ~ data_wkdf$Uwind_zc)
plot(data_wkdf$Detrended ~ data_wkdf$Av.Dis_zc)
par(op)





library(nlme)

data_wkdf <- data_wkdf[complete.cases(data_wkdf$Vwind_zc, data_wkdf$Av.Dis_zc),]   ## removing NA present in v wind
data_wkdf_sm <-  data_wkdf[complete.cases(data_wkdf$WSC_zc),]  ### removing NA present in wsc



Form <- formula(Detrended ~ Yr.Inc.Form + MSLA_zc + Vwind_zc + Uwind_zc + Av.Dis_zc + WSC_zc)

Mtest.gls <- gls(Form, method="REML", data=data_wkdf_sm, na.action=na.omit)
Mtest.lme <- lme(Form, random= ~1|Fish, method="REML", data=data_wkdf_sm, na.action=na.omit)
Mtest2.lme <- lme(Form, random= list(~1|Fish, ~1|CatchYr), method="REML", data=data_wkdf_sm, na.action=na.omit)
AIC(Mtest.gls, Mtest.lme, Mtest2.lme)

anova(Mtest.gls, Mtest.lme)

# df       AIC
# Mtest.gls   7 -701.5242
# Mtest.lme   8 -699.5242
# Mtest2.lme  9 -697.5242

F2 <- fitted(Mtest.gls) ### page 134
E <-resid(Mtest.gls, type = 'normalized')
op <- par(mfrow= c(5,2), mar=c(5,4,1,2))
MyYlab <- "residuals"
plot(x=F2, y=E, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf_sm$MSLA_zc, E, xlab="MSLA", ylab="Residuals")
plot(data_wkdf_sm$Vwind_zc, E, xlab= "Vwind", ylab= "Residuals")
plot(data_wkdf_sm$Uwind_zc, E, xlab= "Uwind", ylab= "Residuals")
plot(data_wkdf_sm$WSC_zc, E, xlab= "WSC", ylab= "Residuals")
par(op)


Form <- formula(Detrended ~ Yr.Inc.Form + MSLA_zc + Vwind_zc + Uwind_zc + Av.Dis_zc + WSC_zc)


Mfull2.gls <- gls(Form, method="ML", data=data_wkdf_sm, na.action=na.omit)
summary(Mfull2.gls)
M1.A <- update(Mfull2.gls, .~. - Av.Dis_zc)
M1.B <- update(Mfull2.gls, .~. - Uwind_zc)
M1.C <- update(Mfull2.gls, .~. - Vwind_zc)
M1.D <- update(Mfull2.gls, .~. - MSLA_zc)
M1.E <- update(Mfull2.gls, .~. - WSC_zc)

anova(Mfull2.gls, M1.A)
# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.gls     1  8 -796.5061 -760.8143 406.2530                        
# M1.A           2  7 -796.2714 -765.0411 405.1357 1 vs 2 2.234703  0.1349

anova(Mfull2.gls, M1.B)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.gls     1  8 -796.5061 -760.8143 406.2530                        
# M1.B           2  7 -794.2005 -762.9702 404.1002 1 vs 2 4.305593   0.038


anova(Mfull2.gls, M1.C)

# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.gls     1  8 -796.5061 -760.8143 406.2530                         
# M1.C           2  7 -797.8816 -766.6513 405.9408 1 vs 2 0.6244578  0.4294

anova(Mfull2.gls, M1.D)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull2.gls     1  8 -796.5061 -760.8143 406.2530                        
# M1.D           2  7 -792.9067 -761.6764 403.4533 1 vs 2 5.599403   0.018

anova(Mfull2.gls, M1.E)

# Model df       AIC       BIC   logLik   Test   L.Ratio p-value
# Mfull2.gls     1  8 -796.5061 -760.8143 406.2530                         
# M1.E           2  7 -798.1728 -766.9426 406.0864 1 vs 2 0.3332476  0.5638


Form2= formula(Detrended ~ Yr.Inc.Form + Uwind_zc + MSLA_zc)
Mfull3.gls <- gls(Form2, method="ML", data=data_wkdf_sm, na.action=na.omit)

M2.A <- update(Mfull3.gls, .~. -Uwind_zc)
M2.B <- update(Mfull3.gls, .~. -MSLA_zc)

anova (Mfull3.gls, M2.A)

# Model df       AIC       BIC   logLik   Test  L.Ratio p-value
# Mfull3.gls     1  5 -799.8148 -777.5075 404.9074                        
# M2.A           2  4 -796.5839 -778.7380 402.2919 1 vs 2 5.230955  0.0222


anova(Mfull3.gls, M2.B)

# Model df       AIC       BIC   logLik   Test L.Ratio p-value
# Mfull3.gls     1  5 -799.8148 -777.5075 404.9074                       
# M2.B           2  4 -795.2297 -777.3839 401.6149 1 vs 2  6.5851  0.0103

Mfinal <- gls(Detrended ~ Yr.Inc.Form + Uwind_zc + MSLA_zc, method="REML", data=data_wkdf_sm, na.action=na.omit)


summary(Mfinal)

op <- par(mfrow= c(6,2), mar=c(6,4,1,2))
ModelResiduals <- resid(Mfinal)
hist(ModelResiduals)
qqnorm(ModelResiduals)
F3 <- fitted(Mfinal)
MyYlab <- "residuals"
plot(x=F3, y=ModelResiduals, xlab="fitted values", ylab= MyYlab)
plot(data_wkdf_sm$Detrended, y = ModelResiduals, xlab= "Detrended", ylab=MyYlab)
plot(ModelResiduals ~ data_wkdf_sm$Yr.Inc.Form, xlab="Yr Inc Form", ylab="Residuals")
plot(data_wkdf_sm$Uwind_zc, ModelResiduals, xlab= "Uwinds", ylab="Residuals")
plot(data_wkdf_sm$MSLA_zc, ModelResiduals, xlab= "MSLA", ylab="Residuals")
par(op)


plot(Detrended ~ Uwind_zc, data=data_wkdf_sm)

