library(insight) # to get R squared of rlmer

r_squared <- function(model) {
  
  r_squared_marginal <-  get_variance_fixed(model) / 
    (get_variance_fixed(model) + get_variance_random(model) + get_variance_residual(model))
  
  r_squared_conditional <- (get_variance_fixed(model) + get_variance_random(model)) / 
    (get_variance_fixed(model) + get_variance_random(model) + get_variance_residual(model))
  
  return(paste(
    "R-squared (marginal):", r_squared_marginal,
    "R-squared (conditional):", r_squared_conditional
  ))
}
