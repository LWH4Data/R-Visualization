#make column
beerpos <- c(1, 43, 15, 40, 8, 
             17, 30, 34, 34, 26,
             1, 7, 22, 30, 40,
             15, 20, 9, 14, 15)
beerneg <- c(6, 30, 15, 30, 12, 
             17, 21, 23, 20, 27,
             -19, -18, -8, -6, -6,
             -9, -17, -12, -11, -6)
beerneut <- c(5, 8, 12, 19, 8,
              15, 21, 28, 26, 27,
              -10, 6, 4, 3, 0,
              4, 9, -5, 7, 13)
winepos <- c(38, 20, 20, 28, 11,
             17, 15, 27, 24, 23,
             28, 26, 34, 32, 24,
             29, 30, 24, 34, 23)
wineneg <- c(-5, -12, -15, -4, -2,
             -6, -2, -7, -10, -15,
             -13, -16, -23, -22, -9,
             -18, -17, -15, -14, -15)
wineneut <- c(4, 4, 6, 0, 6,
              6, 16, 7, 12, 14,
              13, 19, 14, 21, 19,
              7, 12, 18, 20, 15)
waterpos <- c(10, 9, 6, 20, 27,
              9, 19, 12, 12, 21,
              33, 23, 21, 17, 15,
              13, 16, 17, 19, 29)
waterneg <- c(-14, -10, -16, -10, 5,
              -6, -20, -12, -9, -6,
              -2, -17, -19, -11, -10,
              -17, -4, -4, -1, -1)
waterneut <- c(-2, -13, 1, 2, -5,
               -13, 3, 2, 4, 0,
               9, 5, 0, 4, 2,
               8, 10, 8, 12, 10)
participant <- c("P1", "P2", "P3", "P4", "P5",
                 "P6", "P7", "P8", "P9", "P10",
                 "P11", "P12", "P13", "P14", "P15",
                 "P16", "P17", "P18", "P19", "P20")

#make data.frame
attitudeData <- data.frame(beerpos, beerneg, beerneut, winepos, wineneg, wineneut, waterpos, waterneg, waterneut, participant)

#melt the attitudeData to make it Long data
longAttitude <- melt(attitudeData, id = "participant", measured = c("beerpos", "beerneg", "beerneut", "winepos", "wineneg", "wineneut", "waterpos", "waterneg", "waterneut"))
names(longAttitude) <- c("participant", "groups", "attitude")
longAttitude$participant <- as.factor(longAttitude$participant)
summary(longAttitude)

#seperate the 'groups' column to two columns 'drink' and 'imagery'
longAttitude <- longAttitude[, c(1, 2, 3, 5, 4)]
longAttitude$drink <- gl(3, 60, labels = c("Beer", "Wine", "Water"))
longAttitude$imagery <- gl(3, 20, 180, labels = c("Positive", "Negative", "Neutral"))    
summary(longAttitude)
head(longAttitude, 40)

#main effect of drink viz with scale_y_continuous(-30, 50)
ggplot(data = longAttitude, aes(x = drink, y = attitude)) +
  stat_summary(fun.y = mean, geom = "bar") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange") +
  scale_y_continuous(limits = c(-30, 50))

#main effect of drink viz with scale_y_continuous(0, 50)
ggplot(data = longAttitude, aes(x = drink, y = attitude)) +
  stat_summary(fun.y = mean, geom = "bar") +
  stat_summary(fun.data = mean_cl_normal, geom = "pointrange") +
  scale_y_continuous(limits = c(0, 50))

#There is difference between scale_y_continuous(-30, 50) and scale_y_continuous(0, 50). 
#It is caused by ylimits. It scales data and can occur a error of plot.
#If we need to zoom a plot. We must use zoon() function.