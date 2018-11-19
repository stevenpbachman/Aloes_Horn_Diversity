
# methods for Aloes paper

# 1. summarise wdpa data by year

library(rgdal)
library(maptools)
library(sp)
library(rgeos)
PAs <- readOGR(dsn = ".", layer = "study_area_PAs", stringsAsFactors = FALSE) #
class(PAs)

# get the unique years to feed into the loop later
uniqueyears = unique(PAs$STATUS_YR)



# for loop that takes each year in dataset and gets protected areas 
for (i in uniqueyears){
  PA = subset(PAs,PAs$STATUS_YR <= i & PAs$STATUS_YR != "0" ) # query shape year 
  PAs_union  = unionSpatialPolygons(PA , PA$NO_TK_AREA)
  PAs_union_SPDF = as(PAs_union, "SpatialPolygonsDataFrame")
  filename = paste0("PA_",i) # set up filename
  writeOGR(obj=testingPA, dsn=getwd(), layer=filename, driver="ESRI Shapefile") # save it down - this is in geographical projection
}

