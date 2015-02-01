## AUGUST ## 2005  213, count 31


# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsA2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,213), count=c(1,1,31))
meanA2005_A=mean(tempsA2005_A)


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsA2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 213), count= c(1,1,31))
meanA2005_B=mean(tempsA2005_B)


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsA2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 213), count= c(1,1,31))
meanA2005_C=mean(tempsA2005_C)


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsA2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 213), count= c(1,1,31))
meanA2005_D=mean(tempsA2005_D)


# for station 58 ~ 475, 1073
tempsA2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 213), count= c(1,1,31))
meanA2005_E=mean(tempsA2005_E)



# for station BR3440, (472, 1103)
tempsA2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 213), count= c(1,1,31))
meanA2005_F=mean(tempsA2005_F)



#for station PC0610 and PC0620, ~ (478, 1098)
tempsA2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 213), count= c(1,1,31))
meanA2005_G=mean(tempsA2005_G)


# for PC1220, 33, 34, (476,1083)
tempsA2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 213), count= c(1,1,31))
meanA2005_H=mean(tempsA2005_H)


#for PC1320, He265, 37 ~ (474, 1078)
tempsA2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 213), count= c(1,1,31))
meanA2005_I=mean(tempsA2005_I)


# For PC1520 ~ (479, 1087)
tempsA2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 213), count= c(1,1,31))
meanA2005_J=mean(tempsA2005_J)

#For PC81460 (479, 1091)
tempsA2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 213), count= c(1,1,31))
meanA2005_K=mean(tempsA2005_K)

# For 15 (476,1101)
tempsA2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 213), count= c(1,1,31))
meanA2005_R=mean(tempsA2005_R)

#For 28 (477, 1086)
tempsA2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 213), count= c(1,1,31)
meanA2005_S=mean(tempsA2005_S)



For #51 (476, 1080)
tempsA2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 213), count= c(1,1,31))
meanA2005_P=mean(tempsA2005_P)


#For 82 (472, 1102)
tempsA2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 213), count= c(1,1,31))
meanA2005_N=mean(tempsA2005_N)


# For BOR0340 (471, 1104)
tempsA2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 213), count= c(1,1,31))
meanA2005_L=mean(tempsA2005_L)


# For PC0910 (480, 1088)
tempsA2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 213), count= c(1,1,31))
meanA2005_Y=mean(tempsA2005_Y)

# For WB16150 (475, 1080)
tempsA2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 213), count= c(1,1,31))
meanA2005_O=mean(tempsA2005_O)


# For WBSL840 (480, 1092)
tempsA2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 213), count= c(1,1,31))
meanA2005_AA=mean(tempsA2005_AA)


meansA2005= c(meanA2005_A, meanA2005_B,meanA2005_C,meanA2005_D,meanA2005_E,meanA2005_F,meanA2005_G,meanA2005_H,meanA2005_I,meanA2005_J,meanA2005_K,meanA2005_L,meanA2005_N, meanA2005_O, meanA2005_P, meanA2005_R, meanA2005_S, meanA2005_Y, meanA2005_AA)



