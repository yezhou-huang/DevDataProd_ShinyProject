---
title : Shiny Project for Developing Data Product Course
subtitle: Predicting Miles Per Gallon
author: PeterH8
framework: io2012
highlighter: highlight.js
hitheme: tomorrow
widgets: [mathjax]
mode: selfcontained
---

## Problem Definition and Approach

1. Used the `mtcars` dataset in R `datasets` 
2. Trained a linear model for predicting `mpg` (Miles/(US) gallon) from other variables
3. Did model selection by applying stepAIC on initial model `mpg ~ .`
4. Selected `mpg ~ wt + qsec + am`.
5. Reporeted summary of fitted model.
6. User providing values for `wt`, `qsec`, and `am` to do prediction.

---

## Model Selection


```r
library(MASS)
step <- stepAIC(fit6, direction="backward");
```

```r
print(step$anova)
```

```
## Stepwise Model Path 
## Analysis of Deviance Table
## 
## Initial Model:
## mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb
## 
## Final Model:
## mpg ~ wt + qsec + am
## 
## 
##     Step Df Deviance Resid. Df Resid. Dev   AIC
## 1                           21      147.5 70.90
## 2  - cyl  1  0.07987        22      147.6 68.92
## 3   - vs  1  0.26852        23      147.8 66.97
## 4 - carb  1  0.68546        24      148.5 65.12
## 5 - gear  1  1.56497        25      150.1 63.46
## 6 - drat  1  3.34455        26      153.4 62.16
## 7 - disp  1  6.62865        27      160.1 61.52
## 8   - hp  1  9.21947        28      169.3 61.31
```

---

## Retrain selected Model


```r
fit <- lm(mpg ~ wt + qsec + am, data=mtcars);
print(summary(fit))
```

```
## 
## Call:
## lm(formula = mpg ~ wt + qsec + am, data = mtcars)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -3.481 -1.556 -0.726  1.411  4.661 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    9.618      6.960    1.38  0.17792    
## wt            -3.917      0.711   -5.51    7e-06 ***
## qsec           1.226      0.289    4.25  0.00022 ***
## am             2.936      1.411    2.08  0.04672 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.46 on 28 degrees of freedom
## Multiple R-squared:  0.85,	Adjusted R-squared:  0.834 
## F-statistic: 52.7 on 3 and 28 DF,  p-value: 1.21e-11
```

---

## Example of Prediction and Pointers


```r
mpgPrediction <- function(df) predict(fit, newdata=df)[[1]]
cat("Prediction of (wt=3.3, qsec=17.7, am = 'Automatic'):", 
    mpgPrediction(data.frame(wt=3.3, qsec=17.7, am=0)))
```

```
## Prediction of (wt=3.3, qsec=17.7, am = 'Automatic'): 18.39
```
1. The Application can be found [here](http://peterh8.shinyapps.io/Course_Project/).
2. The R code can be found at [my github repository](https://github.com/PeterH8/DevDataProd_ShinyProject).

