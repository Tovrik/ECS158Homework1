A = matrix(c(1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1), nrow=4, ncol=4) 
A
#----------------------------------------

squaretolist <- function(m)
{
  apply(m,1,function(m) {
    x1 <- which(m == 1)
    if(length(x1) == 0) {return "NA"}
  })
}
squaretolist(A)

#----------------------------------------
squaretothin <- function(m) 
{
  apply(m,1,function(m){
    if(m == 0) {index <- arrayInd(m, dim(m))}
  })
}
squaretothin(A)

#----------------------------------------
thintolist <- function(thin,nvert) 
{
  
}

#----------------------------------------
thintosquare <- function(thin,nvert) 
{
  
}

#----------------------------------------
listtothin <- function(inlist) 
{
  
}

#----------------------------------------
listtosquare <- function(inlist,nvert) 
{
  for (i in 1:nvert) {
    
  }
}

