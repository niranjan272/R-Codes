complete <- function(directory,ID = 1:332){
  filer_file <- c(ID) 
  for(id_file in filer_file){
    filter_data <- subset(dataset_file,ID == id_file)
    non_na <- nrow(na.omit(filter_data))
    #nrow(na.omit(filter_data))
    print(paste(id_file,non_na,sep = "-->"))
  }
}

# filter_data <- subset(dataset_file,ID %in% c(filer_file))
# #print(colnames(filter_data))
# print(nrow(na.omit(filter_data)))
# 