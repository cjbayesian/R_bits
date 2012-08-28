## Export rgl plots to webGL
library(rgl)

#a dummy plot from plot3d.rd
       x <- sort(rnorm(1000))
       y <- rnorm(1000)
       z <- rnorm(1000) + atan2(x,y)
       plot3d(x, y, z, col=rainbow(1000))

#writes a folder with everything you need 
#to view this object in a (modern) browser
writeWebGL(width=500,height=500)

