complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
    
    nobs <- c()
    
    ## Iterate through each file, represented by the "id" parameter
    for ( fileNumber in id )
    {
        ## C style string formatting to always produce 3 digit filenames
        fileName <- sprintf("%s\\%03d.csv",directory,fileNumber)
        currentFile <- read.csv(fileName)
        
        cc <- complete.cases(currentFile)   ## vector of true/false indicating complete cases        
        ccTrue <- cc[cc==TRUE]              ## reduce to vector of only true values
        ccTrueCount <- length(ccTrue)       ## count the true values
        nobs <- c(nobs,ccTrueCount)
        
        ## store the id and count of complete cases
        #resultantFrame <- resultantFrame + c(id,ccTrueCount)    
    }

}