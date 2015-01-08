A = matrix(c(1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1), nrow=4, ncol=4) 
A
#----------------------------------------

squaretolist <- function(m)
{
  apply(m,1,function(m) {
    x1 <- which(m == 1)
    if(length(x1) == 0) {return "NA"}
    x1
  })
}
B = squaretolist(A)
#----------------------------------------
squaretothin <- function(m) 
{
  tempList <- matrix(,nrow = 0, ncol = 2) 
  for (i in 1:ncol(m)) {
    for (j in 1:ncol(m)) {
      if(m[i,j] == 1) {
        tempList <- rbind(tempList, c(i,j))
      }
    }
  }
  tempList
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
listtosquare <- function(inlist,nvert) {
  tempMatrix <- matrix(0, nrow=nvert, ncol=nvert)
  for(i in 1:nvert) {
    for(j in inlist[i]) {
      tempMatrix[i,j] <- 1
    }
  }
  tempMatrix
}
listtosquare(B, 4)
