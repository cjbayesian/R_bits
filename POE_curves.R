
### Probability of establishment curves ###
### Allee effect is given by the c parameter ###
 

c_pars<-seq(0,2,length.out=11)

curve(1-exp(-x),
   xlab='Propagule Pressure',
   ylab='Probability of establishment',
   xlim=c(0,5),
   lwd=1.5)

for(i in 2:11)
   curve(1-exp(-x^c_pars[i]),
      add=T,
      lty=i,
      col=i,
      lwd=1.5)

legend('bottomright',legend=paste("c =",c_pars[2:11]),lty=2:11,col=2:11,lwd=1.5)

