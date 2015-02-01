# May 20, 2014# extracting zonal wind speed from NCEP

library(maps)
library(spam)
library(fields)
library(chron)
library(ncdf)

Uwnd = open.ncdf("uwnd.10m.mon.mean.nc")

Vwnd = open.ncdf("vwnd.10m.mon.mean.nc")

latsU = get.var.ncdf(Uwnd, "lat") # gives you a grid of 349 y and 277 x with a lat value at each coordinate
latsU[1,1:277] #pick the lat that matches - latitude varies along the 277 y entries so resulting NARR name for lat will be some value between  [1:277] where values for these are in the spreadsheet lat_long_lookup.xlsx following respective tab for zonal wind

lonsU = get.var.ncdf(Uwnd, "lon")
lonsU[1:349,1] #pick the long that matches- longitude varies along the 349 x entries so the resulting NARR name for lon will be some value between [1:349]. The values for these are in the lat-long-lookup.xlsx following respective tab for zonal wind. 

time = get.var.ncdf(Uwnd, "time") # monthly means from 1979-Dec 31 2013 which equals 420 months. We are interested in June-December from 2006-2012
# 1979=1-12
# 1980=13-24
# 1981=25-36
# 1982= 37-48
# 1983= 49-60
# 1984= 61-72
# 1985= 73-84
# 1986= 85-96
# 1987= 97-108
# 1988= 109-120
# 1989= 121-132
# 1990= 133-144
# 1991= 145-156
# 1992= - 168
# 1993=- 180
# 1994= - 192
# 1995= - 204
# 1996= - 216
# 1997= - 228
# 1998= - 240
# 1999= - 252
# 2000= - 264
# 2001= - 276
# 2002= - 288
# 2003= - 300
# 2004= - 312
# 2005= - 324
# 2006= 325- 336, June= 330, July= 331, August= 332, Sep= 333, Oct= 334, Nov= 335, Dec= 336
# 2007= 337- 348, June=342, July= 343,August= 344, Sep= 345, Oct= 346, Nov= 347, Dec= 348
# 2008= 349- 360, june- Dec=354, 355, 356, 357, 358, 359, 360
# 2009= 361- 372, June- Dec= 366, 367, 368, 369, 370, 371, 372
# 2010= 373- 384, June- Dec= 378, 379, 380, 381, 382, 383, 384
# 2011= 385- 396, June- Dec= 390, 391, 392, 393, 394, 395, 396
# 2012= 367- 408, June- Dec= 372, 373, 374, 375, 376, 377, 378
# 2013= 409- 420, June- Dec= 414, 415, 416, 417, 418, 419, 420 

# See Lat-Long_lookup.xlsx in Thesis Project for R code name corresponding to station names

#Uwnds= get.var.ncdf(Uwnds, "uwnd", start=c(lonStart, latStart, timeStart), count=c(lonCount, latCount, timeCount))

UwndJu2006_A= get.var.ncdf(Uwnd, "uwnd", start=c(271, [1,137] ,330), count=c(1,1,1))

