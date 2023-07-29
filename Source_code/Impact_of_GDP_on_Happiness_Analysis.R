

# Load necessary libraries
library(tidyverse)


# Read the dataset
happiness_data <- read.csv("Combined_Data_World_Happiness.csv")

print(names(happiness_data))


# Reshape the data
happiness_data_melted_2018 <- happiness_data %>% select('Country', 'GDP.per.capita_2018', 'Happiness.Score_2018') %>% 
  rename('GDP per capita' = 'GDP.per.capita_2018', 'Happiness Score' = 'Happiness.Score_2018') %>%
  mutate(Year = '2018')

happiness_data_melted_2019 <- happiness_data %>% select('Country', 'GDP.per.capita_2019', 'Happiness.Score_2019') %>% 
  rename('GDP per capita' = 'GDP.per.capita_2019', 'Happiness Score' = 'Happiness.Score_2019') %>%
  mutate(Year = '2019')

happiness_data_melted <- rbind(happiness_data_melted_2018, happiness_data_melted_2019)

# Create a box plot
happiness_data_melted %>%
  ggplot(aes(x=Year, y=`Happiness Score`, fill=Year)) +
  geom_boxplot() +
  labs(title="Box Plot of Happiness Score by Year", x="Year", y="Happiness Score") +
  theme_minimal()
