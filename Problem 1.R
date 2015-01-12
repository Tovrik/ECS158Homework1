A = matrix(c(1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1), nrow=4, ncol=4) 
A
#----------------------------------------


squaretolist <- function(m)
{
  apply(m,1,function(m) {
    x1 <- which(m == 1)
    if(length(x1) == 0) {x1<- "NA"}
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
C = squaretothin(A)


#----------------------------------------
thintosquare <- function(thin,nvert) 
{
  tempMatrix <- matrix(0, nrow=nvert, ncol=nvert)
  tempMatrix[thin] <- 1
  tempMatrix
}
thintosquare(C, 4)


#----------------------------------------
thintolist <- function(thin,nvert) 
{
  squaretolist(thintosquare(thin, nvert)) 
}
thintolist(C,4)


#----------------------------------------
listtothin <- function(inlist) 
{
  len = length(inlist)
  tempMatrix <- matrix(, nrow=0, ncol=2)
  for(i in 1:len) {
    for(j in inlist[[i]]) {
      if(j != "NA" ) {
        tempMatrix <- rbind(tempMatrix, c(i,j))
      }
    }
  }
  tempMatrix
}
listtothin(B)


#----------------------------------------
listtosquare <- function(inlist,nvert) {
  tempMatrix <- matrix(0, nrow=nvert, ncol=nvert)
  for(i in 1:nvert) {
    for(j in inlist[[i]]) {
      if(j != "NA") {
        tempMatrix[i,j] <- 1
      }
    }
  }
  tempMatrix
}
listtosquare(B, 4)
