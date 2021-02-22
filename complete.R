complete <- function(directory, id = 1:332){
  data_list <- list.files(path = "specdata files", pattern = ".csv", 
                          full.names = T) 
  ## this is the list of all the specdata files
  ## the file name specdata files was specified so that the R will locate the 
  ## name of files to read.
  ## full.names is set to false as default but I set to true so that the file 
  ## path will be remembered throught the program. Without it, the source might 
  ## not be located properly. 
  x <- numeric() ## assigning an empty numeric vector to x
  
  for(i in id){
    myspecdata <- read.csv(data_list[i]) ## Begin a 'for' loop to read data 
    ## from specdata files
    x <- c(x, sum(complete.cases(myspecdata)))
  }

  data.frame(id, x)
}

