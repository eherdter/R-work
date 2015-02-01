# http://www.inside-r.org/packages/cran/fishmethods/docs/vblrt

#Likelihood ratio tests for comparing two vonB growth curves
# vblrt(length, age, group= , error=1, select=2,Linf=80, K=.20, t0=-.18,plottype=0)


# Following Kimura (1980), the general model (6 parameters; one L-infinity, K, and t0 for each group) and four sub models are fitted to the length and age data using function nls (nonlinear least squares). For each general model-sub model comparison, likelihood ratios are calculated by using the residual sum-of-squares and are tested against chi-square statistics with the appropriate degrees of freedom. Individual observations of lengths-at-age are required. If error variance assumptions 2 or 3, mean lengths and required statistics are calculated. A dummy vector called cat, containing 0s for the first group with lower alpha-numeric order and 1s for the second group, is used in the estimation of group parameters. To extract the VB parameters for each group from the Ho model: # Group 1 Linf1<-outpt$'model Ho'$coefficients[1]         K1<-outpt$'model Ho'$coefficients[3]         t01<-outpt$'model Ho'$coefficients[5]
# # Group 2         Linf2<-Linf1+outpt$'model Ho'$coefficients[2]         K2<-K1+outpt$'model Ho'$coefficients[4]         t02<-t01+outpt$'model Ho'$coefficients[6]      where outpt is the output object. For models H1, H2, H3 and H4, the shared VB parameter for the second group will be the same as the first group.

# #Group 1
# Linf <- outpt$'model Ho'$coefficients[1]
# K <- outpt$'modelHo'$coefficents[3]
# t01 <-outpt$'modelHo'$coefficients[5]

# #Group 2

# Linf2<-Linf1+outpt$'modelHo'$coefficients[2]
# K2<-K1+outpt$'modelHo'$coefficients[4]
# t02 <-t01 +outpt$'modelHo'$coefficients[6]

mydata2011 = read.csv('2011_Age_length.csv', header=TRUE)
mydata2012 =read.csv('2012_Age_length.csv', header=TRUE)
mydata2013 =read.csv('2013_Age_length.csv', header=TRUE)

mydata_full_11_12=rbind(mydata2011, mydata2012)

library(fishmethods)
outpt_11_12<- vblrt(mydata_full_11_12$Fork.Length..cm, mydata_full_11_12$Fractional.Age, group=mydata_full_11_12$Year, error=1, select=2,Linf=80, K=.20, t0=-.18, plottype=0)

outpt_11_12$results

     # tests                hypothesis chisq df     p
# 1 Ho vs H1               Linf1=Linf2  1.29  1 0.256
# 2 Ho vs H2                     K1=K2  0.20  1 0.655
# 3 Ho vs H3                   t01=t02  3.69  1 0.055
# 4 Ho vs H4 Linf1=Linf2,K1=K2,t01=t02 12.08  3 0.007

## so for each, Ho is the general model and then H1 is the submodel model but when Linf1 and Linf2 are set equal to eachother
## H2 is submodel when k1 and k2 are set equal to each other then compared to the general model(H0)

library(xtable)
latex_11_13 <- xtable(outpt_11_12$results, floating=FALSE)




mydata_full_12_13 = data.frame(rbind(mydata2012, mydata2013))

outpt_12_13<- vblrt(mydata_full_12_13$Fork.Length..cm, mydata_full_12_13$Fractional.Age, group=mydata_full_12_13$Year, error=1, select=2, Linf=70, K=.23, t0=1, plottype=0)

latex_12_13 <-xtable(outpt_12_13$results, floating=FALSE)





mydata_full_11_13 = rbind(mydata2011, mydata2013)

outpt_11_13<- vblrt(mydata_full_11_13$Fork.Length..cm, mydata_full_11_13$Fractional.Age, group=mydata_full_11_13$Year, error=1, select=2, Linf=80, K=.23, t0=1, plottype=0)

latex_11_13 <- xtable(outpt_11_13$results, floating=FALSE)


### KIMURA TESTING WITH BACK CALCULATED BEFORE GROWTH CURVES compared to ones estimated from obtained data
inc_data <- read.csv("BC_12_16.csv", header=TRUE, sep=",")

data_back= data.frame(cbind(inc_data$Increment.Number, inc_data$Biological.Intercept, inc_data$Year.of.Increment.Formation))  #making a data set of the back calculated fork lengths

idx_after = data_back$X3 >= 2010
idx_before= data_back$X3 < 2010

code= rep("Before", 733)
before = data.frame(cbind((data_back[idx_before,]), code))

colnames(before)<- c("Age", "Back_Calc_FL", "Year", "Code")

code= rep("After", 520 )
after = data.frame(cbind(data_back[idx_after,]), code)
colnames(after) <- c("Age", "Back_Calc_FL", "Year", "Code")

p1 = 80
p2 = .18
p3= 0


fit_before = nls(Back_Calc_FL ~ p1*(1-exp(-p2*(Age-p3))), start=list(p1=p1, p2=p2,p3=p3), data=before) #estimate fit of the three parameters in the Von B equation from back calculated length estimates before 2010
fit_after = nls(Back_Calc_FL ~ p1*(1-exp(-p2*(Age-p3))), start=list(p1=p1, p2=p2,p3=p3), data=after) #estimate fit of the three parameters in the Von B equation from back calculated length estimates in and after 2010)

