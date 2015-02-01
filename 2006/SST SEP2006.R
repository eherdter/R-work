### SEP 2006 ### 244, 30

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

data2006 = open.ncdf("sst.day.mean.2006.v2.nc")



# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsS2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,244), count=c(1,1,30))
meanS2006_A=mean(tempsS2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsS2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 244), count= c(1,1,30))
meanS2006_B=mean(tempsS2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsS2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 244), count= c(1,1,30))
meanS2006_C=mean(tempsS2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsS2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 244), count= c(1,1,30))
meanS2006_D=mean(tempsS2006_D)

# for station 58 ~ 475, 1073
tempsS2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 244), count= c(1,1,30))
meanS2006_E=mean(tempsS2006_E)

# for station BR3440, (472, 1103)
tempsS2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 244), count= c(1,1,30))
meanS2006_F=mean(tempsS2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsS2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 244), count= c(1,1,30))
meanS2006_G=mean(tempsS2006_G)

# for PC1220, 33, 34, (476,1083)
tempsS2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 244), count= c(1,1,30))
meanS2006_H=mean(tempsS2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsS2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 244), count= c(1,1,30))
meanS2006_I=mean(tempsS2006_I)

# For PC1520 ~ (479, 1087)
tempsS2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 244), count= c(1,1,30))
meanS2006_J=mean(tempsS2006_J)

#For PC81460 (479, 1091)
tempsS2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 244), count= c(1,1,30))
meanS2006_K=mean(tempsS2006_K)

# For BOR0340 (471, 1104)
tempsS2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 244), count= c(1,1,30))
meanS2006_L=mean(tempsS2006_L)

# for BR0320 (471, 1107)
tempsS2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 244), count= c(1,1,30))
meanS2006_M=mean(tempsS2006_M)

#For 82 (472, 1102)
tempsS2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 244), count= c(1,1,30))
meanS2006_N=mean(tempsS2006_N)

# For WB16150 (475, 1080)
tempsS2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 244), count= c(1,1,30))
meanS2006_O=mean(tempsS2006_O)

For #51 (476, 1080)
tempsS2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 244), count= c(1,1,30))
meanS2006_P=mean(tempsS2006_P)

# for 16 (476, 1100)
tempsS2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 244), count= c(1,1,30))
meanS2006_Q=mean(tempsS2006_Q)

# For 15 (476,1101)
tempsS2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 244), count= c(1,1,30))
meanS2006_R=mean(tempsS2006_R)

#For 28 (477, 1086)
tempsS2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 244), count= c(1,1,30))
meanS2006_S=mean(tempsS2006_S)

# for 83 and BR0502 (477, 1102)
tempsS2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 244), count= c(1,1,30))
meanS2006_T=mean(tempsS2006_T)

#for Br 4/5 10 (477 1105)
tempsS2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 244), count= c(1,1,30))
meanS2006_U=mean(tempsS2006_U)

# for 27, PC1020 (478, 1086)
tempsS2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 244), count= c(1,1,30))
meanS2006_V=mean(tempsS2006_V)

# for PC1010 (479,1086)
tempsS2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 244), count= c(1,1,30))
meanS2006_W=mean(tempsS2006_W)

# for PC0920 (479, 1088)
tempsS2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 244), count= c(1,1,30))
meanS2006_X=mean(tempsS2006_X)

# For PC0910 (480, 1088)
tempsS2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 244), count= c(1,1,30))
meanS2006_Y=mean(tempsS2006_Y)

# for PC1420 (480,1091) 
tempsS2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 244), count= c(1,1,30))
meanS2006_Z=mean(tempsS2006_Z)

# For WBSL840 (480, 1092)
tempsS2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 244), count= c(1,1,30))
meanS2006_AA=mean(tempsS2006_AA)

# for PC0720 (481, 1095)
tempsS2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 244), count= c(1,1,30))
meanS2006_BB=mean(tempsS2006_BB)

# for PC1510 (481, 1087)
tempsS2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 244), count= c(1,1,30))
meanS2006_CC=mean(tempsS2006_CC)

#for PC0710 (482, 1096)
tempsS2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 244), count= c(1,1,30))
meanS2006_DD=mean(tempsS2006_DD)



meansS2006= c(meanS2006_A, meanS2006_B, meanS2006_C, meanS2006_D, meanS2006_E, meanS2006_F, meanS2006_G, meanS2006_H, meanS2006_I, meanS2006_J, meanS2006_K, meanS2006_L, meanS2006_M, meanS2006_N, meanS2006_O, meanS2006_P, meanS2006_Q, meanS2006_R, meanS2006_S, meanS2006_T, meanS2006_U, meanS2006_V, meanS2006_W, meanS2006_X, meanS2006_Y, meanS2006_Z, meanS2006_AA, meanS2006_BB, meanS2006_CC, meanS2006_DD)