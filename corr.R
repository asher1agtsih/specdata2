corr <- function(directory, threshold = 0){
  data_list <- list.files(path = "specdata files", pattern = ".csv", 
                         full.names = T)
  complete2 <- complete(directory)
  id2 <- complete2[complete2["x"] > threshold, ]$id
  corrr <- numeric()
  
  for(i in id2){
    myspecdata <- read.csv(data_list[i]) ## Begin a 'for' loop to read data 
    ## from specdata files
    
    complete3 <- myspecdata[complete.cases(myspecdata), ]
    corrr <- c(corrr, cor(complete3$sulfate, complete3$nitrate))
  }
  return(corrr)
}