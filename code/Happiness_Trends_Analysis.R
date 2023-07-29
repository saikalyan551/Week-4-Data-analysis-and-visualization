


# Assuming that you have loaded your data into a data frame named 'data'

# Install necessary packages
install.packages('dplyr')
install.packages('ggplot2')

# Load the libraries
library(dplyr)
library(ggplot2)

data <- read.csv("Combined_Data_World Happiness.csv")

print(names(data))

# Select the top 10 countries for 2018 and 2019 based on the happiness score
top_countries_2018 <- data %>%
  arrange(desc(Happiness.Score_2018)) %>%
  head(10)

top_countries_2019 <- data %>%
  arrange(desc(Happiness.Score_2019)) %>%
  head(10)

# Plot for 2018
ggplot(top_countries_2018, aes(x=reorder(Country.or.region, Happiness.Score_2018), y=Happiness.Score_2018)) +
  geom_bar(stat='identity', fill='skyblue') +
  coord_flip() +
  xlab('Country') +
  ylab('Happiness Score') +
  ggtitle('Top 10 Countries by Happiness Score in 2018')

# Plot for 2019
ggplot(top_countries_2019, aes(x=reorder(Country.or.region, Happiness.Score_2019), y=Happiness.Score_2019)) +
  geom_bar(stat='identity', fill='skyblue') +
  coord_flip() +
  xlab('Country') +
  ylab('Happiness Score') +
  ggtitle('Top 10 Countries by Happiness Score in 2019')
