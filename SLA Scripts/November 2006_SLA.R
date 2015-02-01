### June 2, 2014 ## getting ssh anomalies for all stations using DT_MSLA (monthly mean sea level anomolies)

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

SSH_11_6 = open.ncdf("dt_global_allsat_msla_h_y2006_m11.nc")

lats = get.var.ncdf(SSH_11_6, "lat")
## the latsU correspond to the sla lats and longs 
lons = get.var.ncdf(SSH_11_6, "lon")


######  for June 2006 ####

# for stations 31, 10-40, PC1120, PC1140, WBSL1040- lats and longs are ~ 29.125(477), 271.124(1085)
SSH_11_6_A =get.var.ncdf(SSH_11_6, "sla", start= c(1085,477,1), count=c(1,1,1))


# for stations 14, 4-40, BR0440 - lats and longs are ~ 28.1259(473), 275.625(1103)
SSH_11_6_B = get.var.ncdf(SSH_11_6, "sla", start=c(1103, 473, 1), count= c(1,1,1))


# for stations 36, PC1320- lats and longs are ~ 28.625(475) , 269.375(1078)
SSH_11_6_C = get.var.ncdf(SSH_11_6, "sla", start=c(1078, 475, 1), count= c(1,1,1))


# for stations 38, PC1340, lats and longs ~ 28.125(473) and 269.4155(1078)
SSH_11_6_D = get.var.ncdf(SSH_11_6, "sla", start=c(1078, 473, 1), count= c(1,1,1))


# for station 58 ~ 475, 1073
SSH_11_6_E = get.var.ncdf(SSH_11_6, "sla", start=c(1073, 475, 1), count= c(1,1,1))


# for station BR3440, (472, 1103)
SSH_11_6_F = get.var.ncdf(SSH_11_6, "sla", start=c(1103, 472, 1), count= c(1,1,1))

#for station PC0610 and PC0620, ~ (478, 1098)
SSH_11_6_G = get.var.ncdf(SSH_11_6, "sla", start=c(1098, 478, 1), count= c(1,1,1))


# for PC1220, 33, 34, (476,1083)
SSH_11_6_H = get.var.ncdf(SSH_11_6, "sla", start=c(1083, 476, 1), count= c(1,1,1))


#for PC1320, He265, 37 ~ (474, 1078)
SSH_11_6_I = get.var.ncdf(SSH_11_6, "sla", start=c(1078, 474, 1), count= c(1,1,1))


# For PC1520 ~ (479, 1087)
SSH_11_6_J = get.var.ncdf(SSH_11_6, "sla", start=c(1087, 479, 1), count= c(1,1,1))


#For PC81460 (479, 1091)
SSH_11_6_K = get.var.ncdf(SSH_11_6, "sla", start=c(1091, 479, 1), count= c(1,1,1))


# For BOR0340 (471, 1104)
SSH_11_6_L = get.var.ncdf(SSH_11_6, "sla", start=c(1104, 471, 1), count= c(1,1,1))


# for BR0320 (471, 1107)
SSH_11_6_M = get.var.ncdf(SSH_11_6, "sla", start=c(1107, 471, 1), count= c(1,1,1))


#For 82 (472, 1102)
SSH_11_6_N = get.var.ncdf(SSH_11_6, "sla", start=c(1102, 472, 1), count= c(1,1,1))


# For WB16150 (475, 1080)
SSH_11_6_O = get.var.ncdf(SSH_11_6, "sla", start=c(1080, 475, 1), count= c(1,1,1))


For #51 (476, 1080)
SSH_11_6_P = get.var.ncdf(SSH_11_6, "sla", start=c(1080, 476, 1), count= c(1,1,1))

# for 16 (476, 1100)
SSH_11_6_Q = get.var.ncdf(SSH_11_6, "sla", start=c(1100, 476, 1), count= c(1,1,1))

# For 15 (476,1101)
SSH_11_6_R = get.var.ncdf(SSH_11_6, "sla", start=c(1101, 476, 1), count= c(1,1,1))


#For 28 (477, 1086)
SSH_11_6_S = get.var.ncdf(SSH_11_6, "sla", start=c(1086, 477, 1), count= c(1,1,1))


SSH_11_6_T = get.var.ncdf(SSH_11_6, "sla", start=c(1102, 477, 1), count= c(1,1,1))


#for Br 4/5 10 (477 1105)
SSH_11_6_U = get.var.ncdf(SSH_11_6, "sla", start=c(1105, 477, 1), count= c(1,1,1))


# for 27, PC1020 (478, 1086)
SSH_11_6_V = get.var.ncdf(SSH_11_6, "sla", start=c(1086, 478, 1), count= c(1,1,1))


# for PC1010 (479,1086)
SSH_11_6_W = get.var.ncdf(SSH_11_6, "sla", start=c(1086, 479, 1), count= c(1,1,1))


# for PC0920 (479, 1088)
SSH_11_6_X = get.var.ncdf(SSH_11_6, "sla", start=c(1088, 479, 1), count= c(1,1,1))


# For PC0910 (480, 1088)
SSH_11_6_Y = get.var.ncdf(SSH_11_6, "sla", start=c(1088, 480, 1), count= c(1,1,1))


# for PC1420 (480,1091) 
SSH_11_6_Z = get.var.ncdf(SSH_11_6, "sla", start=c(1091, 480, 1), count= c(1,1,1))


# For WBSL840 (480, 1092)
SSH_11_6_AA = get.var.ncdf(SSH_11_6, "sla", start=c(1092, 480, 1), count= c(1,1,1))


# for PC0720 (481, 1095)
SSH_11_6_BB = get.var.ncdf(SSH_11_6, "sla", start=c(1095, 481, 1), count= c(1,1,1))


# for PC1510 (481, 1087)
SSH_11_6_CC = get.var.ncdf(SSH_11_6, "sla", start=c(1087, 481, 1), count= c(1,1,1))


#for PC0710 (482, 1096)
SSH_11_6_DD = get.var.ncdf(SSH_11_6, "sla", start=c(1096, 482, 1), count= c(1,1,1))


letters = c("A", "B", "C", "D","E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "BB", "CC", "DD")

SSH = c(SSH_11_6_A, SSH_11_6_B, SSH_11_6_C, SSH_11_6_D, SSH_11_6_E, SSH_11_6_F, SSH_11_6_G, SSH_11_6_H, SSH_11_6_I, SSH_11_6_J, SSH_11_6_K, SSH_11_6_L, SSH_11_6_M, SSH_11_6_N, SSH_11_6_O, SSH_11_6_P, SSH_11_6_Q, SSH_11_6_R, SSH_11_6_S, SSH_11_6_T, SSH_11_6_U, SSH_11_6_V, SSH_11_6_W, SSH_11_6_X, SSH_11_6_Y, SSH_11_6_Z, SSH_11_6_AA, SSH_11_6_BB, SSH_11_6_CC, SSH_11_6_DD)

working <- data.frame(cbind(letters, SSH))