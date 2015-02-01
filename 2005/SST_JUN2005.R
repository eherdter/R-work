##JUNE 2005 ## 152, count 30
# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJu2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,152), count=c(1,1,30))
meanJu2005_A=mean(tempsJu2005_A)
#28.39167

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJu2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 152), count= c(1,1,30))
meanJu2005_B=mean(tempsJu2005_B)
#28.972

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJu2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 152), count= c(1,1,30))
meanJu2005_C=mean(tempsJu2005_C)
# 28.5243

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJu2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 152), count= c(1,1,30))
meanJu2005_D=mean(tempsJu2005_D)
# 28.34667

# for station 58 ~ 475, 1073
tempsJu2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 152), count= c(1,1,30))
meanJu2005_E=mean(tempsJu2005_E)
#28.622


# for station BR3440, (472, 1103)
tempsJu2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 152), count= c(1,1,30))
meanJu2005_F=mean(tempsJu2005_F)
# 29.08867


#for station PC0610 and PC0620, ~ (478, 1098)
tempsJu2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 152), count= c(1,1,30))
meanJu2005_G=mean(tempsJu2005_G)
#28.5152

# for PC1220, 33, 34, (476,1083)
tempsJu2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 152), count= c(1,1,30))
meanJu2005_H=mean(tempsJu2005_H)
#28.57667

#for PC1320, He265, 37 ~ (474, 1078)
tempsJu2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 152), count= c(1,1,30))
meanJu2005_I=mean(tempsJu2005_I)
#28.35133

# For PC1520 ~ (479, 1087)
tempsJu2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 152), count= c(1,1,30))
meanJu2005_J=mean(tempsJu2005_J)
#28.28

#For PC81460 (479, 1091)
tempsJu2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 152), count= c(1,1,30))
meanJu2005_K=mean(tempsJu2005_K)
#28.42133

# For 15 (476,1101)
tempsJu2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 152), count= c(1,1,30))
meanJu2005_R=mean(tempsJu2005_R)

#For 28 (477, 1086)
tempsJu2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 152), count= c(1,1,30))
meanJu2005_S=mean(tempsJu2005_S)




For #51 (476, 1080)
tempsJu2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 152), count= c(1,1,30))
meanJu2005_P=mean(tempsJu2005_P)


#For 82 (472, 1102)
tempsJu2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 152), count= c(1,1,30))
meanJu2005_N=mean(tempsJu2005_N)


# For BOR0340 (471, 1104)
tempsJu2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 152), count= c(1,1,30))
meanJu2005_L=mean(tempsJu2005_L)


# For PC0910 (480, 1088)
tempsJu2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 152), count= c(1,1,30))
meanJu2005_Y=mean(tempsJu2005_Y)

# For WB16150 (475, 1080)
tempsJu2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 152), count= c(1,1,30))
meanJu2005_O=mean(tempsJu2005_O)


# For WBSL840 (480, 1092)
tempsJu2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 152), count= c(1,1,30))
meanJu2005_AA=mean(tempsJu2005_AA)


meansJu2005= c(meanJu2005_A, meanJu2005_B,meanJu2005_C,meanJu2005_D,meanJu2005_E,meanJu2005_F,meanJu2005_G,meanJu2005_H,meanJu2005_I,meanJu2005_J,meanJu2005_K, meanJu2005_L, meanJu2005_N,meanJu2005_O,meanJu2005_P, meanJu2005_R,meanJu2005_S, meanJu2005_Y,meanJu2005_AA)
