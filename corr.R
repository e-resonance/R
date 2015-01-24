corr <- function(directory, threshold = 0) {
  completeCases <- complete(directory)
  aboveThreshold <- completeCases[completeCases$nobs>threshold,]
  fileIndexes <- aboveThreshold[,1]
  m <- vapply(fileIndexes, getData, directory, FUN.VALUE=double(1))
  return(m)
}

getData <- function(index, directory) {
  goodData <- read.csv(paste(directory,"/",sprintf('%03d',index),".csv",sep = ""))
  completeData <- goodData[complete.cases(goodData),]
  corData <- cor(completeData[,2],completeData[,3])
  return(corData)
}