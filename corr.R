
# R Programming Week 2 Assignment: Part 3 ---------------------------------

# correlation Function:
corr <- function(directory, threshold = 0) {
        # Get the id's for monitors that meet the threshold
        compData <- complete(directory)
        CompDataThreshold <- compData[compData$nobs > threshold, ]
        id = CompDataThreshold$id
        
        # Calculate the correlation for the id's that meet the threshold and save in a vector
        correlations <- sapply(id, function(id) {
                padId <- str_pad(as.character(id), width = 3, side = "left", pad = "0")
                path <- paste0(directory, "/", padId, '.csv')
                monitorData <- read.csv(path)
                corr <- with(monitorData, cor(sulfate, nitrate, use = "complete.obs"))
                return(corr)
        })
        return(correlations)
}