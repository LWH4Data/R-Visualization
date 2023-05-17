library(ggplot2)
library(reshape2)
library(gridExtra)

#SpiderLong 데이터프레임 생성(독립설계)
#Make data.frame "SpiderLong", independent two groups "Picture" and "Real Spider"
참가자 <- c(1:24)
Group <- c(rep("Picture", 12), rep("Real Spider", 12))
Anxiety <- c(30, 35, 45, 40, 50, 35, 55, 25, 30, 45, 40, 50, 40, 35, 50, 55, 65, 55, 50, 35, 30, 50, 60, 39)
SpiderLong <- data.frame(참가자, Group, Anxiety)
SpiderLong

#SpiderWide 데이터프레임 생성(반복측정)
#Make data.frame "SpiederWide", one group. Repeated measurement. 
참가자 <- c(1:12)
Picture <- c(30, 35, 45, 40, 50, 35, 55, 25, 30, 45, 40, 50)
real <- c(40, 35, 50, 55, 65, 55, 50, 35, 30, 50, 60, 39)
SpiderWide <- data.frame(참가자, Picture, real)
SpiderWide

#SpiderLong 오차막대
#SpiderLong bar chart with error bar.
SpiderLongBar <- ggplot(data = SpiderLong, aes(x = Group, y = Anxiety)) +
  stat_summary(fun.y = mean, geom = "bar") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange")

#SpiderWide 오차막대
#SpiderWide chart with error bar
#Translate the wide data.frame "SpiderWide" to the long data.frame "SpiderWide2Long" for visualization.
SpiderWide2Long <- melt(SpiderWide, id.vars = "참가자")
SpiderWide2Long
SpiderWide2LongBar <- ggplot(data = SpiderWide2Long, aes(x = variable, y = value)) +
  stat_summary(fun.y = mean, geom = "bar") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange")

#SpiderLongBar와 SpiderWide2Long의 오차막대를 하나의 화면에 출력.
#Print two graphs "SpiderLongBar" and "SpiderWide2LongBar" on one page.
Glist <- arrangeGrob(SpiderLongBar, SpiderWide2LongBar, ncol = 2)
grid.arrange(Glist)

