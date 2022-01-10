# Script for importing course data and data exploration

library(tidyverse)
df <- read_csv("cancer-data-for-MOOC-1-_1_.csv")

fruit <- df$fruit
veg <- df$veg
fruitveg <- fruit + veg

table(df$gender)
table(df$smoking)
# the one NA is in smoking
table(df$smoking, exclude = NULL)

table(df$exercise)
table(df$cancer)

df$cancer <- as.factor( df$cancer)
ggplot(df) +
  geom_boxplot(aes(x = bmi, color = cancer)) 

hist(df$age, breaks = 20)
hist(df$age, breaks = 5)
hist(df$bmi, breaks = 20)
summary(df$bmi)

df$gender <- as_factor(df$gender)
ggplot(df) +
  geom_boxplot(aes(x = bmi, color = gender))

# bmi distribution seems more normal females
hist(df$bmi[df$gender == 0], main = "bmi for Females", xlab = "bmi")
hist(df$bmi[df$gender == 1], main = "bmi for Males", xlab = "bmi")
