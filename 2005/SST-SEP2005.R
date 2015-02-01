### september 2005 ### 244, 30
library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

data2005 = open.ncdf("sst.day.mean.2005.v2.nc")

# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsS2005_A =get.var.ncdf(data2005, "sst", start= c(1085,477,244), count=c(1,1,30))
meanS2005_A=mean(tempsS2005_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsS2005_B = get.var.ncdf(data2005, "sst", start=c(1103, 473, 244), count= c(1,1,30))
meanS2005_B=mean(tempsS2005_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsS2005_C = get.var.ncdf(data2005, "sst", start=c(1078, 475, 244), count= c(1,1,30))
meanS2005_C=mean(tempsS2005_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsS2005_D = get.var.ncdf(data2005, "sst", start=c(1078, 473, 244), count= c(1,1,30))
meanS2005_D=mean(tempsS2005_D)

# for station 58 ~ 475, 1073
tempsS2005_E = get.var.ncdf(data2005, "sst", start=c(1073, 475, 244), count= c(1,1,30))
meanS2005_E=mean(tempsS2005_E)

# for station BR3440, (472, 1103)
tempsS2005_F = get.var.ncdf(data2005, "sst", start=c(1103, 472, 244), count= c(1,1,30))
meanS2005_F=mean(tempsS2005_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsS2005_G = get.var.ncdf(data2005, "sst", start=c(1098, 478, 244), count= c(1,1,30))
meanS2005_G=mean(tempsS2005_G)

# for PC1220, 33, 34, (476,1083)
tempsS2005_H = get.var.ncdf(data2005, "sst", start=c(1083, 476, 244), count= c(1,1,30))
meanS2005_H=mean(tempsS2005_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsS2005_I = get.var.ncdf(data2005, "sst", start=c(1078, 474, 244), count= c(1,1,30))
meanS2005_I=mean(tempsS2005_I)

# For PC1520 ~ (479, 1087)
tempsS2005_J = get.var.ncdf(data2005, "sst", start=c(1087, 479, 244), count= c(1,1,30))
meanS2005_J=mean(tempsS2005_J)

#For PC81460 (479, 1091)
tempsS2005_K = get.var.ncdf(data2005, "sst", start=c(1091, 479, 244), count= c(1,1,30))
meanS2005_K=mean(tempsS2005_K)

# For BOR0340 (471, 1104)
tempsS2005_L = get.var.ncdf(data2005, "sst", start=c(1104, 471, 244), count= c(1,1,30))
meanS2005_L=mean(tempsS2005_L)

# for BR0320 (471, 1107)
tempsS2005_M = get.var.ncdf(data2005, "sst", start=c(1107, 471, 244), count= c(1,1,30))
meanS2005_M=mean(tempsS2005_M)

#For 82 (472, 1102)
tempsS2005_N = get.var.ncdf(data2005, "sst", start=c(1102, 472, 244), count= c(1,1,30))
meanS2005_N=mean(tempsS2005_N)

# For WB16150 (475, 1080)
tempsS2005_O = get.var.ncdf(data2005, "sst", start=c(1080, 475, 244), count= c(1,1,30))
meanS2005_O=mean(tempsS2005_O)

For #51 (476, 1080)
tempsS2005_P = get.var.ncdf(data2005, "sst", start=c(1080, 476, 244), count= c(1,1,30))
meanS2005_P=mean(tempsS2005_P)

# for 16 (476, 1100)
tempsS2005_Q = get.var.ncdf(data2005, "sst", start=c(1100, 476, 244), count= c(1,1,30))
meanS2005_Q=mean(tempsS2005_Q)

# For 15 (476,1101)
tempsS2005_R = get.var.ncdf(data2005, "sst", start=c(1101, 476, 244), count= c(1,1,30))
meanS2005_R=mean(tempsS2005_R)

#For 28 (477, 1086)
tempsS2005_S = get.var.ncdf(data2005, "sst", start=c(1086, 477, 244), count= c(1,1,30))
meanS2005_S=mean(tempsS2005_S)

# for 83 and BR0502 (477, 1102)
tempsS2005_T = get.var.ncdf(data2005, "sst", start=c(1102, 477, 244), count= c(1,1,30))
meanS2005_T=mean(tempsS2005_T)

#for Br 4/5 10 (477 1105)
tempsS2005_U = get.var.ncdf(data2005, "sst", start=c(1105, 477, 244), count= c(1,1,30))
meanS2005_U=mean(tempsS2005_U)

# for 27, PC1020 (478, 1086)
tempsS2005_V = get.var.ncdf(data2005, "sst", start=c(1086, 478, 244), count= c(1,1,30))
meanS2005_V=mean(tempsS2005_V)

# for PC1010 (479,1086)
tempsS2005_W = get.var.ncdf(data2005, "sst", start=c(1086, 479, 244), count= c(1,1,30))
meanS2005_W=mean(tempsS2005_W)

# for PC0920 (479, 1088)
tempsS2005_X = get.var.ncdf(data2005, "sst", start=c(1088, 479, 244), count= c(1,1,30))
meanS2005_X=mean(tempsS2005_X)

# For PC0910 (480, 1088)
tempsS2005_Y = get.var.ncdf(data2005, "sst", start=c(1088, 480, 244), count= c(1,1,30))
meanS2005_Y=mean(tempsS2005_Y)

# for PC1420 (480,1091) 
tempsS2005_Z = get.var.ncdf(data2005, "sst", start=c(1091, 480, 244), count= c(1,1,30))
meanS2005_Z=mean(tempsS2005_Z)

# For WBSL840 (480, 1092)
tempsS2005_AA = get.var.ncdf(data2005, "sst", start=c(1092, 480, 244), count= c(1,1,30))
meanS2005_AA=mean(tempsS2005_AA)

# for PC0720 (481, 1095)
tempsS2005_BB = get.var.ncdf(data2005, "sst", start=c(1095, 481, 244), count= c(1,1,30))
meanS2005_BB=mean(tempsS2005_BB)

# for PC1510 (481, 1087)
tempsS2005_CC = get.var.ncdf(data2005, "sst", start=c(1087, 481, 244), count= c(1,1,30))
meanS2005_CC=mean(tempsS2005_CC)

#for PC0710 (482, 1096)
tempsS2005_DD = get.var.ncdf(data2005, "sst", start=c(1096, 482, 244), count= c(1,1,30))
meanS2005_DD=mean(tempsS2005_DD)



meansS2005= c(meanS2005_A, meanS2005_B, meanS2005_C, meanS2005_D, meanS2005_E, meanS2005_F, meanS2005_G, meanS2005_H, meanS2005_I, meanS2005_J, meanS2005_K, meanS2005_L, meanS2005_M, meanS2005_N, meanS2005_O, meanS2005_P, meanS2005_Q, meanS2005_R, meanS2005_S, meanS2005_T, meanS2005_U, meanS2005_V, meanS2005_W, meanS2005_X, meanS2005_Y, meanS2005_Z, meanS2005_AA, meanS2005_BB, meanS2005_CC, meanS2005_DD)