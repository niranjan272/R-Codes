# specdata<-dir.create("C:\\Users\\Niranjan\\Documents\\R\\specdata")
# setwd("specdata/")
files <- list.files()
for (file in files){
  if (!exists("dataset_file")) {
    dataset_file <- read.csv(file)
  }
  else if(exists("dataset_file")){
    temp_data <- read.csv(file)
    dataset_file <- rbind(dataset_file,temp_data)
    rm(temp_data)
  }
}
