# Setup
setwd("C:/Users/kevin/Downloads")
library(ggplot2)
reps <- 100#000

# Get real G-Day measures from https://www.ncei.noaa.gov/news/groundhog-day-forecasts-and-climate-history
dat_phil <- read.csv("phil_2023.csv")
dat_noaa <- read.csv("noaa_1895-2022.csv")

# Calculate early springs (1) or no (0)
springs <- 

# Calculate Phil's accuracy
acc_phil <- 

# Simulate a coin toss
acc_coin <- rep(NA, reps)
for(i in 1:reps){
  # Predict early spring (1) or no (0) as often as Phil
  predn <- rbinom(N, 1, .50) / N
  
  # Calculate coin's accuracy
  acc_coin[i] <- 
}

# Plot the distribution
