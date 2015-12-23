corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    file_lists <- list.files(directory, full.names = TRUE)
    output <- c()
    
    for (i in 1:332) {
        
        dat <- read.csv(file_lists[i])
        tmp <- dat[complete.cases(dat), ]
        nobs <- nrow(tmp)
        
        if (nobs > threshold) {
            output <- c(output, cor(tmp$sulfate, tmp$nitrate))
        }
    }
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    output
}