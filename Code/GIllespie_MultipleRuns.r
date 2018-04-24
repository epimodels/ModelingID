library(GillespieSSA)
x0 <- c(S=499, I=1, R=0)
a <- c("0.50*{S}*{I}/({S}+{I}+{R})","0.1*{I}")
nu <- matrix(c(-1,0,
               +1,-1,
               0, +1),nrow=3,byrow=T)

nruns <- 100
time <- 100
out <- lapply(X=1:nruns,FUN=function(x) ssa(x0, a, nu, tf=time)$data)

plot(out[[1]][,1],out[[1]][,3], ylim=c(0,500),xlim=c(0,time),col="black", type="l")
for (i in 2:nruns){lines(out[[i]][,1],out[[i]][,3])}
