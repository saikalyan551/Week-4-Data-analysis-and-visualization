


library(ggplot2)

data <- read.csv("Combined_Data_World Happiness.csv")

print(names(data))




# Create a new variable for color
data$color_2018 <- ifelse(data$Happiness.Score_2018 > mean(data$Happiness.Score_2018), "above_mean", "below_mean")
data$color_2019 <- ifelse(data$Happiness.Score_2019 > mean(data$Happiness.Score_2019), "above_mean", "below_mean")

# Create scatter plot for 2018
ggplot(data, aes(x=Perceptions.of.corruption_2018, y=Happiness.Score_2018, color=color_2018, label=Country.or.region)) +
  geom_point() +
  geom_text(check_overlap = TRUE, size = 3) +
  xlab('Perceptions of Corruption (2018)') +
  ylab('Happiness Score (2018)') +
  ggtitle('Happiness Score vs Perceptions of Corruption (2018)') +
  scale_color_manual(values=c("below_mean"="blue", "above_mean"="red"))

# Create scatter plot for 2019
ggplot(data, aes(x=Perceptions.of.corruption_2019, y=Happiness.Score_2019, color=color_2019, label=Country.or.region)) +
  geom_point() +
  geom_text(check_overlap = TRUE, size = 3) +
  xlab('Perceptions of Corruption (2019)') +
  ylab('Happiness Score (2019)') +
  ggtitle('Happiness Score vs Perceptions of Corruption (2019)') +
  scale_color_manual(values=c("below_mean"="blue", "above_mean"="red"))

