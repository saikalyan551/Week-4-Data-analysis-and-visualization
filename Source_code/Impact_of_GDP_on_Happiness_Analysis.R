

# Load necessary libraries
library(ggplot2)
library(dplyr)


# Read the dataset
happiness_data <- read.csv("Combined_Data_World_Happiness.csv")

print(names(happiness_data))

# Scatter plot for 2018 
ggplot(happiness_data, aes(x = GDP.per.capita_2018, y = Happiness.Score_2018)) +
  geom_point(color = 'blue', alpha = 0.5) +
  labs(title = 'Impact of GDP on Happiness (2018)',
       x = 'GDP per Capita',
       y = 'Happiness Score')

# Scatter plot for 2019 
ggplot(happiness_data, aes(x = GDP.per.capita_2019, y = Happiness.Score_2019)) +
  geom_point(color = 'green', alpha = 0.5) +
  labs(title = 'Impact of GDP on Happiness (2019)',
       x = 'GDP per Capita',
       y = 'Happiness Score')
