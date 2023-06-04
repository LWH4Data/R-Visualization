library(ggplot2)
library(gridExtra)

#Make dataset
libido <- c(3, 2, 5, 2, 2, 2, 7, 2, 4, 7, 5, 3, 4, 4, 7, 5, 4, 9, 2, 6, 3, 4, 4, 4, 6, 4, 6, 2, 8, 5)
partnerLibido <- c(4, 1, 5, 1, 2, 2, 7, 4, 5, 5, 3, 1, 2, 2, 6, 4, 2, 1, 3, 5, 4, 3, 3, 2, 0, 1, 3, 0, 1, 0)
dose <- c(rep(1, 9), rep(2, 8), rep(3, 13))

#factorize the column "dose". 
dose <- factor(dose, levels = c(1:3), labels = c("Placebo", "Low Dose", "High Dose"))

#Make data.frame
viagraData <- data.frame(dose, libido, partnerLibido)
viagraData

#visualize each group using boxplot.
Participant <- ggplot(data = viagraData, aes(x = dose, y = libido)) +
  geom_boxplot() +
  labs(title = "Participant")

Partner <- ggplot(data = viagraData, aes(x = dose, y = partnerLibido)) +
  geom_boxplot() +
  labs(title = "Partner")

#multiplot
grid.arrange(Participant, Partner, nrow = 1)
