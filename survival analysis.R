
#-------------------------------- Survival Analysis -------------------------------- 

# Loading required libraries 
library(readxl)
library(survival) # Used for survival analysis
library(ggplot2) # Plotting 
library(pacman)
library(survival)
pacman::p_load(ggplot2, tidyverse, forcats, dplyr, readxl, knitr, ggpubr, nortest, patchwork)

# Importing the dataset 
g <- read.csv(file = "dataset.csv", header = T, sep = ',')


#------------------EDA#------------------

# Checking if the data is loaded correctly
dim(g)

# Checking for column names 
head(g)


#------------------Running Kaplan-meier plots & log rank tests------------------


## Data cleaning 
## Extracting vars (gender, death & follow-up time[fu_time]) from the dataset
gender <- as.factor(g[, "gender"]) # converting gender to categorical var
fu_time <- g[, "fu_time"]
death <- g[, "death"]


## *------------------------------Model 1------------------------------*
## Plotting a Kaplan-Meier plot
km_fit <- survfit(Surv(fu_time, death)~1)
# Surv(fu_time, death): Creates a survival object from follow-up times and event indicators.
# survfit(Surv(fu_time, death)~1): Fits a Kaplan-Meier survival curve for the entire dataset.
# km_fit <- survfit(...): Stores the fitted Kaplan-Meier model in the variable km_fit.

plot(km_fit)#generate a plot showing the estimated survival probability over time for the entire dataset

# Summary of the model 
summary(km_fit, times = c(1:7, 30, 60, 90*(1:10))) 
# The “times” argument gives us control over what time periods we want to see. 
# The above code asks for output every day for the first week, then at 30, 60 and 90 days, and then every 90 days thereafter

## *------------------------------Model 2------------------------------*
# Splitting by gender 
km_gender_fit <-survfit(Surv(fu_time, death)~gender)

# Plotting the model
plot(km_gender_fit)

# Summary of the model 

# Summary of the model 
summary(km_gender_fit, times = c(1:7, 30, 60, 90*(1:10))) 


## Comparing the survival by gender, using a log rank test 
survdiff(Surv(fu_time, death)~gender, rho = 0)
