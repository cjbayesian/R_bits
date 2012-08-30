
###### Mean Integrated Squared Error #########

fn<-function(x,mu2)
{
   (dnorm(x,0,3)-dnorm(x,mu2,1))^2
}

i<-1
ds<-((-20):20)
MISE<-ds
for(mu2 in ds)
{
   MISE[i]<-integrate(fn,-Inf,Inf,mu2=mu2)$value
   i<-i+1
}

plot(ds,MISE,type='b')


