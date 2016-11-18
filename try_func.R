data_corr_unfilter <- dataset_file
data_corr_unfilter$non_na <- nrow(na.omit(data_corr_unfilter))
print(head(data_corr_unfilter))