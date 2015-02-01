library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

Vwnd = open.ncdf("vwnd.mon.mean.nc")

latsV = get.var.ncdf(Vwnd, "lat")

lonsV = get.var.ncdf(Vwnd, "lon")

level = get.var.ncdf(Vwnd, "level")  # units are listed in millibars so we want 1000 millibars so that would be level 1



time= get.var.ncdf(Vwnd, "time")

# monthly means from 1948 to 12/31/13  which equals 66 years and 792 months + 4 more complete months= 796
#2006 = 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708
#2007 = 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720
#2008 = 721, 726, 727, 728, 729, 730, 731, 732
#2009 = 733, 738, 739, 740, 741, 742, 743, 744
#2010 = 745, 750, 751, 752, 753, 754, 755, 756
#2011 = 757, 762, 763, 764, 765, 766, 767, 768
#2012 = 769, 774, 775, 776, 777, 778, 779, 780
#2013 = 781, 786, 787, 788, 789, 790. 791, 792
#2014 = 793, 794, 795, 796

# data = open.ncdf("filename")
# 
# #inspect the below data sets 
# #  You want to find the array dimension in each array where your data starts
# #    - we will call this variable latStart, lonStart, and timeStart respectively
# #  Then you want to find the array dimension in each array where you data ends
# #    - we will call this variable latEnd, lonEnd, and timeEnd respectively
# #  Do simple subtraction to get your "count" variables
# #    - latEnd-latStart = latCount 
# #   - etc.
# lats = get.var.ncdf(data, "lat")
# lons = get.var.ncdf(data, "lon")
# times = get.var.ncdf(data, "time")
# 
# #now get your subset
# temps = get.var.ncdf(data, "sst", start=c(lonStart,latStart,timeStart), count=c(lonCount,latCount,timeCount))

# refer to Master_Environmnetal_Cov_Lat_Long_lookup_by_Degree_System to identify which lat and long to start with

##### V WINDS 2006 #####
A_2006 = get.var.ncdf(Vwnd, "vwnd", start= c(108, 26, 1, 697), count= c(1,1,1,17))
as.data.frame(A_2006)
B_2006 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 697), count=c(1,1,1,17))
as.data.frame(B_2006)
C_2006 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 697), count=c(1,1,1,17))
as.data.frame(C_2006)
D_2006 = get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 697), count=c(1,1,1,17))
as.data.frame(D_2006)
E_2006 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 697), count=c(1,1,1,17))
as.data.frame(E_2006)
F_2006 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 697), count=c(1,1,1,17))
as.data.frame(F_2006)
G_2006 = get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 697), count=c(1,1,1,17))
as.data.frame(G_2006)

Vwind2006 <- cbind(A_2006, B_2006, C_2006, D_2006, E_2006, F_2006, G_2006)
colnames(Vwind2006) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2006)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")


##### V WINDS 2007 ####
A_2007 = get.var.ncdf(Vwnd, "vwnd", start= c(108, 26, 1, 709), count= c(1,1,1,17))
B_2007 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 709), count=c(1,1,1,17))
C_2007 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 709), count=c(1,1,1,17))
D_2007 = get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 709), count=c(1,1,1,17))
E_2007 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 709), count=c(1,1,1,17))
F_2007 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 709), count=c(1,1,1,17))
G_2007 = get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 709), count=c(1,1,1,17))
as.data.frame(A_2007)
as.data.frame(B_2007)
as.data.frame(C_2007)
as.data.frame(D_2007)
as.data.frame(E_2007)
as.data.frame(F_2007)
as.data.frame(G_2007)

Vwind2007 <- cbind(A_2007, B_2007, C_2007, D_2007, E_2007, F_2007, G_2007)
colnames(Vwind2007) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2007)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")



##### V WINDS 2008 ####
A_2008 = get.var.ncdf(Vwnd, "vwnd", start= c(108, 26, 1, 721), count= c(1,1,1,17))
B_2008 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 721), count=c(1,1,1,17))
C_2008 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 721), count=c(1,1,1,17))
D_2008 = get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 721), count=c(1,1,1,17))
E_2008 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 721), count=c(1,1,1,17))
F_2008 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 721), count=c(1,1,1,17))
G_2008 = get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 721), count=c(1,1,1,17))
as.data.frame(A_2008)
as.data.frame(B_2008)
as.data.frame(C_2008)
as.data.frame(D_2008)
as.data.frame(E_2008)
as.data.frame(F_2008)
as.data.frame(G_2008)

Vwind2008 <- cbind(A_2008, B_2008, C_2008, D_2008, E_2008, F_2008, G_2008)
colnames(Vwind2008) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2008)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")


##### V WINDS 2009 ####
A_2009 = get.var.ncdf(Vwnd, "vwnd", start= c(108, 26, 1, 733), count= c(1,1,1,17))
B_2009 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 733), count=c(1,1,1,17))
C_2009 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 733), count=c(1,1,1,17))
D_2009= get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 733), count=c(1,1,1,17))
E_2009 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 733), count=c(1,1,1,17))
F_2009 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 733), count=c(1,1,1,17))
G_2009= get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 733), count=c(1,1,1,17))
as.data.frame(A_2009)
as.data.frame(B_2009)
as.data.frame(C_2009)
as.data.frame(D_2009)
as.data.frame(E_2009)
as.data.frame(F_2009)
as.data.frame(G_2009)

Vwind2009 <- cbind(A_2009, B_2009, C_2009, D_2009, E_2009, F_2009, G_2009)
colnames(Vwind2009) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2009)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")



##### V WINDS 2010 ####
A_2010= get.var.ncdf(Vwnd, "vwnd", start = c(108, 26, 1, 745), count=c(1,1,1,17))
B_2010 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 745), count=c(1,1,1,17))
C_2010 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 745), count=c(1,1,1,17))
D_2010 = get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 745), count=c(1,1,1,17))
E_2010= get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 745), count=c(1,1,1,17))
F_2010 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 745), count=c(1,1,1,17))
G_2010 = get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 745), count=c(1,1,1,17))

as.data.frame(A_2010)
as.data.frame(B_2010)
as.data.frame(C_2010)
as.data.frame(D_2010)
as.data.frame(E_2010)
as.data.frame(F_2010)
as.data.frame(G_2010)

Vwind2010 <- cbind(A_2010, B_2010, C_2010, D_2010, E_2010, F_2010, G_2010)
colnames(Vwind2010) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2010)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")



##### V WINDS 2011 ####
A_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(108, 26, 1, 757), count=c(1,1,1,17))
B_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 757), count=c(1,1,1,17))
C_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 757), count=c(1,1,1,17))
D_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 757), count=c(1,1,1,17))
E_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 757), count=c(1,1,1,17))
F_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 757), count=c(1,1,1,17))
G_2011 = get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 757), count=c(1,1,1,17))

as.data.frame(A_2011)
as.data.frame(B_2011)
as.data.frame(C_2011)
as.data.frame(D_2011)
as.data.frame(E_2011)
as.data.frame(F_2011)
as.data.frame(G_2011)

Vwind2011 <- cbind(A_2011, B_2011, C_2011, D_2011, E_2011, F_2011, G_2011)
colnames(Vwind2011) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2011)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")




##### V WINDS 2012 ####
A_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(108, 26, 1, 769), count=c(1,1,1,17))
B_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 26, 1, 769), count=c(1,1,1,17))
C_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(109, 25, 1, 769), count=c(1,1,1,17))
D_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(110, 25, 1, 769), count=c(1,1,1,17))
E_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 25, 1, 769), count=c(1,1,1,17))
F_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(111, 26, 1, 769), count=c(1,1,1,17))
G_2012 = get.var.ncdf(Vwnd, "vwnd", start = c(112, 26, 1, 769), count=c(1,1,1,17))

as.data.frame(A_2012)
as.data.frame(B_2012)
as.data.frame(C_2012)
as.data.frame(D_2012)
as.data.frame(E_2012)
as.data.frame(F_2012)
as.data.frame(G_2012)

Vwind2012 <- cbind(A_2012, B_2012, C_2012, D_2012, E_2012, F_2012, G_2012)
colnames(Vwind2012) <- c("A", "B", "C", "D", "E", "F", "G")
rownames(Vwind2012)<- c("PJanuary", "PFebruary", "PMarch", "PApril", "PMay", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March", "April", "May")

