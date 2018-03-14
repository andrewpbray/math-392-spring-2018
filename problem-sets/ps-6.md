MATH 392 Problem Set 6
================

### Macht

Imagine that you are one of the Allied commanders on the Western Front that is slowing advancing through France and scrawling down serial numbers from ruined and captured panzers as you go. Based on your expertise, you're confident that your current force of troops and tanks are sufficient to push far into Germany as long as the German force does not exceed 345 tanks.

Thus far, the serial numbers that have been captured are

``` r
x <- c(47, 126, 285, 318, 142, 55, 231, 102, 
       164, 85, 242, 62, 289, 290)
```

#### Exercise 1.1

Conduct a hypothesis test using the bias-correct MLE for *β* from a Uniform distribution to see if this data is consistent with a model where there are 345 tanks. Said another way, you are assessing two competing hypotheses regarding *θ* when assuming that the series numbers, *X*, follow a uniform distribution, *X* ∼ Unif(0, *θ*). *H*<sub>0</sub> : *θ* = 345 vs. *H*<sub>*A*</sub> : *θ* &gt; 345.

The test statistic that you will be using is $\\hat{\\theta}\_{MLE, corr} = \\frac{n + 1}{n} X\_{max}$.

This is a setting where you are only interested in throwing out that model if the true number exceeds 345. Note that to perform the hypothesis test, you need to find the sampling distribution of the test statistic under the null hypothesis. We have seen several approaches to finding that distribution, including simulation, permutation, large sample theory, and exact analytical derivation.

#### Exercise 1.2

Conduct a second hypothesis test but this time use as your test statistic the method of moments estimator.

$$
\\hat{\\theta}\_{MOM} = 2 \\bar{X}
$$

#### Exercise 1.3

What type of errors are you succeptible to when making decisions using this framework? What are the associated costs of each one?

#### Exercise 1.4

It can be a bit unsettling when two methods of analyzing the same data set lead to different results. The notion of statistical power provides a metric for direct comparison between tests. Calculate the power of these tests in settings where the true parameter takes values of 325, 335, 345, 355, and 365, when taking samples of size *n* = 17. Create a plot of the resulting (point-wise) power curves. Which test statistic is preferred?
