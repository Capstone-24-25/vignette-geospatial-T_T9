# Data Pre-Processing
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

# Perform Geographically Weighted Regression

gwr_model <- gwr.basic(
  formula = gwr_formula,
  data = gwr_data,
  bw = bw, 
  adaptive = T)

gwr_result <- gwr_model$SDF
summary(gwr_result)
head(gwr_result)

gwr_sf <- st_as_sf(gwr_result)

ggplot(data = gwr_sf) +
  geom_sf(aes(color = avg_DriveAlone_Dist)) + 
  scale_color_viridis_c() +  
  theme_minimal() +
  labs(title = "Spatial Variation of avg_DriveAlone_Dist Coefficient", 
       color = "Coefficient Value")

ggplot(data = gwr_sf) +
  geom_sf(aes(color = avg_Driveothers_Dist)) +  
  scale_color_viridis_c() +  
  theme_minimal() +
  labs(title = "Spatial Variation of avg_Driveothers_Dist Coefficient", 
       color = "Coefficient Value")

ggplot(data = gwr_sf) +
  geom_sf(aes(color = avg_Passenger_Dist)) +  
  scale_color_viridis_c() + 
  theme_minimal() +
  labs(title = "Spatial Variation of avg_Passenger_Dist Coefficient", 
       color = "Coefficient Value")

ggplot(data = gwr_sf) +
  geom_sf(aes(color = avg_Walk_Dist)) +  
  scale_color_viridis_c() +  
  theme_minimal() +
  labs(title = "Spatial Variation of avg_Walk_Dist Coefficient", 
       color = "Coefficient Value")

ggplot(data = gwr_sf) +
  geom_sf(aes(color = avg_Bike_Dist)) +  
  scale_color_viridis_c() +  
  theme_minimal() +
  labs(title = "Spatial Variation of avg_Bike_Dist Coefficient", 
       color = "Coefficient Value")

