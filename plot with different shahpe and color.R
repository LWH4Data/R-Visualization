library(tidyr)
library(reshape2)
library(ggplot2)

#data
W <- c(3, 2, 1, 1, 4)
L <- c(5, 2, 4, 2, 3)
H <- c(7, 4, 5, 3, 6)

Vdum <- data.frame(W, L, H)
Vdum$id <- c(1:5)
Vdum

Vdum1 <- melt(Vdum, id.vars = "id", variable.name = "Group", value.name = "libido")
Vdum1$id <- c(1:15)
Vdum1

#visualization each group in "Vdum1"
ggplot(data = Vdum1, aes(x = id, y = libido)) +
  geom_point(aes(shape = Group, size = 3, color = Group)) +
  scale_color_manual("Group", values = c("W" = "yellow", "L" = "green", "H" = "blue"))