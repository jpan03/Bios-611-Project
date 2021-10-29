library(tidyverse)
library(here)
library(dplyr)
library(readr)

## import dataset
Local_Air_Quality <-
  read_csv(here::here("source_data", "Local_Air_Quality.csv"), lazy = FALSE)


## delete repeated data columns
Local_Air_Quality$X <- NULL
Local_Air_Quality$Y <- NULL
Local_Air_Quality$Age_of_Data_at_Check__minutes_ <- NULL
Local_Air_Quality$Hardware_Issues <- NULL

## removing both NULL and missing(Blank,space)
#Local_Air_Quality2 <- filter(Local_Air_Quality, !is.na(Local_Air_Quality$Hardware_Issues))
#Local_Air_Quality3 <- filter(Local_Air_Quality2, !is.na(Local_Air_Quality2$Age_of_Data_at_Check__minutes_))

## reorder columns
#Local_Air_Quality[ , c(18,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)]
#or
Local_Air_Quality %>% select(ObjectId,Last_Check,Current_Particulate_Matter_2_5_, PM_2_5_10_Minute_Avg_, PM_2_5_30_Minute_Avg_, PM_2_5_1_Hour_Avg_, PM_2_5_6_Hour_Avg_,PM_2_5_24_Hour_Avg_, PM_2_5_One_Week_Avg_,	Temp__F_,	Humidity____,	Pressure__mbar_,	Site_Label,	Inside_Outside,	Latitude,	Longitude,	Uptime__Seconds_,	RSSI__WiFi_signal_strength_dBm_)
Local_Air_Quality2 <- Local_Air_Quality[, c(18,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)]
Local_Air_Quality2
## Write data to directory
write_csv(Local_Air_Quality2,
          here::here("derived_data", "Local_Air_Quality_Cleaned.csv"))

# create a folder and name it derived_data in github
 
