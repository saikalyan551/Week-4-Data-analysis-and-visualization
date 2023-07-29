

# Load necessary libraries
library(tidyverse)


# Read the dataset
df <- read.csv("Combined_Data_World Happiness.csv")

print(names(df))


# Reshape the data
df_melted_2018 <- df %>% select('Country', 'GDP.per.capita_2018', 'Happiness.Score_2018') %>% 
  rename('GDP per capita' = 'GDP.per.capita_2018', 'Happiness Score' = 'Happiness.Score_2018') %>%
  mutate(Year = '2018')

df_melted_2019 <- df %>% select('Country', 'GDP.per.capita_2019', 'Happiness.Score_2019') %>% 
  rename('GDP per capita' = 'GDP.per.capita_2019', 'Happiness Score' = 'Happiness.Score_2019') %>%
  mutate(Year = '2019')

df_melted <- rbind(df_melted_2018, df_melted_2019)

# Create a box plot
df_melted %>%
  ggplot(aes(x=Year, y=`Happiness Score`, fill=Year)) +
  geom_boxplot() +
  labs(title="Box Plot of Happiness Score by Year", x="Year", y="Happiness Score") +
  theme_minimal()
