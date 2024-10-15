library(ggplot2)
library(ggpubr)
library(broom)
library(broom.mixed)

residual_plots <- function(model, data) {
  # Augment the model with the data
  #test_data <- data.frame(
  #  .fitted = fitted(model),
  #  .resid = residuals(model)
  #)
  test_data <- augment(model, data = data)
  
  # Residuals vs Fitted plot
  resid_plot <- ggplot(test_data, aes(x = .fitted, y = .resid)) + 
    geom_point() + 
    geom_smooth(method = "loess") +
    geom_hline(yintercept = 0) +
    xlab("Fitted Values") +
    ylab("Standardized \nResiduals") +
    theme_classic() +
    theme(text = element_text(size = 14, color = "black")) +
    theme(axis.text.x=element_text(color="black", size=14)) + 
    theme(axis.text.y=element_text(color="black", size=14))
  
  # QQ plot
  y <- quantile(test_data$.resid, c(0.25, 0.75))
  x <- qnorm(c(0.25, 0.75))
  slope <- diff(y) / diff(x)
  int <- y[1L] - slope * x[1L]
  
  qq_plot <- ggplot(test_data, aes(sample = .resid)) + 
    stat_qq() + 
    geom_abline(slope = slope, intercept = int) +
    xlab("Theoretical Quantiles") +
    ylab("Sample Quantiles") +
    theme_classic() +
    theme(text = element_text(size = 14, color = "black")) +
    theme(axis.text.x=element_text(color="black", size=14)) + 
    theme(axis.text.y=element_text(color="black", size=14))  
  
  hist_data <- data.frame(ranef = ranef(model))
  hist_data2<-hist_data[order(hist_data$ranef.condval),]
  hist_plot <- hist_data2 %>% 
    ggplot(aes(y = ranef.grp, x = ranef.condval)) +
    geom_point() +
    geom_vline(xintercept = 0) +
    geom_linerange(aes(xmin = ranef.condval - 1.96 * ranef.condsd, xmax = ranef.condval + 1.96 * ranef.condsd)) +
    theme_classic() +
    xlab("Value of the Conditional Mean") +
    ylab("Site")
  
  cd<-data.frame(cooks.distance(model)) 
  cd$num <- seq(1, nrow(cd), 1)
  colnames(cd) <- c("Cooksd", "Num")
  lev<-data.frame(hat(model.matrix(model)))
  lev$num <- seq(1, nrow(lev), 1)
  colnames(lev) <- c("Leverage", "Num")
  data <- full_join(cd, lev, by = "Num")
  lev_plot <- data %>% 
    pivot_longer(cols = c(Leverage, Cooksd), names_to = "Variable", values_to = "Value") %>% 
    ggplot(aes(x = Num, y = Value, color = Variable)) +
    geom_hline(yintercept = 4/295) +
    geom_point() +
    theme_classic() +
    theme(legend.position = "inside",
          legend.position.inside = c(0.25, 0.75))
  
  
  # Arrange the plots side by side
  combined_plot <- ggarrange(resid_plot, qq_plot, lev_plot, hist_plot,
                             labels = c("A", "B", "C", "D"),
                             ncol = 2, nrow = 2)
  
  return(combined_plot)
}

