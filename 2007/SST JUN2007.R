### June 2007 ### 152, 30

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

data2007 = open.ncdf("sst.day.mean.2007.v2.nc")

# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsJ2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,152), count=c(1,1,30))
meanJ2007_A=mean(tempsJ2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsJ2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 152), count= c(1,1,30))
meanJ2007_B=mean(tempsJ2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsJ2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 152), count= c(1,1,30))
meanJ2007_C=mean(tempsJ2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsJ2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 152), count= c(1,1,30))
meanJ2007_D=mean(tempsJ2007_D)

# for station 58 ~ 475, 1073
tempsJ2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 152), count= c(1,1,30))
meanJ2007_E=mean(tempsJ2007_E)

# for station BR3440, (472, 1103)
tempsJ2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 152), count= c(1,1,30))
meanJ2007_F=mean(tempsJ2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsJ2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 152), count= c(1,1,30))
meanJ2007_G=mean(tempsJ2007_G)

# for PC1220, 33, 34, (476,1083)
tempsJ2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 152), count= c(1,1,30))
meanJ2007_H=mean(tempsJ2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsJ2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 152), count= c(1,1,30))
meanJ2007_I=mean(tempsJ2007_I)

# For PC1520 ~ (479, 1087)
tempsJ2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 152), count= c(1,1,30))
meanJ2007_J=mean(tempsJ2007_J)

#For PC81460 (479, 1091)
tempsJ2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 152), count= c(1,1,30))
meanJ2007_K=mean(tempsJ2007_K)

# For BOR0340 (471, 1104)
tempsJ2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 152), count= c(1,1,30))
meanJ2007_L=mean(tempsJ2007_L)

# for BR0320 (471, 1107)
tempsJ2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 152), count= c(1,1,30))
meanJ2007_M=mean(tempsJ2007_M)

#For 82 (472, 1102)
tempsJ2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 152), count= c(1,1,30))
meanJ2007_N=mean(tempsJ2007_N)

# For WB16150 (475, 1080)
tempsJ2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 152), count= c(1,1,30))
meanJ2007_O=mean(tempsJ2007_O)

For #51 (476, 1080)
tempsJ2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 152), count= c(1,1,30))
meanJ2007_P=mean(tempsJ2007_P)

# for 16 (476, 1100)
tempsJ2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 152), count= c(1,1,30))
meanJ2007_Q=mean(tempsJ2007_Q)

# For 15 (476,1101)
tempsJ2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 152), count= c(1,1,30))
meanJ2007_R=mean(tempsJ2007_R)

#For 28 (477, 1086)
tempsJ2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 152), count= c(1,1,30))
meanJ2007_S=mean(tempsJ2007_S)

# for 83 and BR0502 (477, 1102)
tempsJ2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 152), count= c(1,1,30))
meanJ2007_T=mean(tempsJ2007_T)

#for Br 4/5 10 (477 1105)
tempsJ2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 152), count= c(1,1,30))
meanJ2007_U=mean(tempsJ2007_U)

# for 27, PC1020 (478, 1086)
tempsJ2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 152), count= c(1,1,30))
meanJ2007_V=mean(tempsJ2007_V)

# for PC1010 (479,1086)
tempsJ2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 152), count= c(1,1,30))
meanJ2007_W=mean(tempsJ2007_W)

# for PC0920 (479, 1088)
tempsJ2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 152), count= c(1,1,30))
meanJ2007_X=mean(tempsJ2007_X)

# For PC0910 (480, 1088)
tempsJ2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 152), count= c(1,1,30))
meanJ2007_Y=mean(tempsJ2007_Y)

# for PC1420 (480,1091) 
tempsJ2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 152), count= c(1,1,30))
meanJ2007_Z=mean(tempsJ2007_Z)

# For WBSL840 (480, 1092)
tempsJ2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 152), count= c(1,1,30))
meanJ2007_AA=mean(tempsJ2007_AA)

# for PC0720 (481, 1095)
tempsJ2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 152), count= c(1,1,30))
meanJ2007_BB=mean(tempsJ2007_BB)

# for PC1510 (481, 1087)
tempsJ2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 152), count= c(1,1,30))
meanJ2007_CC=mean(tempsJ2007_CC)

#for PC0710 (482, 1096)
tempsJ2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 152), count= c(1,1,30))
meanJ2007_DD=mean(tempsJ2007_DD)



meansJ2007= c(meanJ2007_A, meanJ2007_B, meanJ2007_C, meanJ2007_D, meanJ2007_E, meanJ2007_F, meanJ2007_G, meanJ2007_H, meanJ2007_I, meanJ2007_J, meanJ2007_K, meanJ2007_L, meanJ2007_M, meanJ2007_N, meanJ2007_O, meanJ2007_P, meanJ2007_Q, meanJ2007_R, meanJ2007_S, meanJ2007_T, meanJ2007_U, meanJ2007_V, meanJ2007_W, meanJ2007_X, meanJ2007_Y, meanJ2007_Z, meanJ2007_AA, meanJ2007_BB, meanJ2007_CC, meanJ2007_DD)