best <- function(state, outcome){
    
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
    
    ## Check state validation
    all_states <- unique(my_data$state)
    if(is.na(match(state, all_states))){
       stop("invalid state")
    }
    
    # Removing na values
    clean_data <- na.omit(my_data)
    
    # Extract state data
    state_data <- clean_data[which(clean_data$state == state),]
    
    # Find minimum of specific outcome
    minValue <- min(state_data[, outcome])
    
    # Find the best hospital
    result_data <- state_data[which(state_data[, outcome] == minValue),]
    
    result_data$hospital
}