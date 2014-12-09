pollutantmean <- function(directory, pollutant, id=1:332){
  files_list <- list.files(directory, full.names = TRUE)
  all_data <- data.frame()
  for (i in id) {
    all_data <- rbind(all_data, read.csv(files_list[i]))
    }
    if(pollutant == "nitrate") {
      x <- all_data[is.na(all_data$nitrate)==FALSE,]
      mean(x$nitrate)
    } else if (pollutant == "sulfate") {
      x <- all_data[is.na(all_data$sulfate)==FALSE,]
      mean(x$sulfate)
  }
}
