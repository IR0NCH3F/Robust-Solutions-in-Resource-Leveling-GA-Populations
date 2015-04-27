################################################
# Resource Improvement Coefficient Calculation #
################################################

# the formula from Harris (1978) is RIC = n*sum(yi^2)/(sum(yi))^2, 
# where n is the number of time units (300 hours) and yi is the 
# resource usage on a day i.  The numerator is each day squared 
# and then added to the sum, and the denominator is the total sum squared.  
# The closer this value is to one, the better (perfect square histogram)

# RIC function receives a Genalg population solution and returns a matrix with solution (row) RIC values for each resource (columns).

RIC <- function(x) {
  RICmatrix <- data.frame(matrix(0,ncol=21,nrow=50))
  j<-1
  while(j <= nrow(x$population)) {
    
        XY <- x$population[j,]
        usage <- data.frame(matrix(0, ncol = 21, nrow = 300))
        
    i<-1
    while(i <= length(XY)) {
      usage[XY[i]:ceiling(XY[i]+input[i,5]),] <- usage[XY[i]:ceiling(XY[i]+input[i,5]),] + sapply(input[i,10:length(input)], rep.int, times=ceiling(input[i,5]))
      i <- i+1
    }
    
    RICmatrix[j,] <- (300*apply(apply(usage,c(1,2),function(x) x^2), 2, sum))/(apply(usage,2,sum)^2)
    j <- j+1
    
  }
  
  return(RICmatrix)
}