rankall <- function(outcome, num = "best"){
    # Check outcome
    possible_outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    if(is.na(match(outcome, names(possible_outcomes)))){
        stop("invalid outcome")
    }
    
    # Reading data
    all_data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
    
    # Extracting necessary columns
    my_data <- all_data[, c(2,7,possible_outcomes[outcome])]
    
    # Renaming my_data
    names(my_data) <- c("hospital", "state", outcome)
    
    # Removing na values
    clean_data <- na.omit(my_data)
    
    # Split data based on state
    splited_state_data <- split(clean_data, clean_data$state)
    
    # al <- splited_state_data[['AL']]
    # al <- al[with(al, order(al[, 'heart attack'])),]
    # al[20,]
    
}