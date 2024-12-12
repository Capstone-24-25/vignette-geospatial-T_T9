library(sf) 
library(sp)
library(dplyr)
library(GWmodel)
library(ggplot2)
library(mapview)
library(leafpop)

person_data <- readRDS("../Data/PersonData.Rds")
hh_data <- readRDS("../Data/HHData.Rds")
bg_density <- readRDS("../Data/hh_bgDensity.Rds")
shapefile <- st_read("../Data/counties/counties.shp")

head(person_data)
head(hh_data)
head(bg_density)
head(shapefile)

# Merge Data
combine_data <- left_join(person_data, hh_data) %>% left_join(bg_density)
head(combine_data)

summarized_data <- combine_data %>%
  select(hhid, pnum, DriveAlone_Dist, Driveothers_Dist, Passenger_Dist, Walk_Dist, Bike_Dist, CTFIP, Sum_PMT) %>%
  group_by(CTFIP) %>%
  summarise(
    avg_DriveAlone_Dist = mean(DriveAlone_Dist, na.rm = T),
    avg_Driveothers_Dist = mean(Driveothers_Dist, na.rm = T),
    avg_Passenger_Dist = mean(Passenger_Dist, na.rm = T),
    avg_Walk_Dist = mean(Walk_Dist, na.rm = T),
    avg_Bike_Dist = mean(Bike_Dist, na.rm = T),
    avg_Sum_Pmt = mean(Sum_PMT, na.rm = T))

# Plot
shapefile_sum <- shapefile %>%
  left_join(summarized_data, by = "CTFIP")

mapviewOptions(fgb = F)

mapview(shapefile_sum, 
        zcol = "avg_Sum_Pmt", # assigned color based on sum distance
        legend = TRUE,
        label = as.character(shapefile_sum$CTFIP),  
        popup = popupTable(shapefile_sum, 
                           zcol = c("avg_DriveAlone_Dist", 
                                    "avg_Driveothers_Dist", 
                                    "avg_Passenger_Dist", 
                                    "avg_Walk_Dist", 
                                    "avg_Bike_Dist",
                                    "avg_Sum_Pmt")))

# Select GWR Bandwidth
coords <- st_coordinates(st_centroid(st_geometry(shapefile_sum)))

gwr_data <- shapefile_sum %>%
  select(avg_DriveAlone_Dist, avg_Driveothers_Dist, avg_Passenger_Dist, avg_Walk_Dist, avg_Bike_Dist, avg_Sum_Pmt) %>%
  st_drop_geometry()

gwr_data <- cbind(gwr_data, coords)

gwr_formula <- avg_Sum_Pmt ~ avg_DriveAlone_Dist + avg_Driveothers_Dist + avg_Passenger_Dist + avg_Walk_Dist + avg_Bike_Dist

# convert to spatial data
coordinates(gwr_data) <- ~X + Y
proj4string(gwr_data) <- CRS("+proj=longlat +datum=WGS84")

# Perform bandwidth selection for GWR
bw <- bw.gwr(
  formula = gwr_formula,
  data = gwr_data,  
  adaptive = T)

# 2.Aggregate Regional Travel Data
## Summarize travel modes by region
trip_summary <- hh_data %>%
  group_by(region_id) %>%
  summarise(
    mean_walk_trips = mean(Walk_trips, na.rm = TRUE),
    mean_bike_trips = mean(Bike_trips, na.rm = TRUE),
    mean_drive_trips = mean(DriveAlone_trips, na.rm = TRUE)
  )

# 4. Prepare Spatial Data

