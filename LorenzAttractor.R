## Solve the Lorenz attractor using lsoda
## Author: Corey Chivers, McGill Biology 2009
##


rm(list=ls())
library(odesolve)
library(rgl)

lorenz<-function(rho=28,sigma=1,beta=8/3,xstart=c(x=1,y=1,z=1),plotlor=TRUE,times=seq(0,500,0.01))
{
   # SET UP time as sequence
   # define values for 3 parameters
   # define starting conditions

   parms<-c(rho,sigma,beta)

   model<-function(t,xyz,parms)
   {
	   # essentially collection markers
	   x<-xyz[1]
	   y<-xyz[2]
	   z<-xyz[3]
	   # will use a set of paramters (below), to simulate
	   with(as.list(parms),{

	   # equations
		   dx = parms[2]*(xyz[2] - xyz[1])
		   dy = xyz[1]*(parms[1] - xyz[3]) - xyz[2]
		   dz = xyz[1]*xyz[2] - parms[3]*xyz[3]

		   list(c(dx,dy,dz))
		   })
   }

   # NOW run lsoda and collect
   out<-as.data.frame(lsoda(xstart,times,model,parms))
   if(plotlor)
      plot3d(out$x,out$y,out$z,type='l')

   return(out)
}


out<-lorenz(rho=28,sigma=10,beta=8/3)


butta<-cbind(out$x,out$y,out$z)
write.table(butta,file="but",quote = TRUE, sep = "\t",row.names=F,col.names=F)



