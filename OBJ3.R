### The evaulation function returns a computed score (to be minimized) for each solution ###

evalFunc3 <- function(x) {
  # initializing an (i,j) matrix where i are the number of days and j are the resources in use on that day
  usage <- data.frame(matrix(0, ncol = 21, nrow = 300))
  #   received solution
  XY <- x
  
  # Populating the usage matrix using the input solution
  i=1
  while(i <= length(XY)) {
    usage[XY[i]:ceiling(XY[i]+input[i,5]),] <- usage[XY[i]:ceiling(XY[i]+input[i,5]),] + sapply(input[i,10:length(input)], rep.int, times=ceiling(input[i,5]))
    i <- i+1
  }
  
  # Creating the score matrix from the usage matrix with an objective function
  score_mtrx <- avg[rep(seq_len(nrow(avg)),300),]
  score_mtrx <- abs(score_mtrx-usage)
  
  #   the sume of all scored positions in the score matrix
  fitness_score <- sum(apply(score_mtrx, 1, sum))
  return(fitness_score)
}