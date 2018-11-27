
# methods for Aloes paper - spatial join to 

# 1. summarise wdpa data by year

library(rgdal)
library(maptools)
library(sp)
library(rgeos)
library(sf)
library(dplyr)
library(readr)

# read in all the PA points data
PA_points = sf::read_sf("PA_points_2018.shp")

# remove those that have no designation status
PA_points_des = subset(PA_points, STATUS == "Designated")

# reduce down to something more manageable - filter on countries where points occur
# use ISO code to filter

PA_point_sub = subset(PA_points_des, ISO3 == "BFA" |
                       ISO3 == "COD"|
                       ISO3 == "DJI"|
                       ISO3 == "ERI"|
                       ISO3 == "ETH"|
                       ISO3 == "KEN"|
                       ISO3 == "NGA"|
                       ISO3 == "SOM"|
                       ISO3 == "SUD"|
                       ISO3 == "TAN"|
                       ISO3 == "TOG"|
                       ISO3 == "UGA"
                     )
# check how many have a year of designation value
summary_year = PA_point_sub %>% group_by(STATUS_YR) %>% summarise(n())

# check how many have an area value (to buffer later)
summary_area = PA_point_sub %>% group_by(REP_AREA) %>% summarise(n())

# included points must have a year and an area
included = subset(PA_point_sub, REP_AREA > "0")
included = subset(included, STATUS_YR > "0")

# now set the projection
included_prj = included %>% st_transform(3571)

# buffer points
buff_test = rgeos::gBuffer(included_prj, width=100, byid=TRUE)

# write to file as shapefile
write_sf(included_prj, "test.shp",driver="ESRI Shapefile")





