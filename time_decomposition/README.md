# Time decomposition
We expected that time would have a non-linear effect on the latent behavioural state of fish. For example, fish foraging is more likely to occur in the morning and evening, hence foraging behaviour is not expected to increase linearly with time. 

As such, we decomposed our linear time variable using cubic splines to capture potential non- linear relationships between our latent behavioural state and time. We tested splines with a range of degrees of freedom (3-9) in our model to identify the optimum number of knots to include. 

The number of knots was included as a variable we tested in the cross-validation routine. We did not include knots > 9, because this resulted in under-identified SEMs (when at least one parameter cannot be identified). Splines were created using the ns function of the splines package in R. 