
pollutantmean <- function(directory,popullant,ID = 1: 332){
      filer_file <- c(ID)
      #print(filer_file)
      if (popullant == "nitrate") {
        pop_id = 3
      }
      else{
        pop_id = 2
      }
      filter_data <- subset(dataset_file,ID %in% c(filer_file))
      #filter_data <- filter(dataset_file,ID %in% c(filer_file))
      # print(head(filter_data,5)) 
      # print(tail(filter_data,5))
      filter_data_popullant <- filter_data[,pop_id]
      #print(head(filter_data_not_na,300))
      filter_data_not_na <- filter_data_popullant[!is.na(filter_data_popullant)]
      #print(head(filter_data_not_na,5))
      mean_data <- mean(filter_data_not_na)
      print(mean_data)
      
}

