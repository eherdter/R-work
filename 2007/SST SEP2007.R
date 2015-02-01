### SEP 2007 ### 244, 30

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

data2007 = open.ncdf("sst.day.mean.2007.v2.nc")



# for stations 30, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsS2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,244), count=c(1,1,30))
meanS2007_A=mean(tempsS2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsS2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 244), count= c(1,1,30))
meanS2007_B=mean(tempsS2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsS2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 244), count= c(1,1,30))
meanS2007_C=mean(tempsS2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsS2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 244), count= c(1,1,30))
meanS2007_D=mean(tempsS2007_D)

# for station 58 ~ 475, 1073
tempsS2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 244), count= c(1,1,30))
meanS2007_E=mean(tempsS2007_E)

# for station BR3440, (472, 1103)
tempsS2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 244), count= c(1,1,30))
meanS2007_F=mean(tempsS2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsS2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 244), count= c(1,1,30))
meanS2007_G=mean(tempsS2007_G)

# for PC1220, 33, 34, (476,1083)
tempsS2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 244), count= c(1,1,30))
meanS2007_H=mean(tempsS2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsS2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 244), count= c(1,1,30))
meanS2007_I=mean(tempsS2007_I)

# For PC1520 ~ (479, 1087)
tempsS2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 244), count= c(1,1,30))
meanS2007_J=mean(tempsS2007_J)

#For PC81460 (479, 1091)
tempsS2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 244), count= c(1,1,30))
meanS2007_K=mean(tempsS2007_K)

# For BOR0340 (471, 1104)
tempsS2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 244), count= c(1,1,30))
meanS2007_L=mean(tempsS2007_L)

# for BR0320 (471, 1107)
tempsS2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 244), count= c(1,1,30))
meanS2007_M=mean(tempsS2007_M)

#For 82 (472, 1102)
tempsS2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 244), count= c(1,1,30))
meanS2007_N=mean(tempsS2007_N)

# For WB16150 (475, 1080)
tempsS2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 244), count= c(1,1,30))
meanS2007_O=mean(tempsS2007_O)

For #51 (476, 1080)
tempsS2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 244), count= c(1,1,30))
meanS2007_P=mean(tempsS2007_P)

# for 16 (476, 1100)
tempsS2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 244), count= c(1,1,30))
meanS2007_Q=mean(tempsS2007_Q)

# For 15 (476,1101)
tempsS2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 244), count= c(1,1,30))
meanS2007_R=mean(tempsS2007_R)

#For 28 (477, 1086)
tempsS2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 244), count= c(1,1,30))
meanS2007_S=mean(tempsS2007_S)

# for 83 and BR0502 (477, 1102)
tempsS2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 244), count= c(1,1,30))
meanS2007_T=mean(tempsS2007_T)

#for Br 4/5 10 (477 1105)
tempsS2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 244), count= c(1,1,30))
meanS2007_U=mean(tempsS2007_U)

# for 27, PC1020 (478, 1086)
tempsS2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 244), count= c(1,1,30))
meanS2007_V=mean(tempsS2007_V)

# for PC1010 (479,1086)
tempsS2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 244), count= c(1,1,30))
meanS2007_W=mean(tempsS2007_W)

# for PC0920 (479, 1088)
tempsS2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 244), count= c(1,1,30))
meanS2007_X=mean(tempsS2007_X)

# For PC0910 (480, 1088)
tempsS2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 244), count= c(1,1,30))
meanS2007_Y=mean(tempsS2007_Y)

# for PC1420 (480,1091) 
tempsS2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 244), count= c(1,1,30))
meanS2007_Z=mean(tempsS2007_Z)

# For WBSL840 (480, 1092)
tempsS2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 244), count= c(1,1,30))
meanS2007_AA=mean(tempsS2007_AA)

# for PC0720 (481, 1095)
tempsS2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 244), count= c(1,1,30))
meanS2007_BB=mean(tempsS2007_BB)

# for PC1510 (481, 1087)
tempsS2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 244), count= c(1,1,30))
meanS2007_CC=mean(tempsS2007_CC)

#for PC0710 (482, 1096)
tempsS2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 244), count= c(1,1,30))
meanS2007_DD=mean(tempsS2007_DD)



meansS2007= c(meanS2007_A, meanS2007_B, meanS2007_C, meanS2007_D, meanS2007_E, meanS2007_F, meanS2007_G, meanS2007_H, meanS2007_I, meanS2007_J, meanS2007_K, meanS2007_L, meanS2007_M, meanS2007_N, meanS2007_O, meanS2007_P, meanS2007_Q, meanS2007_R, meanS2007_S, meanS2007_T, meanS2007_U, meanS2007_V, meanS2007_W, meanS2007_X, meanS2007_Y, meanS2007_Z, meanS2007_AA, meanS2007_BB, meanS2007_CC, meanS2007_DD)
