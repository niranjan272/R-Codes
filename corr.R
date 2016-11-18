corr <- function(directory, threshold =0){
  filer_file <- c(1:332) 
  #print(filer_file)
  for(id_file in filer_file){
    if(!exists("data_threshold")){
      data_threshold <- subset(dataset_file,ID == id_file)
      #print(head(data_threshold,10))
      non_na <- nrow(na.omit(data_threshold))
      data_threshold$Count <- non_na
      #print(colnames(data_threshold))

    }
    else if(exists("data_threshold")){
      temp_data <- subset(dataset_file,ID == id_file)
      non_na <- nrow(na.omit(temp_data))
      temp_data$Count <- non_na
      #print(colnames(temp_data))
      rbind(data_threshold,temp_data)
      rm(temp_data)
    }
  }
  print(head(data_threshold,10))
  print(tail(data_threshold,10))
}