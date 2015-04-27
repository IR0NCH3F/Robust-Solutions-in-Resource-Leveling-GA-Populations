#This function accepts input from a GenAlg package solution and returns the kurtosis values of all of the resources in a vector.  The last item in the vector is the sum of the kurtosis values.
library(e1071)
GA.kurtosis <- function (x)
{
  Kmatrix <- data.frame(matrix(0,ncol=21,nrow=50))
  j<-1
  while(j <= nrow(x$population)) {
    
    XY <- x$population[j,]
    usage <- data.frame(matrix(0, ncol = 21, nrow = 300))
    
    i<-1
    while(i <= length(XY)) {
      usage[XY[i]:ceiling(XY[i]+input[i,5]),] <- usage[XY[i]:ceiling(XY[i]+input[i,5]),] + sapply(input[i,10:length(input)], rep.int, times=ceiling(input[i,5]))
      i <- i+1
    }
    
   Kmatrix[j,] <- apply(usage, 2, kurtosis)
    j <- j+1
    
  }
  
  return(Kmatrix)
  
}