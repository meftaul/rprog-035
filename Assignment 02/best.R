best <- function(state, outcome){
    # Reading data
    # outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
    
    # Extracting necessary columns
    # my_data <- outcome[, c(2, 7, 11, 17, 23)]
    
    # Renaming my_data
    # names(my_data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    # Removing na values
    # clean_data <- na.omit(my_data)
    
    # Extract state and outcome data
    # clean_data[which(clean_data$state == "TX"), "heart attack"]
    
    # subset(clean_data$hospital, clean_data$`heart attack` == min(clean_data[which(clean_data$state == "MD"), "heart attack"]))
    
}