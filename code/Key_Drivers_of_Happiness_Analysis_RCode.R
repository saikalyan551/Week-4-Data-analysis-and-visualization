# Install and load necessary libraries

library(corrplot)



df <- read.csv("Combined_Data_World Happiness.csv")


print(names(df))


# Select relevant columns for 2018 and 2019
columns_2018 <- c('Happiness.Score_2018', 'GDP.per.capita_2018', 'Social.support_2018', 
                  'Freedom.to.make.life.choices_2018', 'Generosity_2018', 'Perceptions.of.corruption_2018')

columns_2019 <- c('Happiness.Score_2019', 'GDP.per.capita_2019', 'Social.support_2019', 
                  'Freedom.to.make.life.choices_2019', 'Generosity_2019', 'Perceptions.of.corruption_2019')

# Calculate correlation matrices for 2018 and 2019
corr_2018 <- cor(df[, columns_2018])
corr_2019 <- cor(df[, columns_2019])

# Use corrplot to generate the correlation heatmaps
corrplot(corr_2018, method="color", type="upper", order="hclust", 
         addCoef.col = "black", # Add correlation coefficients
         tl.col="black", tl.srt=45) # Text label color and rotation

corrplot(corr_2019, method="color", type="upper", order="hclust", 
         addCoef.col = "black", # Add correlation coefficients
         tl.col="black", tl.srt=45) # Text label color and rotation



