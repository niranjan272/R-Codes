# add_try <- function(x,y){
#   x+y
# }

# above10 <-function(x){
#   use <- x>10
#   x[use]
# }
# x<- 1:10
# if(x>5){
#   x<-0
# }
# print(x)

# f <- function(x){
#   g<- function(y){
#     y+z
#   }
#   z <- 4
#   x +g(x)
# }

x <-5
y <- if(x<3){
  NA
}else{
  10
}

print(y)