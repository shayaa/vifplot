# Dynamic VIF Plot

This shiny app demonstrates the dynamic variance inflation factor described by Stine (1995) using the Duncan dataset of the prestige of 45 U.S. occupations in 1950 from the car package. We can dynamically examine the multicolliearity that exists between the occupation type, and the income, education and prestige levels.  

Let $P_{(-j)}$ indicate a projection matrix of of all the covariates in a linear model except $X_j$ we can state the estimated residuals in terms of a control parameter $\lambda$. That is, 
\[\hat{\epsilon}_j(\lambda)= (I- \lambda P_{(-j)})(X_j- \bar{X}_j)\] 

While 
$$
\begin{align}
\hat{\epsilon}_Y(\lambda) &= (I-\lambda P_{(-j)})(Y- \bar{Y})\\
 &= \hat{\epsilon} + (I -\lambda P_{(-j)}) \hat{\beta}_j(X_j- \bar{X}_j)\\
 &= \hat{\epsilon} + \hat{\beta}_j \hat{\epsilon}_j(\lambda)
 \end{align}
$$

Therefore, we can control lambda to determine the strength of the multicollinearity effect. As $\lambda$ tends to 0 we see the centered partial residual plot, and as $\lambda$ tends to 1 we see the partial regression plot to diagnose multicollinearity.
 


#### Citation

Stine, Robert A. "Graphical interpretation of variance inflation factors." _The
American Statistician_ 49.1 (1995): 53-56.