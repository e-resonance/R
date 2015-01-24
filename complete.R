complete <- function(directory, id = 1:332) {
  for (i in id) {
    fileName <- paste(directory,"/",sprintf('%03d',i),".csv",sep = "")
    fileValues <- read.csv(fileName)
    completeCases <- complete.cases(fileValues)
    nobs <- sum(completeCases[completeCases=TRUE])
    tempDF <- data.frame(i,nobs)
    if (exists("completeSummary")) {
      completeSummary <- rbind(completeSummary, tempDF)
    }
    else {
      completeSummary <- tempDF
    }
  }
  colnames(completeSummary) <- c("id","nobs")
  return(completeSummary)
}