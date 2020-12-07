
# R Programming Week 2 Assignment: Part 1 ---------------------------------

# Pollutant Mean Function:
pullutantmean <- function(directory, pollutant, id = 1:332) {
        # Create a list with the data based on the id argument.
        monitorList <- lapply(id, function(id) {
                padId <- str_pad(as.character(id), width = 3, side = "left", pad = "0")
                path <- paste0(directory, "/", padId, '.csv')
                return(read.csv(path))
        })
        # rbind the data frames and estimate the mean
        monitorData <- do.call("rbind", monitorList)
        pollutantAvg <- mean(monitorData[, pollutant], na.rm = TRUE)
        return(pollutantAvg)
}
