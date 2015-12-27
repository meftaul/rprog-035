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
    
    # sorting data ordered by state and then hospital
    clean_data <- clean_data[with(clean_data, order(clean_data$state,clean_data[, outcome], clean_data$hospital)),]
    
    # Split data based on state
    splited_state_data <- split(clean_data, clean_data$state)
    
    
#     wi <- splited_state_data[['WV']]
#     wi <- wi[with(wi, order(wi[, 'pneumonia'])),]
#     wi <- wi[nrow(wi), ]
#     print(wi[, 'hospital'])
    
    # output columns
    hospital_names <- c()
    state_names <- unique(clean_data$state)
    
    for (i in 1:length(splited_state_data)) {
        
        tmp <- splited_state_data[[i]]
        tmp <- tmp[with(tmp, order(tmp[, outcome])),]
        # state_names <- c(state_names, )
        # print(nrow(tmp))
        
        if (num == 'best') {
            
            tmp <- tmp[1,]
            hospital_names <- c(hospital_names, tmp[, 'hospital'])
            # result <- rbind(result, tmp[1,])
            
        }else if (num == 'worst') {
            
            tmp <- tmp[nrow(tmp),]
            hospital_names <- c(hospital_names, tmp[, 'hospital'])
            # result <- rbind(result, tmp[nrow(tmp),])
            
        }else{
            
            tmp <- tmp[num,]
            hospital_names <- c(hospital_names, tmp[, 'hospital'])
            # result <- rbind(result, tmp[num, ])
            
        }
    }
    
    # Processing results as dataframe
    result <- as.data.frame(cbind(hospital_names, state_names))
    
    # renaming rows and columns
    rownames(result) <- state_names
    colnames(result) <- c('hospital', 'state')
    
    result
    
}