
# methods for Aloes paper

# 1. summarise wdpa poly data

library(rgdal)
library(maptools)
library(sp)
library(rgeos)
PA_polys <- readOGR(dsn = ".", layer = "study_area_PAs", stringsAsFactors = FALSE) #



# get the unique years to feed into the loop later
uniqueyears = unique(PAs$STATUS_YR)
# remove 0 as year
uniqueyears = uniqueyears[-4]


# for loop that takes each year in dataset and gets protected areas 
for (i in uniqueyears){
  PA = subset(PAs,PAs$STATUS_YR <= i & PAs$STATUS_YR != "0" ) # query shape year 
  PAs_union  = unionSpatialPolygons(PA , PA$NO_TK_AREA)
  PAs_union_SPDF = as(PAs_union, "SpatialPolygonsDataFrame")
  filename = paste0("test/PA_",i) # set up filename
  writeOGR(obj=PAs_union_SPDF, dsn=getwd(), layer=filename, driver="ESRI Shapefile") # save it down - this is in geographical projection
}

plot(PA)

