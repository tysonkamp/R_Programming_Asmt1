pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    ## we declare this to start a vector. We'll remove the 1st 
    ## element later so we can calc the mean.
    dataVector <- NaN
    
    ## Iterate through each file, represented by the "id" parameter
    for ( fileNumber in id )
    {
        ## C style string formatting to always produce 3 digit filenames
        fileName <- sprintf("%s\\%03d.csv",directory,fileNumber)
        currentFile <- read.csv(fileName)
        
        for ( currentRow in 1:length(currentFile[[pollutant]]) )
        {
            if ( FALSE == is.na(currentFile[[pollutant]][currentRow]) )
            {                
                dataVector <- c(dataVector,currentFile[[pollutant]][currentRow])
            }
        }
    }

    mean(dataVector[-1])  ## Remove the 1st element since we know it's NaN
}