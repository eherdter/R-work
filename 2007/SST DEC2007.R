### DECEMBER 2007 ### 335, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsD2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,335), count=c(1,1,31))
meanD2007_A=mean(tempsD2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsD2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 335), count= c(1,1,31))
meanD2007_B=mean(tempsD2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsD2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 335), count= c(1,1,31))
meanD2007_C=mean(tempsD2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsD2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 335), count= c(1,1,31))
meanD2007_D=mean(tempsD2007_D)

# for station 58 ~ 475, 1073
tempsD2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 335), count= c(1,1,31))
meanD2007_E=mean(tempsD2007_E)

# for station BR3440, (472, 1103)
tempsD2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 335), count= c(1,1,31))
meanD2007_F=mean(tempsD2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsD2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 335), count= c(1,1,31))
meanD2007_G=mean(tempsD2007_G)

# for PC1220, 33, 34, (476,1083)
tempsD2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 335), count= c(1,1,31))
meanD2007_H=mean(tempsD2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsD2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 335), count= c(1,1,31))
meanD2007_I=mean(tempsD2007_I)

# For PC1520 ~ (479, 1087)
tempsD2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 335), count= c(1,1,31))
meanD2007_J=mean(tempsD2007_J)

#For PC81460 (479, 1091)
tempsD2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 335), count= c(1,1,31))
meanD2007_K=mean(tempsD2007_K)

# For BOR0340 (471, 1104)
tempsD2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 335), count= c(1,1,31))
meanD2007_L=mean(tempsD2007_L)

# for BR0320 (471, 1107)
tempsD2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 335), count= c(1,1,31))
meanD2007_M=mean(tempsD2007_M)

#For 82 (472, 1102)
tempsD2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 335), count= c(1,1,31))
meanD2007_N=mean(tempsD2007_N)

# For WB16150 (475, 1080)
tempsD2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 335), count= c(1,1,31))
meanD2007_O=mean(tempsD2007_O)

For #51 (476, 1080)
tempsD2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 335), count= c(1,1,31))
meanD2007_P=mean(tempsD2007_P)

# for 16 (476, 1100)
tempsD2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 335), count= c(1,1,31))
meanD2007_Q=mean(tempsD2007_Q)

# For 15 (476,1101)
tempsD2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 335), count= c(1,1,31))
meanD2007_R=mean(tempsD2007_R)

#For 28 (477, 1086)
tempsD2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 335), count= c(1,1,31))
meanD2007_S=mean(tempsD2007_S)

# for 83 and BR0502 (477, 1102)
tempsD2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 335), count= c(1,1,31))
meanD2007_T=mean(tempsD2007_T)

#for Br 4/5 10 (477 1105)
tempsD2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 335), count= c(1,1,31))
meanD2007_U=mean(tempsD2007_U)

# for 27, PC1020 (478, 1086)
tempsD2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 335), count= c(1,1,31))
meanD2007_V=mean(tempsD2007_V)

# for PC1010 (479,1086)
tempsD2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 335), count= c(1,1,31))
meanD2007_W=mean(tempsD2007_W)

# for PC0920 (479, 1088)
tempsD2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 335), count= c(1,1,31))
meanD2007_X=mean(tempsD2007_X)

# For PC0910 (480, 1088)
tempsD2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 335), count= c(1,1,31))
meanD2007_Y=mean(tempsD2007_Y)

# for PC1420 (480,1091) 
tempsD2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 335), count= c(1,1,31))
meanD2007_Z=mean(tempsD2007_Z)

# For WBSL840 (480, 1092)
tempsD2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 335), count= c(1,1,31))
meanD2007_AA=mean(tempsD2007_AA)

# for PC0720 (481, 1095)
tempsD2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 335), count= c(1,1,31))
meanD2007_BB=mean(tempsD2007_BB)

# for PC1510 (481, 1087)
tempsD2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 335), count= c(1,1,31))
meanD2007_CC=mean(tempsD2007_CC)

#for PC0710 (482, 1096)
tempsD2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 335), count= c(1,1,31))
meanD2007_DD=mean(tempsD2007_DD)



meansD2007= c(meanD2007_A, meanD2007_B, meanD2007_C, meanD2007_D, meanD2007_E, meanD2007_F, meanD2007_G, meanD2007_H, meanD2007_I, meanD2007_J, meanD2007_K, meanD2007_L, meanD2007_M, meanD2007_N, meanD2007_O, meanD2007_P, meanD2007_Q, meanD2007_R, meanD2007_S, meanD2007_T, meanD2007_U, meanD2007_V, meanD2007_W, meanD2007_X, meanD2007_Y, meanD2007_Z, meanD2007_AA, meanD2007_BB, meanD2007_CC, meanD2007_DD)