# Install and load necessary libraries

library(ggplot2)
library(reshape2)
library(tidyr)



df_combined <- read.csv("Combined_Data_World Happiness.csv")


print(names(df_combined))

# 1. Country-wise Comparisons for GDP per capita
selected_countries <- c("Finland", "Norway", "Denmark", "Switzerland", "Iceland") # select a few countries
df_selected <- df_combined[df_combined$Country %in% selected_countries, ]
df_selected_melted <- melt(df_selected, id.vars = c("Country"), measure.vars = c("GDP.per.capita_2018", "GDP.per.capita_2019"))
ggplot(df_selected_melted, aes(x = Country, y = value, fill = variable)) + geom_bar(stat = "identity", position = "dodge") + ylab("GDP per capita")

# 2. Score Distributions
ggplot(df_combined, aes(x = Happiness.Score_2018)) + geom_histogram(binwidth = 0.5, fill = "blue", alpha = 0.5) + ggtitle("Distribution of Happiness Score for 2018")
ggplot(df_combined, aes(x = Happiness.Score_2019)) + geom_histogram(binwidth = 0.5, fill = "red", alpha = 0.5) + ggtitle("Distribution of Happiness Score for 2019")

# 3. Generosity Comparison
ggplot(df_combined, aes(x = Generosity_2018, y = Generosity_2019)) + geom_point() + xlab("Generosity 2018") + ylab("Generosity 2019") + ggtitle("Generosity Comparison between 2018 and 2019")



# 1. Comparing Generosity Scores
top_5_countries <- head(df_combined[order(-df_combined$Happiness.Score_2019), ], 5)$Country
bottom_5_countries <- head(df_combined[order(df_combined$Happiness.Score_2019), ], 5)$Country
selected_countries <- c(top_5_countries, bottom_5_countries)
df_selected <- df_combined[df_combined$Country %in% selected_countries, ]
ggplot(df_selected, aes(x = Country, y = Generosity_2019, fill = Country)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Generosity Scores of Top 5 and Bottom 5 Countries 2019") +
  theme_minimal() +
  theme(legend.position = "none")


