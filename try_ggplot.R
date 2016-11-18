library(datasets)
library(ggplot2)
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()
ggplot()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) +  geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +   geom_point()

str(diamonds)
ggplot(diamonds,aes(x = diamonds$carat,y = diamonds$price)) + geom_point()
ggplot(diamonds,aes(x = diamonds$carat,y = diamonds$price)) + geom_point() + geom_smooth()
ggplot(diamonds,aes(x = diamonds$carat,y = diamonds$price)) + geom_smooth()
ggplot(diamonds,aes(x = carat,y= price, col = clarity))+geom_smooth()
ggplot(diamonds,aes(x = carat,y= price, col = clarity))+geom_point(aes(0.4))

