
modelvar <- cbind(mean(apply(GA.OBJ1.10$population, 2, var)), mean(apply(GA.OBJ1.20$population, 2, var)), mean(apply(GA.OBJ1.30$population, 2, var)), mean(apply(GA.OBJ2.10$population, 2, var)), mean(apply(GA.OBJ2.20$population, 2, var)), mean(apply(GA.OBJ2.30$population, 2, var)), mean(apply(GA.OBJ3.10$population, 2, var)), mean(apply(GA.OBJ3.20$population, 2, var)), mean(apply(GA.OBJ3.30$population, 2, var)), mean(apply(GA.OBJ4.10$population, 2, var)), mean(apply(GA.OBJ4.20$population, 2, var)), mean(apply(GA.OBJ4.30$population, 2, var)), mean(apply(GA.OBJ5.10$population, 2, var)), mean(apply(GA.OBJ5.20$population, 2, var)), mean(apply(GA.OBJ5.30$population, 2, var)), mean(apply(GA.OBJ6.10$population, 2, var)), mean(apply(GA.OBJ6.20$population, 2, var)), mean(apply(GA.OBJ6.30$population, 2, var)), mean(apply(GA.OBJ7.10$population, 2, var)), mean(apply(GA.OBJ7.20$population, 2, var)), mean(apply(GA.OBJ7.30$population, 2, var)), mean(apply(GA.OBJ8.10$population, 2, var)), mean(apply(GA.OBJ8.20$population, 2, var)), mean(apply(GA.OBJ8.30$population, 2, var)), mean(apply(GA.OBJ9.10$population, 2, var)), mean(apply(GA.OBJ9.20$population, 2, var)), mean(apply(GA.OBJ9.30$population, 2, var)))

modelRIC <- GA.RICdata[, lapply(.SD, sum), by = "OBJ"]
modelRIC <- apply(aggregate(. ~ MutChance + OBJ, GA.RICdata, FUN=sum)[,3:23], 1, mean)

modelRIC <- as.data.frame(modelRIC)
modelvar <- as.data.frame(t(modelvar))
x <- data.frame(rbind(a,b,c,d,e,f,g,h,i))
y <- rbind(a10,a20,a30,a10,a20,a30,a10,a20,a30,a10,a20,a30,a10,a20,a30,a10,a20,a30,a10,a20,a30,a10,a20,a30,a10, a20, a30)

pareto <- cbind(x,y,modelRIC, modelvar)
colnames(pareto) <- c("OBJ","Mutation","modelRIC","modelvar")

pareto <- data.frame(t(rbind(modelvar, modelRIC)))
a <- data.frame(rep("OBJ1",3))
b <- data.frame(rep("OBJ2",3))
c <- data.frame(rep("OBJ3",3))
d <- data.frame(rep("OBJ4",3))
e <- data.frame(rep("OBJ5",3))
f <- data.frame(rep("OBJ6",3))
g <- data.frame(rep("OBJ7",3))
h <- data.frame(rep("OBJ8",3))
i <- data.frame(rep("OBJ9",3))
colnames(a)<-"OBJ"
colnames(b)<-"OBJ"
colnames(c)<-"OBJ"
colnames(d)<-"OBJ"
colnames(e)<-"OBJ"
colnames(f)<-"OBJ"
colnames(g)<-"OBJ"
colnames(h)<-"OBJ"
colnames(i)<-"OBJ"
a10 <- data.frame(rep(".10",1))
colnames(a10)<-"Pr(Mutation)"
a20 <- data.frame(rep(".20",1))
colnames(a20)<-"Pr(Mutation)"
a30 <- data.frame(rep(".30",1))
colnames(a30)<-"Pr(Mutation)"

pareto <- cbind(rbind(a,b,c,d,e,f,g,h,i),rep(rbind(a10,a20,a30), times=9),as.data.frame(modelRIC), as.data.frame(modelvar)
a <- rbind(a,b,c,d,e,f,g,h,i)
a                
qplot(modelvar, modelRIC, data=pareto, color = OBJ, shape = Mutation, size=I(3), xlab="DV Variance", ylab="Mean RIC")  + ggtitle("Multiobjective Pareto Curve")

qplot(GA.OBJ5.20$population[,1:59], GA.OBJ5.20$population[1:50,], data=data.frame(GA.OBJ5.20$population), size=I(3), xlab="Decision Variables", ylab="Start Hour")  + ggtitle("Model Decision Variable Values") + geom_point(aes(colour = factor(GA.OBJ5.20$population[1:50,])))
plot(GA.OBJ7.20$population[1,], col = "blue", xlab = "Decision Variable", ylab = "Start Hour", main = "Decision Variable Variance - OBJ 7 @ 0.20 Mutatio Chance")
points(GA.OBJ7.20$population[2,], col = "orange")
points(GA.OBJ7.20$population[3,], col = "red")
points(GA.OBJ7.20$population[4,], col = "black")
points(GA.OBJ7.20$population[5,], col = "green")
points(GA.OBJ7.20$population[6,], col = "brown")
points(GA.OBJ7.20$population[7,], col = "turquoise")
points(GA.OBJ7.20$population[8,], col = "cyan")
points(GA.OBJ7.20$population[9,], col = "purple")
points(GA.OBJ7.20$population[10,], col = "gray")

############# Robustness measure RGA ######################
solnRIC <- as.vector(apply(GA.RICdata[,3:23],1,mean))
bestRICdiff <- as.vector(rep(0,27))



a<-1
i<-1
while(a<28)
while(i<(1350)){
  bestRICdiff[27] <- bestRICdiff[27] + abs(solnRIC[i]-17.18868)  #min(solnRIC[i:i+49]))
  i<-i+1
}

RGA <- cbind(RGA, (RGA[,3]^2)/RGA[,4])
colnames(RGA) <- c("OBJ","Mutation","modelRIC","modelvar","RGA")
qplot(modelvar, modelRIC, data=RGA, color = OBJ, shape = Mutation, size=I(3), xlab="DV Variance", ylab="RGAb-RGAbest")  + ggtitle("Multiobjective Pareto Curve")
