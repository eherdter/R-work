### DECEMBER 2006 ### 335, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsD2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,335), count=c(1,1,31))
meanD2006_A=mean(tempsD2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsD2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 335), count= c(1,1,31))
meanD2006_B=mean(tempsD2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsD2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 335), count= c(1,1,31))
meanD2006_C=mean(tempsD2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsD2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 335), count= c(1,1,31))
meanD2006_D=mean(tempsD2006_D)

# for station 58 ~ 475, 1073
tempsD2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 335), count= c(1,1,31))
meanD2006_E=mean(tempsD2006_E)

# for station BR3440, (472, 1103)
tempsD2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 335), count= c(1,1,31))
meanD2006_F=mean(tempsD2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsD2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 335), count= c(1,1,31))
meanD2006_G=mean(tempsD2006_G)

# for PC1220, 33, 34, (476,1083)
tempsD2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 335), count= c(1,1,31))
meanD2006_H=mean(tempsD2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsD2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 335), count= c(1,1,31))
meanD2006_I=mean(tempsD2006_I)

# For PC1520 ~ (479, 1087)
tempsD2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 335), count= c(1,1,31))
meanD2006_J=mean(tempsD2006_J)

#For PC81460 (479, 1091)
tempsD2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 335), count= c(1,1,31))
meanD2006_K=mean(tempsD2006_K)

# For BOR0340 (471, 1104)
tempsD2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 335), count= c(1,1,31))
meanD2006_L=mean(tempsD2006_L)

# for BR0320 (471, 1107)
tempsD2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 335), count= c(1,1,31))
meanD2006_M=mean(tempsD2006_M)

#For 82 (472, 1102)
tempsD2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 335), count= c(1,1,31))
meanD2006_N=mean(tempsD2006_N)

# For WB16150 (475, 1080)
tempsD2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 335), count= c(1,1,31))
meanD2006_O=mean(tempsD2006_O)

For #51 (476, 1080)
tempsD2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 335), count= c(1,1,31))
meanD2006_P=mean(tempsD2006_P)

# for 16 (476, 1100)
tempsD2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 335), count= c(1,1,31))
meanD2006_Q=mean(tempsD2006_Q)

# For 15 (476,1101)
tempsD2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 335), count= c(1,1,31))
meanD2006_R=mean(tempsD2006_R)

#For 28 (477, 1086)
tempsD2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 335), count= c(1,1,31))
meanD2006_S=mean(tempsD2006_S)

# for 83 and BR0502 (477, 1102)
tempsD2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 335), count= c(1,1,31))
meanD2006_T=mean(tempsD2006_T)

#for Br 4/5 10 (477 1105)
tempsD2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 335), count= c(1,1,31))
meanD2006_U=mean(tempsD2006_U)

# for 27, PC1020 (478, 1086)
tempsD2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 335), count= c(1,1,31))
meanD2006_V=mean(tempsD2006_V)

# for PC1010 (479,1086)
tempsD2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 335), count= c(1,1,31))
meanD2006_W=mean(tempsD2006_W)

# for PC0920 (479, 1088)
tempsD2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 335), count= c(1,1,31))
meanD2006_X=mean(tempsD2006_X)

# For PC0910 (480, 1088)
tempsD2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 335), count= c(1,1,31))
meanD2006_Y=mean(tempsD2006_Y)

# for PC1420 (480,1091) 
tempsD2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 335), count= c(1,1,31))
meanD2006_Z=mean(tempsD2006_Z)

# For WBSL840 (480, 1092)
tempsD2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 335), count= c(1,1,31))
meanD2006_AA=mean(tempsD2006_AA)

# for PC0720 (481, 1095)
tempsD2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 335), count= c(1,1,31))
meanD2006_BB=mean(tempsD2006_BB)

# for PC1510 (481, 1087)
tempsD2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 335), count= c(1,1,31))
meanD2006_CC=mean(tempsD2006_CC)

#for PC0710 (482, 1096)
tempsD2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 335), count= c(1,1,31))
meanD2006_DD=mean(tempsD2006_DD)



meansD2006= c(meanD2006_A, meanD2006_B, meanD2006_C, meanD2006_D, meanD2006_E, meanD2006_F, meanD2006_G, meanD2006_H, meanD2006_I, meanD2006_J, meanD2006_K, meanD2006_L, meanD2006_M, meanD2006_N, meanD2006_O, meanD2006_P, meanD2006_Q, meanD2006_R, meanD2006_S, meanD2006_T, meanD2006_U, meanD2006_V, meanD2006_W, meanD2006_X, meanD2006_Y, meanD2006_Z, meanD2006_AA, meanD2006_BB, meanD2006_CC, meanD2006_DD)