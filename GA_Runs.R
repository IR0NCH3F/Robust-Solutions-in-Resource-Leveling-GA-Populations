set.seed(1234)
setwd("C:/Users/FX8350/Dropbox/SYS8999/Models")
library("genalg")

#reads in the .csv file of construction tasks
input <- read.csv("construction_input_2.csv")
avg <- t(caps[,2])/300

#start is the current set of start times for each construction sequence from MS Project
start <- t(input[,7])

#Maximum value start + slack
max <- ceiling(t((start+input[8])))
rownames(max) <- NULL

source("OBJ1.R")
source("OBJ2.R")
source("OBJ3.R")
source("OBJ4.R")
source("OBJ5.R")
source("OBJ6.R")
source("OBJ7.R")
source("OBJ8.R")
source("OBJ9.R")

############## Running the GA OBJ FN 1 ####################

ptm <- proc.time()
GA.OBJ1.10 <- rbga(stringMin=start, stringMax=max,
                         suggestions=start,
                         popSize=50, iters=25,
                         mutationChance=.1,
                         elitism=20,
                         monitorFunc=NULL, evalFunc=evalFunc1,
                         showSettings=TRUE, verbose=TRUE)
GA.OBJ1.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ1.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc1,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ1.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ1.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc1,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ1.30elapsed <- proc.time() - ptm

############## testing for precedence viloation ############## 
i=1
while(i<=59){
  if(!is.na(input[i,9])) print(paste(i , GA.OBJ1.30$population[1,i] >= GA.OBJ1.30$population[1,input[i,9]], step = " "))
  i<-i+1
}

############## Running the GA OBJ FN 2 ####################

ptm <- proc.time()
GA.OBJ2.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc2,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ2.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ2.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc2,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ2.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ2.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc2,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ2.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 3 ####################

ptm <- proc.time()
GA.OBJ3.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc3,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ3.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ3.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc3,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ3.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ3.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc3,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ3.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 4 ####################

ptm <- proc.time()
GA.OBJ4.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc4,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ4.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ4.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc4,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ4.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ4.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc4,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ4.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 5 ####################

ptm <- proc.time()
GA.OBJ5.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc5,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ5.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ5.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc5,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ5.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ5.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc5,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ5.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 6 ####################

ptm <- proc.time()
GA.OBJ6.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc6,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ6.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ6.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc6,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ6.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ6.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc6,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ6.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 7 ####################

ptm <- proc.time()
GA.OBJ7.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc7,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ7.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ7.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc7,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ6.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ7.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc7,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ7.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 8 ####################

ptm <- proc.time()
GA.OBJ8.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc8,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ8.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ8.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc8,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ8.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ8.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc8,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ8.30elapsed <- proc.time() - ptm

############## Running the GA OBJ FN 9 ####################

ptm <- proc.time()
GA.OBJ9.10 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.1,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc9,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ9.10elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ9.20 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.2,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc9,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ9.20elapsed <- proc.time() - ptm

ptm <- proc.time()
GA.OBJ9.30 <- rbga(stringMin=start, stringMax=max,
                   suggestions=start,
                   popSize=50, iters=25,
                   mutationChance=.3,
                   elitism=25,
                   monitorFunc=NULL, evalFunc=evalFunc9,
                   showSettings=TRUE, verbose=TRUE)
GA.OBJ9.30elapsed <- proc.time() - ptm

############## RIC Matrices ####################
GA.OBJ1.10_RIC <- RIC(GA.OBJ1.10)
GA.OBJ1.20_RIC <- RIC(GA.OBJ1.20)
GA.OBJ1.30_RIC <- RIC(GA.OBJ1.30)

GA.OBJ2.10_RIC <- RIC(GA.OBJ2.10)
GA.OBJ2.20_RIC <- RIC(GA.OBJ2.20)
GA.OBJ2.30_RIC <- RIC(GA.OBJ2.30)

GA.OBJ3.10_RIC <- RIC(GA.OBJ3.10)
GA.OBJ3.20_RIC <- RIC(GA.OBJ3.20)
GA.OBJ3.30_RIC <- RIC(GA.OBJ3.30)

GA.OBJ4.10_RIC <- RIC(GA.OBJ4.10)
GA.OBJ4.20_RIC <- RIC(GA.OBJ4.20)
GA.OBJ4.30_RIC <- RIC(GA.OBJ4.30)

GA.OBJ5.10_RIC <- RIC(GA.OBJ5.10)
GA.OBJ5.20_RIC <- RIC(GA.OBJ5.20)
GA.OBJ5.30_RIC <- RIC(GA.OBJ5.30)

GA.OBJ6.10_RIC <- RIC(GA.OBJ6.10)
GA.OBJ6.20_RIC <- RIC(GA.OBJ6.20)
GA.OBJ6.30_RIC <- RIC(GA.OBJ6.30)

GA.OBJ7.10_RIC <- RIC(GA.OBJ7.10)
GA.OBJ7.20_RIC <- RIC(GA.OBJ7.20)
GA.OBJ7.30_RIC <- RIC(GA.OBJ7.30)

GA.OBJ8.10_RIC <- RIC(GA.OBJ8.10)
GA.OBJ8.20_RIC <- RIC(GA.OBJ8.20)
GA.OBJ8.30_RIC <- RIC(GA.OBJ8.30)

GA.OBJ9.10_RIC <- RIC(GA.OBJ9.10)
GA.OBJ9.20_RIC <- RIC(GA.OBJ9.20)
GA.OBJ9.30_RIC <- RIC(GA.OBJ9.30)

############## Kurtosis ##########################

library(e1071)

GA.OBJ1.10_Kurtosis <- GA.kurtosis(GA.OBJ1.10)
GA.OBJ1.20_Kurtosis <- GA.kurtosis(GA.OBJ1.20)
GA.OBJ1.30_Kurtosis <- GA.kurtosis(GA.OBJ1.30)

GA.OBJ2.10_Kurtosis <- GA.kurtosis(GA.OBJ2.10)
GA.OBJ2.20_Kurtosis <- GA.kurtosis(GA.OBJ2.20)
GA.OBJ2.30_Kurtosis <- GA.kurtosis(GA.OBJ2.30)

GA.OBJ3.10_Kurtosis <- GA.kurtosis(GA.OBJ3.10)
GA.OBJ3.20_Kurtosis <- GA.kurtosis(GA.OBJ3.20)
GA.OBJ3.30_Kurtosis <- GA.kurtosis(GA.OBJ3.30)

GA.OBJ4.10_Kurtosis <- GA.kurtosis(GA.OBJ4.10)
GA.OBJ4.20_Kurtosis <- GA.kurtosis(GA.OBJ4.20)
GA.OBJ4.30_Kurtosis <- GA.kurtosis(GA.OBJ4.30)

GA.OBJ5.10_Kurtosis <- GA.kurtosis(GA.OBJ5.10)
GA.OBJ5.20_Kurtosis <- GA.kurtosis(GA.OBJ5.20)
GA.OBJ5.30_Kurtosis <- GA.kurtosis(GA.OBJ5.30)

GA.OBJ6.10_Kurtosis <- GA.kurtosis(GA.OBJ6.10)
GA.OBJ6.20_Kurtosis <- GA.kurtosis(GA.OBJ6.20)
GA.OBJ6.30_Kurtosis <- GA.kurtosis(GA.OBJ6.30)

GA.OBJ7.10_Kurtosis <- GA.kurtosis(GA.OBJ7.10)
GA.OBJ7.20_Kurtosis <- GA.kurtosis(GA.OBJ7.20)
GA.OBJ7.30_Kurtosis <- GA.kurtosis(GA.OBJ7.30)

GA.OBJ8.10_Kurtosis <- GA.kurtosis(GA.OBJ8.10)
GA.OBJ8.20_Kurtosis <- GA.kurtosis(GA.OBJ8.20)
GA.OBJ8.30_Kurtosis <- GA.kurtosis(GA.OBJ8.30)

GA.OBJ9.10_Kurtosis <- GA.kurtosis(GA.OBJ9.10)
GA.OBJ9.20_Kurtosis <- GA.kurtosis(GA.OBJ9.20)
GA.OBJ9.30_Kurtosis <- GA.kurtosis(GA.OBJ9.30)

######## RIC Data ###########

a <- data.frame(rep("OBJ1",50))
b <- data.frame(rep("OBJ2",50))
c <- data.frame(rep("OBJ3",50))
d <- data.frame(rep("OBJ4",50))
e <- data.frame(rep("OBJ5",50))
f <- data.frame(rep("OBJ6",50))
g <- data.frame(rep("OBJ7",50))
h <- data.frame(rep("OBJ8",50))
i <- data.frame(rep("OBJ9",50))
colnames(a)<-"OBJ"
colnames(b)<-"OBJ"
colnames(c)<-"OBJ"
colnames(d)<-"OBJ"
colnames(e)<-"OBJ"
colnames(f)<-"OBJ"
colnames(g)<-"OBJ"
colnames(h)<-"OBJ"
colnames(i)<-"OBJ"


a10 <- data.frame(rep(".10",50))
colnames(a10)<-"Pr(Mutation)"
a20 <- data.frame(rep(".20",50))
colnames(a20)<-"Pr(Mutation)"
a30 <- data.frame(rep(".30",50))
colnames(a30)<-"Pr(Mutation)"
# a40 <- data.frame(rep(".10",50))
# colnames(a40)<-"Pr(Mutation)"
# a50 <- data.frame(rep(".10",50))
# colnames(a50)<-"Pr(Mutation)"
# a60 <- data.frame(rep(".10",50))
# colnames(a60)<-"Pr(Mutation)"
# a70 <- data.frame(rep(".10",50))
# colnames(a70)<-"Pr(Mutation)"
# a80 <- data.frame(rep(".10",50))
# colnames(a80)<-"Pr(Mutation)"
# a90 <- data.frame(rep(".10",50))
# colnames(a90)<-"Pr(Mutation)"

colnames(GA.OBJ9.30_RIC) <- c("Auger","Backhoe","Carpenter","Supervisor","H2O_Truck","Dozer_HVY","Dozer_MED","HYEX","Forklift","General_Labor","Grader","Heavy_Operator","Electrician","Loader","Metal_Worker","Paver","Plumber","Roller","Scraper","Sweeper","Dump_Truck")

GA_OBJ1_10_grmtrx <- cbind(a,a10,GA.OBJ1.10_RIC)
GA_OBJ1_20_grmtrx <- cbind(a,a20,GA.OBJ1.20_RIC)
GA_OBJ1_30_grmtrx <- cbind(a,a30,GA.OBJ1.30_RIC)

GA_OBJ2_10_grmtrx <- cbind(b,a10,GA.OBJ2.10_RIC)
GA_OBJ2_20_grmtrx <- cbind(b,a20,GA.OBJ2.20_RIC)
GA_OBJ2_30_grmtrx <- cbind(b,a30,GA.OBJ2.30_RIC)

GA_OBJ3_10_grmtrx <- cbind(c,a10,GA.OBJ3.10_RIC)
GA_OBJ3_20_grmtrx <- cbind(c,a20,GA.OBJ3.20_RIC)
GA_OBJ3_30_grmtrx <- cbind(c,a30,GA.OBJ3.30_RIC)

GA_OBJ4_10_grmtrx <- cbind(d,a10,GA.OBJ4.10_RIC)
GA_OBJ4_20_grmtrx <- cbind(d,a20,GA.OBJ4.20_RIC)
GA_OBJ4_30_grmtrx <- cbind(d,a30,GA.OBJ4.30_RIC)

GA_OBJ5_10_grmtrx <- cbind(e,a10,GA.OBJ5.10_RIC)
GA_OBJ5_20_grmtrx <- cbind(e,a20,GA.OBJ5.20_RIC)
GA_OBJ5_30_grmtrx <- cbind(e,a30,GA.OBJ5.30_RIC)

GA_OBJ6_10_grmtrx <- cbind(f,a10,GA.OBJ6.10_RIC)
GA_OBJ6_20_grmtrx <- cbind(f,a20,GA.OBJ6.20_RIC)
GA_OBJ6_30_grmtrx <- cbind(f,a30,GA.OBJ6.30_RIC)

GA_OBJ7_10_grmtrx <- cbind(g,a10,GA.OBJ7.10_RIC)
GA_OBJ7_20_grmtrx <- cbind(g,a20,GA.OBJ7.20_RIC)
GA_OBJ7_30_grmtrx <- cbind(g,a30,GA.OBJ7.30_RIC)

GA_OBJ8_10_grmtrx <- cbind(h,a10,GA.OBJ8.10_RIC)
GA_OBJ8_20_grmtrx <- cbind(h,a20,GA.OBJ8.20_RIC)
GA_OBJ8_30_grmtrx <- cbind(h,a30,GA.OBJ8.30_RIC)

GA_OBJ9_10_grmtrx <- cbind(i,a10,GA.OBJ9.10_RIC)
GA_OBJ9_20_grmtrx <- cbind(i,a20,GA.OBJ9.20_RIC)
GA_OBJ9_30_grmtrx <- cbind(i,a30,GA.OBJ9.30_RIC)

GA.RICdata <- rbind(GA_OBJ1_10_grmtrx,GA_OBJ1_20_grmtrx,GA_OBJ1_30_grmtrx,GA_OBJ2_10_grmtrx,GA_OBJ2_20_grmtrx,GA_OBJ2_30_grmtrx,GA_OBJ3_10_grmtrx,GA_OBJ3_20_grmtrx,GA_OBJ3_30_grmtrx,GA_OBJ4_10_grmtrx,GA_OBJ4_20_grmtrx,GA_OBJ4_30_grmtrx,GA_OBJ5_10_grmtrx,GA_OBJ5_20_grmtrx,GA_OBJ5_30_grmtrx,GA_OBJ6_10_grmtrx,GA_OBJ6_20_grmtrx,GA_OBJ6_30_grmtrx,GA_OBJ7_10_grmtrx,GA_OBJ7_20_grmtrx,GA_OBJ7_30_grmtrx,GA_OBJ8_10_grmtrx,GA_OBJ8_20_grmtrx,GA_OBJ8_30_grmtrx,GA_OBJ9_10_grmtrx,GA_OBJ9_20_grmtrx,GA_OBJ9_30_grmtrx)

######## Kurtosis Data ###########

GA.Kdata <- rbind(cbind(a,a10,GA.OBJ1.10_Kurtosis),
cbind(a,a20,GA.OBJ1.20_Kurtosis),
cbind(a,a30,GA.OBJ1.30_Kurtosis),
cbind(b,a10,GA.OBJ2.10_Kurtosis),
cbind(b,a20,GA.OBJ2.20_Kurtosis),
cbind(b,a30,GA.OBJ2.30_Kurtosis),
cbind(c,a10,GA.OBJ3.10_Kurtosis),
cbind(c,a20,GA.OBJ3.20_Kurtosis),
cbind(c,a30,GA.OBJ3.30_Kurtosis),
cbind(d,a10,GA.OBJ4.10_Kurtosis),
cbind(d,a20,GA.OBJ4.20_Kurtosis),
cbind(d,a30,GA.OBJ4.30_Kurtosis),
cbind(e,a10,GA.OBJ5.10_Kurtosis),
cbind(e,a20,GA.OBJ5.20_Kurtosis),
cbind(e,a30,GA.OBJ5.30_Kurtosis),
cbind(f,a10,GA.OBJ6.10_Kurtosis),
cbind(f,a20,GA.OBJ6.20_Kurtosis),
cbind(f,a30,GA.OBJ6.30_Kurtosis),
cbind(g,a10,GA.OBJ7.10_Kurtosis),
cbind(g,a20,GA.OBJ7.20_Kurtosis),
cbind(g,a30,GA.OBJ7.30_Kurtosis),
cbind(h,a10,GA.OBJ8.10_Kurtosis),
cbind(h,a20,GA.OBJ8.20_Kurtosis),
cbind(h,a30,GA.OBJ8.30_Kurtosis),
cbind(i,a10,GA.OBJ9.10_Kurtosis),
cbind(i,a20,GA.OBJ9.20_Kurtosis),
cbind(i,a30,GA.OBJ9.30_Kurtosis))

############ Scatter Plots ######################

# RIC plot carpenter/GL
library("ggplot2")
# Scatterplot of mpg vs. hp for each combination of gears and cylinders
# in each facet, transmittion type is represented by shape and color
qplot(Carpenter, General_Labor, data=GA.RICdata, color = OBJ, shape = MutChance, size=I(3), xlab="Carpenter", ylab="General Labor")  + ggtitle("Carpenter and General Labor RIC values (closer to 1 is better)")

# Kurtosis plot  carpenter/GL
qplot(Carpenter, General_Labor, data=GA.Kdata, color = OBJ, shape = MutChance, size=I(3), xlab="Carpenter", ylab="General Labor")  + ggtitle("Carpenter and General Labor Kurtosis values (closer to 1 is better)")

# RIC plot Dump Truck/Loader
qplot(Scraper, Sweeper, data=GA.RICdata, color = OBJ, shape = MutChance, size=I(3), xlab="Scraper", ylab="Sweeper")  + ggtitle("Scraper and Sweeper RIC values (closer to 1 is better)")

# Kurtosis plot  carpenter/GL
qplot(Scraper, Sweeper, data=GA.Kdata, color = OBJ, shape = MutChance, size=I(3), xlab="Scraper", ylab="Sweeper")  + ggtitle("Scraper and Sweeper Kurtosis values (closer to 1 is better)")


names <- names(GA.RICdata)[3:23]
c<-1
while(c<=length(names)){
  a <- c
  b <- c+9
  mypath <- file.path("C:","Users","Dave","Dropbox","SYS8999","Proposal-Defense","Graphics",paste("", names[c], "_RIC", sep = ""))
  jpeg(file=mypath)
  plot(x = usage[,a], type = "s", main = colnames(input[b]), xlab = "Hour", ylab = "Utilization", col = "blue")
  legend(200,(max(usage[,a]/1.1)), c("Hourly Utilization"), lty=c(1), lwd=c(2.5),col=c("blue"))
  dev.off()
  c <- c+1
}

######## Distance measures #############

OBJ1.10.dist <- matrix(dist(GA.OBJ1.10$population, method = "euclidean", diag = TRUE))

######## RIC and Kurtosis Tables ###########

min.RICvalues <- apply(GA.RICdata, 2, which.min)
min.Kvalues <- apply(GA.Kdata, 2, which.min)

######## Minimum scores for OBJ #############
min(apply(GA.RICdata[1:150,3:23],1,sum)) #OBJ1 min
min(apply(GA.RICdata[151:300,3:23],1,sum)) #OBJ2 min
min(apply(GA.RICdata[301:450,3:23],1,sum)) #OBJ3 min
min(apply(GA.RICdata[451:600,3:23],1,sum)) #OBJ4 min
min(apply(GA.RICdata[601:750,3:23],1,sum)) #OBJ5 min
min(apply(GA.RICdata[751:900,3:23],1,sum)) #OBJ6 min
min(apply(GA.RICdata[901:1050,3:23],1,sum)) #OBJ7 min
min(apply(GA.RICdata[1051:1200,3:23],1,sum)) #OBJ8 min
min(apply(GA.RICdata[1201:1350,3:23],1,sum)) #OBJ9 min


######## Test for Normality ################
plot(density(GA.RICdata[,21]), main = "Dump Truck RIC Density")
qqnorm(GA.RICdata[1:150,21]);qqline(GA.RICdata[1:150,21], col = 2, main = "Dump Truck RIC QQ Plot")
qqnorm(GA.RICdata[301:450,18]);qqline(GA.RICdata[301:450,18], col = 2)

for(i in 3:21) {print(chisq.test(GA.RICdata[1201:1350,i]))}

######## Friedman and Quade Tests ##########

Fried_mtrx <- matrix(0,ncol=21, nrow = 9)
test9 <- matrix(0,ncol=21, nrow = 1)


a <- 8
i <- 3

for(i in 3:23) {
  print(i-2)
print(friedman.test(
  cbind(GA.RICdata[(1+(a*150)):(50+(a*150)),i], 
        GA.RICdata[(51+(a*150)):(100+(a*150)),i], 
        GA.RICdata[((a*150)+101):((a*150)+150),i]))
)
}

pmatrix <- rbind(test1, test2, test3, test4, test5, test6, test7, test8, test9)
p <- data.frame(pmatrix)
colnames(p) <- colnames(GA.RICdata[3:23])
rownames(p) <- c("OBJ1","OBJ2","OBJ3","OBJ4","OBJ5","OBJ6","OBJ7","OBJ8","OBJ9")


0.001785714
19,15,11,12,13
21, 8, 9, 10, 11, 6
20, 17, 16, 11
17, 12
13,14,16, 5-10, 2,3
21,19,14,17,18, 7,8,11,12,3,4
21,20,19,18,17,13,12,6,4,3
15,12,11,
20,17,18,15,13,11,8,6,5,4,3,2



.05/3
i=3
for(i in 3:21) {
test <- friedman.test(cbind(GA.RICdata[1:150,i], #OBJ1 min
              
              GA.RICdata[151:300,i], #OBJ2 min
              GA.RICdata[301:450,i], #OBJ3 min
              GA.RICdata[451:600,i], #OBJ4 min
              GA.RICdata[601:750,i], #OBJ5 min
              GA.RICdata[751:900,i], #OBJ6 min
              GA.RICdata[901:1050,i], #OBJ7 min
              GA.RICdata[1051:1200,i], #OBJ8 min
              GA.RICdata[1201:1350,i]) ~ c("OBJ1","OBJ2","OBJ3","OBJ4","OBJ5","OBJ6","OBJ7","OBJ8","OBJ9")|c(.10,.20,.30)) #OBJ9 min
}
friedman.test(modelRIC~OBJ|Mutation, data=pareto)
quade.test(data=GA.RICdata[,5],GA.RICdata[,1],GA.RICdata[,2])

attach(GA.RICdata)
friedman.test(Backhoe ~ MutChance | OBJ, GA.RICdata)
kruskal.test() #3x+ repeated measure test
wilcox.test() #2x repeated measure test