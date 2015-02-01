### August 2006 ### 213, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsA2006_A =get.var.ncdf(data2006, "sst", start= c(1085,477,213), count=c(1,1,31))
meanA2006_A=mean(tempsA2006_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsA2006_B = get.var.ncdf(data2006, "sst", start=c(1103, 473, 213), count= c(1,1,31))
meanA2006_B=mean(tempsA2006_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsA2006_C = get.var.ncdf(data2006, "sst", start=c(1078, 475, 213), count= c(1,1,31))
meanA2006_C=mean(tempsA2006_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsA2006_D = get.var.ncdf(data2006, "sst", start=c(1078, 473, 213), count= c(1,1,31))
meanA2006_D=mean(tempsA2006_D)

# for station 58 ~ 475, 1073
tempsA2006_E = get.var.ncdf(data2006, "sst", start=c(1073, 475, 213), count= c(1,1,31))
meanA2006_E=mean(tempsA2006_E)

# for station BR3440, (472, 1103)
tempsA2006_F = get.var.ncdf(data2006, "sst", start=c(1103, 472, 213), count= c(1,1,31))
meanA2006_F=mean(tempsA2006_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsA2006_G = get.var.ncdf(data2006, "sst", start=c(1098, 478, 213), count= c(1,1,31))
meanA2006_G=mean(tempsA2006_G)

# for PC1220, 33, 34, (476,1083)
tempsA2006_H = get.var.ncdf(data2006, "sst", start=c(1083, 476, 213), count= c(1,1,31))
meanA2006_H=mean(tempsA2006_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsA2006_I = get.var.ncdf(data2006, "sst", start=c(1078, 474, 213), count= c(1,1,31))
meanA2006_I=mean(tempsA2006_I)

# For PC1520 ~ (479, 1087)
tempsA2006_J = get.var.ncdf(data2006, "sst", start=c(1087, 479, 213), count= c(1,1,31))
meanA2006_J=mean(tempsA2006_J)

#For PC81460 (479, 1091)
tempsA2006_K = get.var.ncdf(data2006, "sst", start=c(1091, 479, 213), count= c(1,1,31))
meanA2006_K=mean(tempsA2006_K)

# For BOR0340 (471, 1104)
tempsA2006_L = get.var.ncdf(data2006, "sst", start=c(1104, 471, 213), count= c(1,1,31))
meanA2006_L=mean(tempsA2006_L)

# for BR0320 (471, 1107)
tempsA2006_M = get.var.ncdf(data2006, "sst", start=c(1107, 471, 213), count= c(1,1,31))
meanA2006_M=mean(tempsA2006_M)

#For 82 (472, 1102)
tempsA2006_N = get.var.ncdf(data2006, "sst", start=c(1102, 472, 213), count= c(1,1,31))
meanA2006_N=mean(tempsA2006_N)

# For WB16150 (475, 1080)
tempsA2006_O = get.var.ncdf(data2006, "sst", start=c(1080, 475, 213), count= c(1,1,31))
meanA2006_O=mean(tempsA2006_O)

For #51 (476, 1080)
tempsA2006_P = get.var.ncdf(data2006, "sst", start=c(1080, 476, 213), count= c(1,1,31))
meanA2006_P=mean(tempsA2006_P)

# for 16 (476, 1100)
tempsA2006_Q = get.var.ncdf(data2006, "sst", start=c(1100, 476, 213), count= c(1,1,31))
meanA2006_Q=mean(tempsA2006_Q)

# For 15 (476,1101)
tempsA2006_R = get.var.ncdf(data2006, "sst", start=c(1101, 476, 213), count= c(1,1,31))
meanA2006_R=mean(tempsA2006_R)

#For 28 (477, 1086)
tempsA2006_S = get.var.ncdf(data2006, "sst", start=c(1086, 477, 213), count= c(1,1,31))
meanA2006_S=mean(tempsA2006_S)

# for 83 and BR0502 (477, 1102)
tempsA2006_T = get.var.ncdf(data2006, "sst", start=c(1102, 477, 213), count= c(1,1,31))
meanA2006_T=mean(tempsA2006_T)

#for Br 4/5 10 (477 1105)
tempsA2006_U = get.var.ncdf(data2006, "sst", start=c(1105, 477, 213), count= c(1,1,31))
meanA2006_U=mean(tempsA2006_U)

# for 27, PC1020 (478, 1086)
tempsA2006_V = get.var.ncdf(data2006, "sst", start=c(1086, 478, 213), count= c(1,1,31))
meanA2006_V=mean(tempsA2006_V)

# for PC1010 (479,1086)
tempsA2006_W = get.var.ncdf(data2006, "sst", start=c(1086, 479, 213), count= c(1,1,31))
meanA2006_W=mean(tempsA2006_W)

# for PC0920 (479, 1088)
tempsA2006_X = get.var.ncdf(data2006, "sst", start=c(1088, 479, 213), count= c(1,1,31))
meanA2006_X=mean(tempsA2006_X)

# For PC0910 (480, 1088)
tempsA2006_Y = get.var.ncdf(data2006, "sst", start=c(1088, 480, 213), count= c(1,1,31))
meanA2006_Y=mean(tempsA2006_Y)

# for PC1420 (480,1091) 
tempsA2006_Z = get.var.ncdf(data2006, "sst", start=c(1091, 480, 213), count= c(1,1,31))
meanA2006_Z=mean(tempsA2006_Z)

# For WBSL840 (480, 1092)
tempsA2006_AA = get.var.ncdf(data2006, "sst", start=c(1092, 480, 213), count= c(1,1,31))
meanA2006_AA=mean(tempsA2006_AA)

# for PC0720 (481, 1095)
tempsA2006_BB = get.var.ncdf(data2006, "sst", start=c(1095, 481, 213), count= c(1,1,31))
meanA2006_BB=mean(tempsA2006_BB)

# for PC1510 (481, 1087)
tempsA2006_CC = get.var.ncdf(data2006, "sst", start=c(1087, 481, 213), count= c(1,1,31))
meanA2006_CC=mean(tempsA2006_CC)

#for PC0710 (482, 1096)
tempsA2006_DD = get.var.ncdf(data2006, "sst", start=c(1096, 482, 213), count= c(1,1,31))
meanA2006_DD=mean(tempsA2006_DD)



meansA2006= c(meanA2006_A, meanA2006_B, meanA2006_C, meanA2006_D, meanA2006_E, meanA2006_F, meanA2006_G, meanA2006_H, meanA2006_I, meanA2006_J, meanA2006_K, meanA2006_L, meanA2006_M, meanA2006_N, meanA2006_O, meanA2006_P, meanA2006_Q, meanA2006_R, meanA2006_S, meanA2006_T, meanA2006_U, meanA2006_V, meanA2006_W, meanA2006_X, meanA2006_Y, meanA2006_Z, meanA2006_AA, meanA2006_BB, meanA2006_CC, meanA2006_DD)