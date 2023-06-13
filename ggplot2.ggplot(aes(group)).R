library(ggplot2)

#set data
gender <- gl(2, 24, labels = c("Female", "Male"))
alcohol <- gl(3, 8, 48, labels = c("None", "2 Pints", "4 Pints"))
attractiveness <- c(65, 70, 60, 60, 60, 55, 60, 55, 70, 65, 60, 70, 65, 60, 60, 50, 55, 65, 70, 55,
                    55, 60, 50, 50, 50, 55, 80, 65, 70, 75, 75, 65, 45, 60, 85, 65, 70, 70, 80, 60, 30, 30, 30, 55, 35, 20, 45, 40)
gogglesData <- data.frame(gender, alcohol, attractiveness)

#visualize multi factor variables mean.(ggplot(aes(group = variable that we need)))
ggplot(data = gogglesData, aes(x = alcohol, y = attractiveness, color = gender, group = gender)) +
  stat_summary(fun.y = mean, geom = "point", size = 3) +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", size = 1, width = 0.3) +
  stat_summary(fun.y = mean, geom = "line", linewidth = 1)
