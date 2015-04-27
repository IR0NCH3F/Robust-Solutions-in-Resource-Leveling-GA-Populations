#This R script runs a genetic algorithm on COP construction sequence start times in order to level the resources of the construction project.  
set.seed(1234)
#sets the working directory which needs to contain the .csv file of construction tasks
setwd("C:/Users/Dave/Dropbox/SYS8999/Models")
setwd("C:/Users/FX8350/Dropbox/SYS8999/Models")

#sources the genalg package
library("genalg")

##########################################################################
## DAVE CHECK OUT THE RMALSCHAINS PACKAGE FOR ADDITIONAL METHODS
##########################################################################

#reads in the .csv file of construction tasks
input <- read.csv("construction_input_2.csv")
caps <- read.csv("resource_caps.csv")
avg <- t(caps[,2])/300

#start is the current set of start times for each construction sequence from MS Project
start <- t(input[,7])

#Maximum value start + slack
 max <- t(ceiling(start+input[8]))
 apply(start, 1, function(x) start[x]+input[x,8])
ceiling(c(start[1]+input[1,8], start[2]+input[2,8]))

#The evaulation function returns a computed score (to be minimized) for each solution using the max of each resource

source("OBJ Function.R")

##################################################
############## Running the GA ####################

ptm <- proc.time()
COP.GenAlg.15_30 <- rbga(stringMin=start, stringMax=max,
               suggestions=start,
               popSize=50, iters=15,
               mutationChance=.15,
               elitism=30,
               monitorFunc=NULL, evalFunc=evalFunc,
               showSettings=TRUE, verbose=TRUE)
elapsed <- proc.time() - ptm
elapsed

plot(COP.GenAlg.15_30)
legend(15,275.5, c("Mean","Best"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue"))
COP.GenAlg.15_30$population[1,]  #best population - they are a sorted list of solutions, so the first has the lowest OBJ Fn value


##################################################
############## Kurtosis ##########################

library(e1071)
usage <- data.frame(matrix(0, ncol = 21, nrow = 300))
XY <- COP.GenAlg.15_30$population[31,]
i=1
while(i <= length(XY)) {
  usage[XY[i]:ceiling(XY[i]+input[i,5]),] <- usage[XY[i]:ceiling(XY[i]+input[i,5]),] + sapply(input[i,10:length(input)], rep.int, times=ceiling(input[i,5]))
  i <- i+1
}
i=1
while(i<=length(usage)){
print(paste(i, kurtosis(usage[,i]), step = " "))
i=i+1
}
sum(apply(usage,2,kurtosis))
mean(apply(usage,2,kurtosis))

# d is a vector of kurtosis values
d31 <- matrix(data = NA, nrow = 21, ncol = 1)
i=1
for(i in 1:21)
{ d31[i,] <- kurtosis(usage[,i])}

plot(d1)
points(d2, col = "red")
points(d3, col = "blue")
points(d31, col = "orange")

plot(COP.GenAlg.15_30$population[1,])
points(COP.GenAlg.15_30$population[2,], col = "red")
points(COP.GenAlg.15_30$population[3,], col = "blue")
points(COP.GenAlg.15_30$population[31,], col = "orange")


##################################################
############# OBJ Value###########################

evalFunc(COP.GenAlg.15_30$population[1,])

##################################################
######## Testing for Precedence Violation ########

i=1
while(i<=59){
  if(!is.na(input[i,9])) print(paste(i , COP.GenAlg.15_30$population[1,i] >= COP.GenAlg.15_30$population[1,input[i,9]], step = " "))
  i<-i+1
}

##################################################
#### Examining Variable Similarity/Importance ####
a <- as.matrix(COP.GenAlg.15_30$population) #a is the set of all DV values for all solutions from this GA model

# b is vector of the OBJ Function scores for the solution population
b <- matrix(data = NA, nrow = 50, ncol = 1)
i=1
for(i in 1:50)
{ b[i,] <- evalFunc(COP.GenAlg.15_30$population[i,])}

# c is the variance of the resource start times
library("stats")
c <- matrix(data = NA, nrow = 59, ncol = 1)
i=1
for(i in 1:59)
{ c[i,] <- var(COP.GenAlg.15_30$population[,i])}


dist(a, method = "manhattan")

##################################################
############## Saving Graphs #####################

names <- colnames(input[10:length(input)])
c<-1
while(c<=length(input[10:length(input)])){
  a <- c
  b <- c+9
  
    
  mypath <- file.path("C:","Users","Dave","Dropbox","SYS8999","Proposal","Graphics",paste("", names[c], "_model6_OBJ.jpg", sep = ""))
  jpeg(file=mypath)
  plot(x = usage[,a], type = "s", main = colnames(input[b]), xlab = "Hour", ylab = "Utilization", col = "blue") 
  legend(200,(max(usage[,a]/1.1)), c("Hourly Utilization"), lty=c(1), lwd=c(2.5),col=c("blue"))
  dev.off()
  
  c <- c+1
}