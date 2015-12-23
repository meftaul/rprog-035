complete <- function(directory, id = 1:332) {
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    file_lists <- list.files(directory, full.names = TRUE)
    output <- data.frame()
    
    for (i in id) {
        dat <- data.frame()
        dat <- rbind(dat, read.csv(file_lists[i]))
        nobs <- nrow(dat[complete.cases(dat), ])
        output <- rbind(output, c(i, nobs))
    }
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    names(output) <- c("id", "nobs")
    output
    
}