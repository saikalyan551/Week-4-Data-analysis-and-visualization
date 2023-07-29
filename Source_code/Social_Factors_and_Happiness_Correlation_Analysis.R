# Load the necessary libraries
library(ggplot2)
library(dplyr)

# Read the happiness_dataset
happiness_data <- read.csv("Combined_Data_World_Happiness.csv")

print(names(happiness_data))


# Bin the social support and freedom variables into deciles
happiness_data <- happiness_data %>%
  mutate(`Social support decile_2018` = ntile(`Social.support_2018`, 10),
         `Social support decile_2019` = ntile(`Social.support_2019`, 10),
         `Freedom decile_2018` = ntile(`Freedom.to.make.life.choices_2018`, 10),
         `Freedom decile_2019` = ntile(`Freedom.to.make.life.choices_2019`, 10))

# Calculate the average happiness score for each decile of the social factors for 2018 and 2019
average_happiness_2018_social <- happiness_data %>% group_by(`Social support decile_2018`) %>% summarise(`Average Happiness Score` = mean(`Happiness.Score_2018`))
average_happiness_2019_social <- happiness_data %>% group_by(`Social support decile_2019`) %>% summarise(`Average Happiness Score` = mean(`Happiness.Score_2019`))

average_happiness_2018_freedom <- happiness_data %>% group_by(`Freedom decile_2018`) %>% summarise(`Average Happiness Score` = mean(`Happiness.Score_2018`))
average_happiness_2019_freedom <- happiness_data %>% group_by(`Freedom decile_2019`) %>% summarise(`Average Happiness Score` = mean(`Happiness.Score_2019`))

# Create line plot for social support
ggplot() +
  geom_line(happiness_data = average_happiness_2018_social, aes(x = `Social support decile_2018`, y = `Average Happiness Score`, color = "2018"), size = 1) +
  geom_line(happiness_data = average_happiness_2019_social, aes(x = `Social support decile_2019`, y = `Average Happiness Score`, color = "2019"), size = 1) +
  labs(title = "Average Happiness Score vs Social Support Deciles (2018-2019)", x = "Social Support Deciles", y = "Average Happiness Score") +
  scale_color_manual(values = c("Slateblue", "DarkOrange"), name = "Year")

# Create line plot for freedom
ggplot() +
  geom_line(happiness_data = average_happiness_2018_freedom, aes(x = `Freedom decile_2018`, y = `Average Happiness Score`, color = "2018"), size = 1) +
  geom_line(happiness_data = average_happiness_2019_freedom, aes(x = `Freedom decile_2019`, y = `Average Happiness Score`, color = "2019"), size = 1) +
  labs(title = "Average Happiness Score vs Freedom to Make Life Choices Deciles (2018-2019)", x = "Freedom to Make Life Choices Deciles", y = "Average Happiness Score") +
  scale_color_manual(values = c("Slateblue", "DarkOrange"), name = "Year")

            

