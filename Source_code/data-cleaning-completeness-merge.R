
#Load library
library(readr)
library(dplyr)
library(tidyverse)

install.packages('tidyverse')

# Read the data
happiness_report_2018 <- read_csv("2018.csv")
happiness_report_2019 <- read_csv("2019.csv")


# Check for missing values in the 2018 and 2019 Happiness Report
missing_values_2018 <- colSums(is.na(happiness_report_2018))
missing_values_2019 <- colSums(is.na(happiness_report_2019))

# Drop any rows that have missing values
happiness_report_2018_cleaned <- happiness_report_2018 %>% drop_na()
happiness_report_2019_cleaned <- happiness_report_2019 %>% drop_na()

# Check for duplicate rows
happiness_report_duplicate_rows_2018 <- sum(duplicated(happiness_report_2018_cleaned))
happiness_report_duplicate_rows_2019 <- sum(duplicated(happiness_report_2019_cleaned))

# Drop any duplicate rows
happiness_report_2018_cleaned <- happiness_report_2018_cleaned %>% distinct()
happiness_report_2019_cleaned <- happiness_report_2019_cleaned %>% distinct()

happiness_report_2018 <- happiness_report_2018_cleaned
happiness_report_2019 <- happiness_report_2018_cleaned



# Change the columns
happiness_report_2018 <- rename(happiness_report_2018, Country = `Country or region`, `Happiness Score` = Score)
happiness_report_2019 <- rename(happiness_report_2019, Country = `Country or region`, `Happiness Score` = Score)


print(names(happiness_report_2018))
print(names(happiness_report_2019))


# Excluding the "Country" column, add a suffix to the column names to identify the year.
names(happiness_report_2018) <- ifelse(names(happiness_report_2018) == "Country", "Country", paste0(names(df_2018), "_2018"))
names(happiness_report_2019) <- ifelse(names(happiness_report_2019) == "Country", "Country", paste0(names(df_2019), "_2019"))

# Merge the Happiness Report on the 'Country' column
happiness_report_combined <- merge(happiness_report_2018, df_2019, by = "Country")

#
write.csv(happiness_report_combined, "Combined_Data_World Happiness.csv", row.names = FALSE)