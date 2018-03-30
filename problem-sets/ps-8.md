MATH 392 Problem Set 8
================

The core of this assignment is the creation of a MLR simulator in order to investigate the properties of the method. The model under investigation is the following.

*Y* = *β*<sub>0</sub> + *β*<sub>1</sub>*x*<sub>1</sub> + *β*<sub>2</sub>*x*<sub>2</sub> + *ϵ*;  *ϵ* ∼ *N*(0, *σ*<sup>2</sup>)

You're welcome to select any values that you like for the parameters and any distribution that you like for the *x*'s. The core bit of code should look something like

``` r
# set params
B0 <- ___
B1 <- ___
sigma <- ___

# complete specification
n <- ___
epsilon <- r____()
x <- ___

# simulate ys
```

### Sampling distribution

Use your simulator to create an MC approximation of the true sampling distribution of the estimates of *β*<sub>1</sub>, *E*(*Y*<sub>*s*</sub>), and *Y*<sub>*s*</sub>. How do these distribution compare to the analytical form in terms of center, shape, and spread?

### A different model

Consider two variations on the model:

1.  An alternate distribution of the *x*'s of your choosing.
2.  An alternate distribution for *ϵ* (though it still should be centered at 0).

Does the inference change for the statistics investigated in the previous exercise?

### Variance/Covariance

Generate a scatterplot matrix involving all pairwise relationships between the three simulated regression coefficients in the original model. To be clear, this involves generating a good number fitted betas from your simulator and plotting them. Based on a visual assessment of these plots, please characterize the joint distribution of these statistics in terms of center, shape, spread, and covariance.

**Challenge problem**: If you recognize the family of this joint distribution, use your simulated fitted betas to calculate the MLEs of the parameters.
