pollutantmean <- function(directory, pollutant, id = 1:332) {
  for (i in id) {
    fileName <- paste(directory,"/",sprintf('%03d',i),".csv",sep = "")
    fileValues <- read.csv(fileName)
    if (exists("pollutantValues")) {
      pollutantValues <- rbind(pollutantValues, fileValues)
    }
    else {
      pollutantValues <- fileValues
    }
  }
  theMean <- mean(pollutantValues[,pollutant],na.rm=TRUE)
  return (theMean)
}

