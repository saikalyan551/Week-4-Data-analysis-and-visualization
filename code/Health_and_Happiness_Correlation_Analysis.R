# Load the necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("Combined_Data_World Happiness.csv")

print(names(data))


# Bin the healthy life expectancy variable into deciles
data <- data %>%
  mutate(`Healthy life expectancy decile_2018` = ntile(`Healthy.life.expectancy_2018`, 10),
         `Healthy life expectancy decile_2019` = ntile(`Healthy.life.expectancy_2019`, 10))

# Calculate the average happiness score for each decile of the healthy life expectancy for 2018 and 2019
average_happiness_2018_health <- data %>% group_by(`Healthy life expectancy decile_2018`) %>% summarise(`Average Happiness Score` = mean(`Happiness.Score_2018`))
average_happiness_2019_health <- data %>% group_by(`Healthy life expectancy decile_2019`) %>% summarise(`Average Happiness Score` = mean(`Happiness.Score_2019`))

# Create overlapping histogram for healthy life expectancy
ggplot() +
  geom_histogram(data = average_happiness_2018_health, aes(x = `Average Happiness Score`, fill = "2018"), alpha = 0.5, bins = 30, position = 'identity') +
  geom_histogram(data = average_happiness_2019_health, aes(x = `Average Happiness Score`, fill = "2019"), alpha = 0.5, bins = 30, position = 'identity') +
  labs(title = "Distribution of Average Happiness Score for Healthy Life Expectancy Deciles (2018-2019)", x = "Average Happiness Score", y = "Frequency") +
  scale_fill_manual(values = c("skyblue", "red"), name = "Year")
