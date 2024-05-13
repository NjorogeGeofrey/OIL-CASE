#Problem 3
#Import the data
library(readxl)
oil_case <- read_excel("Documents/CBS/RM/aRM2 FINAL/Working with/oil_case.xlsx")
oil_case <- as.data.frame(oil_case)
head(oil_case)
str(oil_case)
#Converting variables to their correct format

oil_case$polity <- as.numeric(oil_case$polity)
oil_case$oil_prod32_14 <- as.numeric(oil_case$oil_prod32_14)
oil_case$net_oil_exports_value <- as.numeric(oil_case$net_oil_exports_value)
oil_case$any_oil <- as.numeric(oil_case$any_oil)
oil_case$laborfemale <- as.numeric(oil_case$laborfemale)
oil_case$GDP_cap2000_sup <- as.numeric(oil_case$GDP_cap2000_sup)
oil_case$gdp_growth_Maddison <- as.numeric(oil_case$gdp_growth_Maddison)
oil_case$nat_conflict_onset_2 <- as.numeric(oil_case$nat_conflict_onset_2)
oil_case$pop_maddison <- as.numeric(oil_case$pop_maddison)
oil_case$region <- as.factor(oil_case$region)
oil_case$asia <- as.factor(oil_case$asia)
oil_case$commie <- as.factor(oil_case$commie)
oil_case$ssafrica<- as.factor(oil_case$ssafrica)
oil_case$oecd <- as.factor(oil_case$oecd)
oil_case$me_nafr <- as.factor(oil_case$me_nafr)
oil_case$gulf <- as.factor(oil_case$gulf)
oil_case$latin <- as.factor(oil_case$latin)
oil_case$LDCs <- as.factor(oil_case$LDCs)

#a
library(stargazer)
#Summary statistics.
stargazer(oil_case[, 4:12], type = "text", title="Descriptive statistics", 
          digits=4,out="OIL CASE.txt", covariate.labels=c("Polity" ,"Oil production", "Net Oil exports value", "If a country has any oil", "Labor Female", "GDP per capita in US dollars", "GDP growth", "Nat conflict onset", "Population Size"))

#b
#Visual representation
# Load necessary library
library(ggplot2)


# Visualization for 'oil_prod32_14'
ggplot(oil_case, aes(x = oil_prod32_14)) +
  geom_histogram(bins = 30, fill = "red", color = "blue") +
  labs(x = "Oil Production (Tonnes)",y = "Number of Countries", title = "Histogram of Oil Production") +
  theme_minimal()

# Visualization for 'net_oil_exports_value'
ggplot(oil_case, aes(x = net_oil_exports_value)) +
  geom_histogram(bins = 30, fill = "red", color = "blue") +
  labs(x = "Net Oil Exports Value (USD)",y = "Number of Countries", title = "Histogram of Net Oil Exports Value") +
  theme_minimal()


# Filter out NA values
oil_case_filtered <- oil_case[!is.na(oil_case$any_oil), ]

# Visualization for 'any_oil' with updated labels
ggplot(oil_case_filtered, aes(x = as.factor(any_oil))) +
  geom_bar(fill = "red", color = "blue") +
  scale_x_discrete(labels = c("0" = "Has No Oil",
                              "1" = "Has Oil")) +
  labs(x = "Oil Availability",y = "Number of Countries", title = "Bar Chart of Oil Availability") +
  theme_minimal()



# Visualization for 'polity'
ggplot(oil_case, aes(x = polity)) +
  geom_histogram(bins = 30, fill = "red", color = "blue") +
  labs(x = "Polity Score",y = "Number of Countries", title = "Histogram of Polity Scores") +
  theme_minimal()


#c
#Visual association
library(tidyverse)
ggplot(oil_case, aes(x=oil_prod32_14, y= polity)) +
  geom_point(col='red', size=2) + 
  geom_smooth(method=lm, se=FALSE, col='blue', linetype='dashed') +
  labs(x = "Oil Production",y = "Polity Score", title = "Association Between Polity and Oil Production") +
  theme_bw()


ggplot(oil_case, aes(x=net_oil_exports_value, y= polity)) +
  geom_point(col='red', size=1) + 
  geom_smooth(method=lm, se=FALSE, col='blue', linetype='dashed') +
  labs(x = "Net Exports Value",y = "Polity Score", title = "Association Between Polity and Net Exports") +
  theme_bw()


# Filter out NA values for 'any_oil' and 'polity' variables
oil_case_filtered <- oil_case[!is.na(oil_case$any_oil) & !is.na(oil_case$polity), ]

# Ensure 'any_oil' is a factor with appropriate labels
oil_case_filtered$any_oil <- factor(oil_case_filtered$any_oil, levels = c(0, 1), labels = c("No Oil", "Has Oil"))

# Generate a box plot for better visual representation
ggplot(oil_case_filtered, aes(x = any_oil, y = polity)) +
  geom_boxplot(bins = 30, fill = "red", color = "blue") + 
  labs(x = "Oil Availability", y = "Polity Score", title = "Polity Scores by Oil Possession") +
  theme_minimal()

##tHE SCATTER PLOT
ggplot(oil_case, aes(x=any_oil, y=polity)) +
  geom_point(col='red', size=1) + 
  geom_smooth(method=lm, se=FALSE, col='blue', linetype='dashed') +
  theme_bw()


#d
#Linear regression
Model1 <- lm(polity ~ net_oil_exports_value, data = oil_case)
summary(Model1)
stargazer(Model1, type = "text")

#e
#Multiple Linear regression
Model2 <-  lm(polity ~ oil_prod32_14 + net_oil_exports_value + any_oil, data = oil_case)
summary(Model2)
stargazer(Model2, type = "text")


#Problem 4
#Importing the data
library(readxl)
wdi_subset <- read_excel("Documents/CBS/RM/aRM2 FINAL/Working with/wdi_subset.xlsx")
wdi_subset <- as.data.frame(wdi_subset)
head(wdi_subset)

#C

stargazer(wdi_subset[, 4:10], type = "text", title="Descriptive statistics", 
          digits=2,out="wdi_subset.txt"
          , covariate.labels=c("Age dependency ratio ", "Birth rate per 1000 ", "Expenditure by per capita GDP", "FDI (USD) per capita GDP", "GDP growth", "GDP per capita", "GDP growth negative"))

# within  variance for birthrateper1000_var across countryname
wdi_subset$unit.means <- ave(wdi_subset$birthrateper1000, wdi_subset$countryname) # create new variable with group means
within_birthrateper1000_var<-sum((wdi_subset$birthrateper1000 - wdi_subset$unit.means)^2)/(length(wdi_subset$birthrateper1000) - 1)

within_birthrateper1000_var

# between variance
unit.means <- aggregate(wdi_subset$birthrateper1000, list(wdi_subset$countryname), mean)
grandmean <- mean(wdi_subset$birthrateper1000) 
between_birthrateper1000_var<-sum((unit.means$x - grandmean)^2)/(length(unit.means$x) - 1)
between_birthrateper1000_var

library(plm)
library(lme4)

#d
#Panel regression
panel_data <- pdata.frame(wdi_subset, index = c("countrycode", "year"))
# Panel regression with Fixed Effects
panel_model <- plm(birthrateper1000 ~ gdpgrowth, data = panel_data, model = "within")
summary(panel_model)
stargazer(panel_model, type = "text")
#e
#OLS
# Run OLS regression
ols_model <- lm(birthrateper1000 ~ gdpgrowth, data = wdi_subset)

# Print OLS regression results
summary(ols_model)
stargazer(ols_model, type = "text")


