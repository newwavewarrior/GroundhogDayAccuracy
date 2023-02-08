# Setup
setwd("/home/kevin/Documents/GitHub/GroundhogDayAccuracy/data")
library(ggplot2)
reps <- 100#000

# Get real measures from https://www.ncei.noaa.gov/news/groundhog-day-forecasts-and-climate-history
dat_noaa <- read.csv("noaa_1895-2022.csv", skip = 4) # Avg temp Feb-Mar
dat_phil <- read.csv("phil_2023.csv")

# Reformat data
dat_noaa <- tidyr::separate(dat_noaa, col = Date, into = c("Year", NA), sep = 4, convert = TRUE)
dat_noaa$EarlyS <- dat_noaa$Anomaly > 0
dat_phil$EarlyS <- NA
dat_phil$EarlyS[dat_phil$Results == "Saw shadow"] <- FALSE
dat_phil$EarlyS[dat_phil$Results == "No shadow"] <- TRUE
dat_phil <- dat_phil[dat_phil$Year %in% dat_noaa$Year, ]

# Calculate Phil's accuracy
dat_phil$Correct <- dat_phil$EarlyS == dat_noaa$EarlyS
acc_phil = sum(dat_phil$Correct, na.rm = TRUE) / (nrow(dat_phil) - sum(is.na(dat_phil$Correct)))

# Simulate coin toss accuracy rates over n years
acc_coin <- rep(NA, reps)
for(i in 1:reps){
  # Predict n years of early springs
  pred_coin <- sample(c(TRUE, FALSE), size = nrow(dat_noaa), replace = TRUE)
  # Record accuracy
  pred_coin <- pred_coin == dat_noaa$EarlyS
  acc_coin[i] <- sum(pred_coin / length(pred_coin))
}

# Plot the distribution
