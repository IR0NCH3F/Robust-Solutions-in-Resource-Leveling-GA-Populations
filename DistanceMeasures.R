############ Distances for entire population ###############
d_matrix = as.matrix(dist(GA.OBJ1.10$population))
d_matrix[d_matrix == 0] <- NA
which(d_matrix == min(d_matrix, na.rm = TRUE), arr.ind = TRUE)

############ Distance at a break point #################
breakpoint <- 100  #ID the time index for a change
bprefs <- which(GA.OBJ1.10$population[1,] < breakpoint)  #ID the tasks that have already been completed by that time index
d_matrix <- as.matrix(dist(GA.OBJ1.10$population[,bprefs])) #ID closest distance solution for completed tasks
d_matrix[d_matrix == 0] <- NA  #set NAs to zero
which(d_matrix == min(d_matrix[,1], na.rm = TRUE), arr.ind = TRUE)  #ID closest vector to specified solution (selected by column d_matrix[,x])
which(d_matrix[,1] < 50)

plot(GA.OBJ1.10$population[2,], col = "orange", xlab = "Decision Variables", ylab = "Time Index", main = "7 solutions with Euclidean Distance < 50")
points(GA.OBJ1.10$population[5,], col = "green")
points(GA.OBJ1.10$population[6,], col = "cyan")
points(GA.OBJ1.10$population[14,], col = "purple")
points(GA.OBJ1.10$population[16,], col = "black")
points(GA.OBJ1.10$population[21,], col = "red")
points(GA.OBJ1.10$population[28,], col = "bisque")
points(GA.OBJ1.10$population[32,], col = "aquamarine")
points(GA.OBJ1.10$population[1,], col = "blue")
abline(100, 0, col = "blue")
legend(50,300, c("Hourly Utilization"), lty=c(1), lwd=c(2.5), col=c("blue"))

######## Testing on OBJ Function 7/0.20 ##########
breakpoint <- 100  #ID the time index for a change
bprefs <- which(GA.OBJ7.20$population[1,] < breakpoint)  #ID the tasks that have already been completed by that time index
d_matrix <- as.matrix(dist(GA.OBJ7.20$population[,bprefs])) #ID closest distance solution for completed tasks
d_matrix[d_matrix == 0] <- NA  #set NAs to zero
which(d_matrix == min(d_matrix[,1], na.rm = TRUE), arr.ind = TRUE)  #ID closest vector to specified solution (selected by column d_matrix[,x])
which(d_matrix[,1] < 50)

plot(GA.OBJ1.10$population[45,], col = "orange", xlab = "Decision Variables", ylab = "Time Index", main = "OBJ FN 7: 7 solutions with Euclidean Distance < 50")
points(GA.OBJ7.20$population[45,], col = "green")
points(GA.OBJ7.20$population[6,], col = "cyan")
points(GA.OBJ7.20$population[14,], col = "purple")
points(GA.OBJ7.20$population[16,], col = "black")
points(GA.OBJ7.20$population[21,], col = "red")
points(GA.OBJ7.20$population[28,], col = "bisque")
points(GA.OBJ7.20$population[32,], col = "aquamarine")
points(GA.OBJ7.20$population[1,], col = "blue")
abline(100, 0, col = "blue")

########## Testing for Solutions Feasibility at the Decision Point ##########
(GA.OBJ2.10$population[46,] < 100 & GA.OBJ2.10$population[1,] < 100) | (GA.OBJ2.10$population[46,] & GA.OBJ2.10$population[1,] > 100)

######## Testing on OBJ Function 3/0.10 ##########
breakpoint <- 100  #ID the time index for a change
bprefs <- which(GA.OBJ3.10$population[1,] < breakpoint)  #ID the tasks that have already been completed by that time index
d_matrix <- as.matrix(dist(GA.OBJ3.10$population[,bprefs], method = "canberra")) #ID closest distance solution for completed tasks
d_matrix[d_matrix == 0] <- NA  #set NAs to zero
which(d_matrix == min(d_matrix[,1], na.rm = TRUE), arr.ind = TRUE)  #ID closest vector to specified solution (selected by column d_matrix[,x])
which(d_matrix[,1] < 1) # Canberra SOLNs 2  5  6  8 13 14 16 18 20 25 28 36 44 46

plot(GA.OBJ1.10$population[2,], col = "orange", xlab = "Decision Variables", ylab = "Time Index", main = "OBJ FN 3: solutions with Canberra Distance < 1")
points(GA.OBJ3.10$population[5,], col = "green")
points(GA.OBJ3.10$population[6,], col = "cyan")
points(GA.OBJ3.10$population[8,], col = "purple")
points(GA.OBJ3.10$population[13,], col = "black")
points(GA.OBJ3.10$population[14,], col = "red")
points(GA.OBJ3.10$population[16,], col = "bisque")
points(GA.OBJ3.10$population[18,], col = "aquamarine")
points(GA.OBJ3.10$population[20,], col = "blue")
abline(100, 0, col = "blue")

########## Testing for Solutions Feasibility at the Decision Point ##########
all((GA.OBJ3.10$population[44,] < 100 & GA.OBJ3.10$population[1,] < 100) | (GA.OBJ3.10$population[44] & GA.OBJ3.10$population[1,] > 100))

######## Testing on OBJ Function 2/0.10 ##########
breakpoint <- 100  #ID the time index for a change
bprefs <- which(GA.OBJ2.10$population[1,] < breakpoint)  #ID the tasks that have already been completed by that time index
d_matrix <- as.matrix(dist(GA.OBJ2.10$population[,bprefs], method = "canberra")) #ID closest distance solution for completed tasks
d_matrix[d_matrix == 0] <- NA  #set NAs to zero
which(d_matrix == min(d_matrix[,1], na.rm = TRUE), arr.ind = TRUE)  #ID closest vector to specified solution (selected by column d_matrix[,x])
which(d_matrix[,1] < 1) # 50 for manhattan, 1 for canberra

plot(GA.OBJ2.10$population[1,], col = "blue", xlab = "Decision Variables", ylab = "Time Index", main = "OBJ FN 2: solutions with Canberra Distance < 1")
points(GA.OBJ2.10$population[11,], col = "green")
points(GA.OBJ2.10$population[14,], col = "cyan")
points(GA.OBJ2.10$population[39,], col = "purple")
points(GA.OBJ2.10$population[40,], col = "black")
# points(GA.OBJ2.10$population[36,], col = "red")
# points(GA.OBJ2.10$population[45,], col = "bisque")
# points(GA.OBJ2.10$population[32,], col = "aquamarine")
points(GA.OBJ2.10$population[6,], col = "orange")
abline(100, 0, col = "blue")

########## Testing for Solutions Feasibility at the Decision Point ##########
(GA.OBJ2.10$population[6,] < 100 & GA.OBJ2.10$population[11,] < 100) | (GA.OBJ2.10$population[6,] & GA.OBJ2.10$population[11,] > 100)

altsoln <- function(x){
  solnmatrix <- data.frame(matrix(0,ncol=300,nrow=1))
  j<-1
  while(j <= 300) {
      count <- 0
      i<-2
    while(i <= 50) {
      if(all((x[i,] < 100 & x[1,] < j) | (x[i] & x[1,] > j)) == TRUE) count <- count+1
          i <- i+1
    }
    
    solnmatrix[j] <- count
    j <- j+1
    }
  return(solnmatrix)
}

######### creating the feasible alternates timeline #########
alt.timeline <- data.frame(matrix(0,ncol = 300, nrow = 27))
alt.timeline[1,] <- altsoln(GA.OBJ1.10$population)
alt.timeline[2,] <- altsoln(GA.OBJ1.20$population)
alt.timeline[3,] <- altsoln(GA.OBJ1.30$population)
alt.timeline[4,] <- altsoln(GA.OBJ2.10$population)
alt.timeline[5,] <- altsoln(GA.OBJ2.20$population)
alt.timeline[6,] <- altsoln(GA.OBJ2.30$population)
alt.timeline[7,] <- altsoln(GA.OBJ3.10$population)
alt.timeline[8,] <- altsoln(GA.OBJ3.20$population)
alt.timeline[9,] <- altsoln(GA.OBJ3.30$population)
alt.timeline[10,] <- altsoln(GA.OBJ4.10$population)
alt.timeline[11,] <- altsoln(GA.OBJ4.20$population)
alt.timeline[12,] <- altsoln(GA.OBJ4.30$population)
alt.timeline[13,] <- altsoln(GA.OBJ5.10$population)
alt.timeline[14,] <- altsoln(GA.OBJ5.20$population)
alt.timeline[15,] <- altsoln(GA.OBJ5.30$population)
alt.timeline[16,] <- altsoln(GA.OBJ6.10$population)
alt.timeline[17,] <- altsoln(GA.OBJ6.20$population)
alt.timeline[18,] <- altsoln(GA.OBJ6.30$population)
alt.timeline[19,] <- altsoln(GA.OBJ7.10$population)
alt.timeline[20,] <- altsoln(GA.OBJ7.20$population)
alt.timeline[21,] <- altsoln(GA.OBJ7.30$population)
alt.timeline[22,] <- altsoln(GA.OBJ8.10$population)
alt.timeline[23,] <- altsoln(GA.OBJ8.20$population)
alt.timeline[24,] <- altsoln(GA.OBJ8.30$population)
alt.timeline[25,] <- altsoln(GA.OBJ9.10$population)
alt.timeline[26,] <- altsoln(GA.OBJ9.20$population)
alt.timeline[27,] <- altsoln(GA.OBJ9.30$population)



######## Make some cool graphs ##########
talt.timeline <- t(alt.timeline)
colnames(talt.timeline)<-c("OBJ1.1","OBJ1.2","OBJ1.3","OBJ2.1","OBJ2.2","OBJ2.3","OBJ3.1","OBJ3.2","OBJ3.3","OBJ4.1","OBJ4.2","OBJ4.3","OBJ5.1","OBJ5.2","OBJ5.3","OBJ6.1","OBJ6.2","OBJ6.3","OBJ7.1","OBJ7.2","OBJ7.3","OBJ8.1","OBJ8.2","OBJ8.3","OBJ9.1","OBJ9.2","OBJ9.3")
rownames(talt.timeline) <- seq(1,300,1)

# using reshape package, create data frame
hour <- seq(1,300,1)
objfn <- gl(27,1, labels=c("OBJ1.1","OBJ1.2","OBJ1.3","OBJ2.1","OBJ2.2","OBJ2.3","OBJ3.1","OBJ3.2","OBJ3.3","OBJ4.1","OBJ4.2","OBJ4.3","OBJ5.1","OBJ5.2","OBJ5.3","OBJ6.1","OBJ6.2","OBJ6.3","OBJ7.1","OBJ7.2","OBJ7.3","OBJ8.1","OBJ8.2","OBJ8.3","OBJ9.1","OBJ9.2","OBJ9.3"))

for(i in 1:27) {
paste("o",i, sep="") <- talt.timeline[,i]
}
df <- data.frame(objfn=objfn, )

test_data <- data.frame(talt.timeline, hour<-hour)
test_data_long <- melt(test_data, id="hour....hour")
colnames(test_data_long) <- c("hour","OBJ_FN","Alt.Solutions")
ggplot(data=test_data_long, aes(x=hour, y=Alt.Solutions, colour=OBJ_FN)) +  geom_line() + ggtitle("Feasible Alternatives to the Best Solution for the Project Duration")

# AUC
AUCvsVar <- cbind(RGA[,1:2], apply(alt.timeline, 1, sum), RGA[,4]) 
colnames(AUCvsVar) <- c("OBJ","Mutation","AUC","modelvar")

#Pareto Curve for Solutions (AUC) vs Variance
qplot(modelvar, AUC, data=AUCvsVar, color = OBJ, shape = Mutation, size=I(3), xlab="DV Variance", ylab="Area Under the Curve - Solutions")  + ggtitle("Multi-objective Pareto Curve")

# AUC compared against RGA numerator
AUCvsRGA <- cbind(AUCvsVar[1:3], RGA[5])

#Pareto Curve for Solutions (AUC) vs Variance
qplot(RGA, AUC, data=AUCvsRGA, color = OBJ, shape = Mutation, size=I(3), xlab="RGAb-RGAbest", ylab="Area Under the Curve - Solutions")  + ggtitle("Multi-objective Pareto Curve")
