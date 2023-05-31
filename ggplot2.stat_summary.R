library(ggplot2)

#viagra example
libido <- c(3, 2, 1, 1, 4, 5, 2, 4, 2, 3, 7, 4, 5, 3, 6)
dose <- gl(3, 5, labels = c("Placebo", "Low Dose", "High Dose"))
viagraData <- data.frame(libido, dose)
viagraData

#error graph visualize(with error bar)
#geom = "errorbar"
ggplot(data = viagraData, aes(x = dose, y = libido)) +
  stat_summary(geom = "point", fun.y = mean) +
  stat_summary(geom = "errorbar", fun.data = mean_cl_boot, width = 0.2) +
  labs(y = "Mean Libido", x = "Dose of Viagra") +
  stat_summary(fun.y = mean, geom = "line", group = 3)
