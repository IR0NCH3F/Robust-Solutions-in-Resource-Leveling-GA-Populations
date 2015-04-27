#The evaulation function returns a computed score (to be minimized) for each solution



evalFunc <- function(x) {
  usage <- data.frame(matrix(0, ncol = 21, nrow = 300))
  XY <- x
      
 
#   i=1
#   while(i <= length(XY)) {
#     j=0
#     while(j < ceiling(input[i,"Duration"])){
#       usage[XY[i]+j,] <- (usage[XY[i]+j,] + input[i,10:length(input)])
#       j <- j+1
#     }
#     i <- i+1
#   }
  
  i=1
  while(i <= length(XY)) {
      usage[XY[i]:ceiling(XY[i]+input[i,5]),] <- usage[XY[i]:ceiling(XY[i]+input[i,5]),] + sapply(input[i,10:length(input)], rep.int, times=ceiling(input[i,5]))
  i <- i+1
  }
  
   score_mtrx <- avg[rep(seq_len(nrow(avg)),300),]
   score_mtrx <- (score_mtrx-usage)^2
  
#   i=1
#   while(i < length(XY)) {  
#     usage <- rbind(usage[1:(XY[i]-1),], (usage[(XY[i]):(XY[i]+ceiling(input[i+1,"Duration"]-1)),] + sapply(input[i+1,10:length(input)], rep.int, times=ceiling(input[i+1,"Duration"]))), usage[(XY[i]+ceiling(input[i+1,"Duration"])):nrow(usage),])
#     
#     usage <- rbind(usage[1:(XY[i]-1),], (usage[(XY[i]):(XY[i]+ceiling(input[i,"Duration"]-1)),] + sapply(input[i,10:length(input)], rep.int, times=ceiling(input[i,"Duration"]))), usage[(XY[i]+ceiling(input[i,"Duration"])):nrow(usage),])
#     
#     apply(usage[XY[i]:XY[i]+input[i,"Duration"],], 1, function(x){x + input[i,10:length(input)]})
#     
#      i <- i+1
#    }
#   take total available/#days and take sum of squared difference as fitness score
#   fitness_score <- sum(apply(usage, 2, mean))
    fitness_score <- sum(apply(score_mtrx, 1, sum))

    return(fitness_score)
}