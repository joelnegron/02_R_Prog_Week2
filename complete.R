
# R Programming Week 2 Assignment: Part 2 ---------------------------------

# Complete Function:
complete <- function(directory, id = 1:332) {
        # Create a list of Id's and number of completed observations
        completeList <- lapply(id, function(id) {
                padId <- str_pad(as.character(id), width = 3, side = "left", pad = "0")
                path <- paste0(directory, "/", padId, '.csv')
                monitorIdData <- read.csv(path)
                completeIndex <- !is.na(monitorIdData$nitrate) & !is.na(monitorIdData$sulfate)
                CompleteData <- monitorIdData[completeIndex, ]
                return(c(id, nrow(CompleteData)))
        })
        
        # rbind id and count of complete rows
        completeData <- as.data.frame(do.call("rbind", completeList))
        names(completeData) <- c('id', 'nobs')
        return(completeData)
}


