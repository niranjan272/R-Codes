getwd()
hw1 <- read.csv("C:\\Users\\Niranjan\\Documents\\R\\hw1_data.csv",header = TRUE)
#data <- head(hw1,n=2)
#print(data)
#print(tail(hw1,2))
#data <- hw1[47,1]
#print(data)
#data <- hw1[!is.na(hw1)]
#print(data)
#print(sum(data))

data <- hw1[hw1["Month"] =="6")]
print(mean(data))
