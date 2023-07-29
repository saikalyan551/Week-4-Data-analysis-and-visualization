# Load the necessary libraries
library(ggplot2)
library(dplyr)

# Read the happiness_dataset
happiness_data <- read.csv("Combined_Data_World_Happiness.csv")

print(names(happiness_data))


# 2018 Healthy life expectancy histogram
ggplot(data, aes(x = Healthy.life.expectancy_2018)) + 
  geom_histogram(fill = 'blue', alpha = 0.7, bins = 20) +
  theme_minimal() +
  labs(title = '2018 Healthy life expectancy',
       x = 'Healthy life expectancy',
       y = 'Frequency')

# 2018 Happiness Score histogram
ggplot(data, aes(x = Happiness.Score_2018)) + 
  geom_histogram(fill = 'green', alpha = 0.7, bins = 20) +
  theme_minimal() +
  labs(title = '2018 Happiness Score',
       x = 'Happiness Score',
       y = 'Frequency')

# 2019 Healthy life expectancy histogram
ggplot(data, aes(x = Healthy.life.expectancy_2019)) + 
  geom_histogram(fill = 'blue', alpha = 0.7, bins = 20) +
  theme_minimal() +
  labs(title = '2019 Healthy life expectancy',
       x = 'Healthy life expectancy',
       y = 'Frequency')

# 2019 Happiness Score histogram
ggplot(data, aes(x = Happiness.Score_2019)) + 
  geom_histogram(fill = 'green', alpha = 0.7, bins = 20) +
  theme_minimal() +
  labs(title = '2019 Happiness Score',
       x = 'Happiness Score',
       y = 'Frequency')
