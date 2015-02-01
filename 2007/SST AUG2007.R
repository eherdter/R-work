### August 2007 ### 213, 31


# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
tempsA2007_A =get.var.ncdf(data2007, "sst", start= c(1085,477,213), count=c(1,1,31))
meanA2007_A=mean(tempsA2007_A)

# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
tempsA2007_B = get.var.ncdf(data2007, "sst", start=c(1103, 473, 213), count= c(1,1,31))
meanA2007_B=mean(tempsA2007_B)

# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
tempsA2007_C = get.var.ncdf(data2007, "sst", start=c(1078, 475, 213), count= c(1,1,31))
meanA2007_C=mean(tempsA2007_C)

# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
tempsA2007_D = get.var.ncdf(data2007, "sst", start=c(1078, 473, 213), count= c(1,1,31))
meanA2007_D=mean(tempsA2007_D)

# for station 58 ~ 475, 1073
tempsA2007_E = get.var.ncdf(data2007, "sst", start=c(1073, 475, 213), count= c(1,1,31))
meanA2007_E=mean(tempsA2007_E)

# for station BR3440, (472, 1103)
tempsA2007_F = get.var.ncdf(data2007, "sst", start=c(1103, 472, 213), count= c(1,1,31))
meanA2007_F=mean(tempsA2007_F)

#for station PC0610 and PC0620, ~ (478, 1098)
tempsA2007_G = get.var.ncdf(data2007, "sst", start=c(1098, 478, 213), count= c(1,1,31))
meanA2007_G=mean(tempsA2007_G)

# for PC1220, 33, 34, (476,1083)
tempsA2007_H = get.var.ncdf(data2007, "sst", start=c(1083, 476, 213), count= c(1,1,31))
meanA2007_H=mean(tempsA2007_H)

#for PC1320, He265, 37 ~ (474, 1078)
tempsA2007_I = get.var.ncdf(data2007, "sst", start=c(1078, 474, 213), count= c(1,1,31))
meanA2007_I=mean(tempsA2007_I)

# For PC1520 ~ (479, 1087)
tempsA2007_J = get.var.ncdf(data2007, "sst", start=c(1087, 479, 213), count= c(1,1,31))
meanA2007_J=mean(tempsA2007_J)

#For PC81460 (479, 1091)
tempsA2007_K = get.var.ncdf(data2007, "sst", start=c(1091, 479, 213), count= c(1,1,31))
meanA2007_K=mean(tempsA2007_K)

# For BOR0340 (471, 1104)
tempsA2007_L = get.var.ncdf(data2007, "sst", start=c(1104, 471, 213), count= c(1,1,31))
meanA2007_L=mean(tempsA2007_L)

# for BR0320 (471, 1107)
tempsA2007_M = get.var.ncdf(data2007, "sst", start=c(1107, 471, 213), count= c(1,1,31))
meanA2007_M=mean(tempsA2007_M)

#For 82 (472, 1102)
tempsA2007_N = get.var.ncdf(data2007, "sst", start=c(1102, 472, 213), count= c(1,1,31))
meanA2007_N=mean(tempsA2007_N)

# For WB16150 (475, 1080)
tempsA2007_O = get.var.ncdf(data2007, "sst", start=c(1080, 475, 213), count= c(1,1,31))
meanA2007_O=mean(tempsA2007_O)

For #51 (476, 1080)
tempsA2007_P = get.var.ncdf(data2007, "sst", start=c(1080, 476, 213), count= c(1,1,31))
meanA2007_P=mean(tempsA2007_P)

# for 16 (476, 1100)
tempsA2007_Q = get.var.ncdf(data2007, "sst", start=c(1100, 476, 213), count= c(1,1,31))
meanA2007_Q=mean(tempsA2007_Q)

# For 15 (476,1101)
tempsA2007_R = get.var.ncdf(data2007, "sst", start=c(1101, 476, 213), count= c(1,1,31))
meanA2007_R=mean(tempsA2007_R)

#For 28 (477, 1086)
tempsA2007_S = get.var.ncdf(data2007, "sst", start=c(1086, 477, 213), count= c(1,1,31))
meanA2007_S=mean(tempsA2007_S)

# for 83 and BR0502 (477, 1102)
tempsA2007_T = get.var.ncdf(data2007, "sst", start=c(1102, 477, 213), count= c(1,1,31))
meanA2007_T=mean(tempsA2007_T)

#for Br 4/5 10 (477 1105)
tempsA2007_U = get.var.ncdf(data2007, "sst", start=c(1105, 477, 213), count= c(1,1,31))
meanA2007_U=mean(tempsA2007_U)

# for 27, PC1020 (478, 1086)
tempsA2007_V = get.var.ncdf(data2007, "sst", start=c(1086, 478, 213), count= c(1,1,31))
meanA2007_V=mean(tempsA2007_V)

# for PC1010 (479,1086)
tempsA2007_W = get.var.ncdf(data2007, "sst", start=c(1086, 479, 213), count= c(1,1,31))
meanA2007_W=mean(tempsA2007_W)

# for PC0920 (479, 1088)
tempsA2007_X = get.var.ncdf(data2007, "sst", start=c(1088, 479, 213), count= c(1,1,31))
meanA2007_X=mean(tempsA2007_X)

# For PC0910 (480, 1088)
tempsA2007_Y = get.var.ncdf(data2007, "sst", start=c(1088, 480, 213), count= c(1,1,31))
meanA2007_Y=mean(tempsA2007_Y)

# for PC1420 (480,1091) 
tempsA2007_Z = get.var.ncdf(data2007, "sst", start=c(1091, 480, 213), count= c(1,1,31))
meanA2007_Z=mean(tempsA2007_Z)

# For WBSL840 (480, 1092)
tempsA2007_AA = get.var.ncdf(data2007, "sst", start=c(1092, 480, 213), count= c(1,1,31))
meanA2007_AA=mean(tempsA2007_AA)

# for PC0720 (481, 1095)
tempsA2007_BB = get.var.ncdf(data2007, "sst", start=c(1095, 481, 213), count= c(1,1,31))
meanA2007_BB=mean(tempsA2007_BB)

# for PC1510 (481, 1087)
tempsA2007_CC = get.var.ncdf(data2007, "sst", start=c(1087, 481, 213), count= c(1,1,31))
meanA2007_CC=mean(tempsA2007_CC)

#for PC0710 (482, 1096)
tempsA2007_DD = get.var.ncdf(data2007, "sst", start=c(1096, 482, 213), count= c(1,1,31))
meanA2007_DD=mean(tempsA2007_DD)



meansA2007= c(meanA2007_A, meanA2007_B, meanA2007_C, meanA2007_D, meanA2007_E, meanA2007_F, meanA2007_G, meanA2007_H, meanA2007_I, meanA2007_J, meanA2007_K, meanA2007_L, meanA2007_M, meanA2007_N, meanA2007_O, meanA2007_P, meanA2007_Q, meanA2007_R, meanA2007_S, meanA2007_T, meanA2007_U, meanA2007_V, meanA2007_W, meanA2007_X, meanA2007_Y, meanA2007_Z, meanA2007_AA, meanA2007_BB, meanA2007_CC, meanA2007_DD)