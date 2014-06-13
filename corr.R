corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
      
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
      
    ## Return a numeric vector of correlations
        
     ## get all .csv files in the directory
    csvFiles <- list.files(path=directory, pattern="*.csv", full.names=FALSE) 
    correlations <- vector()
    
    ## Iterate through each file, represented by the "id" parameter
    for ( fileName in csvFiles )
    {
        ## C style string formatting to always produce 3 digit filenames
        fullFileName <- sprintf("%s\\%s",directory,fileName)
        
        fileNumber = as.integer(sub(".csv", "",fileName))
        
        if ( threshold < complete(directory, fileNumber)$nobs )
        {
            #print(sprintf("Threshold met, opening %s\n",fullFileName))
            currentFile <- read.csv(fullFileName)
            
            correlations <- 
                c(correlations, cor(currentFile$sulfate,y=currentFile$nitrate , use="complete.obs"))
            
        }        
    }
    correlations
}