complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names = TRUE)
  vect1=numeric()
  vect2=numeric()
  for(file in id){
    nobs <- sum(complete.cases(read.csv(files_list[file]))) 
    vect1 <- c(vect1, nobs)
    vect2 <- c(vect2, file)
  } 
  output <- data.frame(id=vect2, nobs=vect1)
  output
}