rankhospital <- function(state, outcome, num = "best"){
    
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
    # Sort data
    state_data <- state_data[with(state_data, order(state_data[, outcome], state_data$hospital)), ]
    
    if (num == 'best') {
        state_data$hospital[1]
    }else if (num == 'worst') {
        state_data$hospital[length(state_data$hospital)]
    }else{
        state_data$hospital[num]
    }
}