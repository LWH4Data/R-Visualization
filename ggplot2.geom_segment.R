library(tidyr)
library(reshape2)
library(ggplot2)
library(dplyr)

#data
W <- c(3, 2, 1, 1, 4)
L <- c(5, 2, 4, 2, 3)
H <- c(7, 4, 5, 3, 6)

#make dataframe and set "id" coulunm
Vdum <- data.frame(W, L, H)
Vdum$id <- c(1:5)
Vdum

#melt dataframe "Vdum" to "Vdum1". The criterion is "id" colunm.
Vdum1 <- melt(Vdum, id.vars = "id", variable.name = "Group", value.name = "libido")
Vdum1$id <- c(1:15)
Vdum1

#visualization each group in "Vdum1". 
p <- ggplot(data = Vdum1, aes(x = id, y = libido)) +
  geom_point(aes(shape = Group, size = 3, color = Group)) +
  scale_color_manual("Group", values = c("W" = "yellow", "L" = "green", "H" = "blue"))

p

#Calculate the mean of each group. Then make it as dataframe.
MV <- Vdum1 %>% 
  group_by(Group) %>% 
  summarize(mean_libido = mean(libido)) %>% 
  as.data.frame
MV

#ggplot2::geom_segment.
#We made a scatterplot whose name is "p" before. We add each mean of groups as horizental line to the scatterplot "p".
p + geom_line(aes(y = mean(libido))) +
  geom_segment(aes(x = 1, xend = 5, y = 2.2, yend = 2.2), color='yellow', size = 1.5) +
  geom_segment(aes(x = 6, xend = 10, y = 3.2, yend = 3.2), color = 'green', size = 1.5) +
  geom_segment(aes(x = 11, xend = 15, y = 5, yend = 5), color = 'blue', size = 1.5)
