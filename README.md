# Survival Analysis with R
# Survival Analysis Project

## Introduction

This project involves the application of survival analysis techniques to understand the survival distributions of two different gender groups. Using the `survfit` and `survdiff` functions from the `survival` package in R, we aim to compare the survival times and determine if there are any significant differences between the groups.

## Project Description
This project delves into survival analysis to compare the survival times between two gender groups. Using R's `survival` package, we analyze time-to-event data to understand and interpret the survival distributions of each group. The project involves creating survival objects, fitting survival curves using the `survfit` function, and plotting these curves to visualize the differences between the groups. Additionally, a log-rank test is performed using the `survdiff` function to statistically compare the survival distributions.

The analysis begins with loading necessary libraries and preparing the data by creating a `Surv` object encapsulating follow-up time and event indicators. We then fit survival curves for each gender group and plot them to visually assess differences. The log-rank test results are interpreted to determine statistical significance.

Our findings reveal that the survival distributions between the two gender groups are not significantly different, as indicated by a high p-value from the log-rank test. This project demonstrates the application of survival analysis techniques in comparing group survival times, providing a comprehensive approach to understanding survival data and drawing meaningful conclusions from the statistical outputs.

## Objectives

1. **Familiarize with survival analysis techniques**: Gain proficiency in using survival analysis methods to analyze time-to-event data.
2. **Compare survival distributions**: Assess whether there are significant differences in survival distributions between two gender groups.
3. **Interpret statistical outputs**: Understand and interpret the results of survival analysis, including survival curves and log-rank test results.

## Steps to Follow

### 1. Loading Libraries

Load the necessary libraries for the project.

```r
library(survival)
library(ggplot2)
```

### 2. Data Preparation

Prepare the data by creating a `Surv` object which encapsulates the time-to-event data.

```r
# Assuming 'fu_time' is follow-up time and 'death' is the event indicator
surv_obj <- Surv(fu_time, death)
```

### 3. Fitting Survival Curves

Fit the survival curves for each gender group using the `survfit` function.

```r
km_fit <- survfit(Surv(fu_time, death) ~ gender)
print(km_fit)
```

### 4. Plotting Survival Curves

Plot the survival curves to visually compare the survival distributions.

```r
plot(km_fit, col=c("blue", "red"), lty=1:2, xlab="Time", ylab="Survival Probability")
legend("topright", legend=c("Gender 1", "Gender 2"), col=c("blue", "red"), lty=1:2)
```

### 5. Log-Rank Test

Perform a log-rank test to statistically compare the survival distributions.

```r
log_rank_test <- survdiff(Surv(fu_time, death) ~ gender)
print(log_rank_test)
```

### 6. Interpretation

Interpret the results of the log-rank test.

```r
# Example of log-rank test output interpretation
# Assuming the output is stored in 'log_rank_test'
summary(log_rank_test)
```

## Example Output

### Survival Curve Fit

```r
Call: survfit(formula = Surv(fu_time, death) ~ gender)

                gender=1 
 time n.risk n.event survival std.err lower 95% CI upper 95% CI
    1    542       7    0.987 0.00482        0.978        0.997
    2    528       4    0.980 0.00606        0.968        0.992
    3    522       3    0.974 0.00685        0.961        0.988
    4    516       4    0.966 0.00776        0.951        0.982
    5    509       3    0.961 0.00839        0.945        0.977
    6    504       0    0.961 0.00839        0.945        0.977
    7    502       1    0.959 0.00859        0.942        0.976
   30    464      19    0.922 0.01174        0.899        0.945
   60    430      17    0.887 0.01399        0.860        0.915
   90    409      12    0.862 0.01534        0.833        0.893
  180    371      28    0.802 0.01796        0.768        0.838
  270    352      10    0.781 0.01876        0.745        0.818
  360    333      11    0.756 0.01959        0.718        0.795
  450    286      24    0.700 0.02121        0.659        0.743
  540    236      27    0.631 0.02289        0.588        0.678
  630    197      18    0.581 0.02391        0.536        0.630
  720    146      16    0.530 0.02504        0.483        0.581
  810    109      16    0.467 0.02654        0.418        0.522
  900     75      16    0.391 0.02832        0.339        0.450

                gender=2 
 time n.risk n.event survival std.err lower 95% CI upper 95% CI
    1    450       5    0.989 0.00493        0.979        0.999
    2    445       3    0.982 0.00622        0.970        0.995
    3    441       2    0.978 0.00694        0.964        0.991
    4    438       2    0.973 0.00760        0.959        0.988
    5    436       2    0.969 0.00819        0.953        0.985
    6    434       1    0.967 0.00847        0.950        0.983
    7    431       0    0.967 0.00847        0.950        0.983
   30    401      20    0.921 0.01281        0.896        0.947
   60    379      11    0.895 0.01460        0.867        0.925
   90    361      12    0.867 0.01629        0.836        0.899
  180    327      15    0.830 0.01821        0.795        0.866
  270    301      14    0.794 0.01981        0.756        0.833
  360    286      10    0.767 0.02086        0.727        0.809
  450    239      20    0.711 0.02283        0.667        0.757
  540    193      20    0.648 0.02474        0.601        0.698
  630    165      14    0.599 0.02615        0.549        0.652
  720    120      27    0.497 0.02814        0.444        0.555
  810     81      15    0.425 0.02960        0.371        0.487
  900     51      10    0.363 0.03121        0.307        0.430
```

### Log-Rank Test Output

```r
> survdiff(Surv(fu_time, death)~gender, rho = 0)
Call:
survdiff(formula = Surv(fu_time, death) ~ gender, rho = 0)

           N Observed Expected (O-E)^2/E (O-E)^2/V
gender=1 548      268      271    0.0365     0.082
gender=2 452      224      221    0.0448     0.082

 Chisq= 0.1  on 1 degrees of freedom, p= 0.8
```

### Interpretation

- **Chi-Squared Test Statistic (Chisq)**: The chi-squared test statistic is 0.1, indicating little difference between observed and expected events.
- **p-value**: The p-value is 0.8, which is greater than the common significance level of 0.05. Therefore, we fail to reject the null hypothesis, meaning there is no significant difference in survival distributions between the two gender groups.

## Conclusion

This project demonstrates the application of survival analysis to compare survival times between different groups. The analysis shows no significant difference in the survival distributions between the two gender groups, as indicated by the high p-value from the log-rank test.