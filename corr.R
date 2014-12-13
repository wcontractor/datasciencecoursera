corr <- function(directory, threshold = 0){
  
  files_list <- list.files(directory, full.names = TRUE)

  
  all_data <- data.frame()
  correlation_vect <- vector()
  
  
  for(i in seq_along(1:332)) {
    all_data <-  read.csv(files_list[i])
    complete_obs <- complete("specdata")
      if(sum(complete_obs) > threshold) {
      corr_data <- cor(all_data$sulfate, all_data$nitrate, use='pairwise.complete.obs')
      correlation_vect <- c(correlation_vect, corr_data)
    }
}
  return(correlation_vect)
}


corr <- function(directory, threshold = 0) {

  id <- 1:332
  id.char <- sprintf("%03d", id)
  file.paths <- paste(directory, '/', id.char, '.csv', sep='')
  
  correlations <- vector("numeric")
  
  for (i in seq_along(id)){
    data <- read.csv(file.paths[i])
    if (sum(complete.cases(data)) >= threshold){
      data.cor <- cor(data[['sulfate']], data[['nitrate']], use='pairwise.complete.obs')
      correlations <- c(correlations, data.cor)
    }
  }
  
  return(correlations)
}
