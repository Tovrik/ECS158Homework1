# Authors(Alphabetical Order): 
# Agahi, Bijan
# Bharadwaj, Arjun
# Peterson, Stefan

#----------------------------------------
squaretolist <- function(m)
{
  # 1. Use the apply function to go through the rows
  # one by one. 
  # 2. For each row figure out the indices where the
  # element is equal to 1.
  # 3. If no element, found in given row, use "NA".

  # 1 indicates go through by rows. We also make use of
  # lambda expressions here.
  apply(m,1,function(m) {
    # Find all the indices of given row using which
    x1 <- which(m == 1)
    # If no elements were found of 1
    if(length(x1) == 0)
      x1 <- NA
    return(x1)
  })
}
#----------------------------------------
squaretothin <- function(m) 
{
  # The way Stefan did it
  # 1. Loop through rows and columns of the matrix
  # and if the (i,j) elements equals 1 then bind (or add)
  # that element to the matrix
  # 2. Works but inefficient (Big-O n^2 Complexity).
  tempList <- matrix(,nrow = 0, ncol = 2) 
  for (i in 1:ncol(m)) {
    for (j in 1:ncol(m)) {
      if(m[i,j] == 1) {
        tempList <- rbind(tempList, c(i,j))
      }
    }
  }
  # Format to have no column names. See specs.
  colnames(tempList) <- c("","")
  return(tempList)

  # Instead use vectorization. Faster and concise
  # 1. Find the array indices where 1 is present
  # 2. Since the matrix returned isn't in any particular order
  # and the prompt asks us to order it, use the order() function
  # to sort it by first column. This is my way of doing it:
  # x1 <- which(m == 1, arr.ind=TRUE)
  # return(x1[order(x1[,1]),])
}
# #----------------------------------------
thintosquare <- function(thin,nvert) 
{
  tempMatrix <- matrix(0, nrow=nvert, ncol=nvert)
  # Use vectorization to set the particular (x,y) coord.
  # to 1. Super fast and this is how easy life should be.
  tempMatrix[thin] <- 1
  return(tempMatrix)
}
# #----------------------------------------
thintolist <- function(thin,nvert) 
{
  # This is the idea Stefan came up with.
  # Use this algorithm:
  # Thin --> Square --> List
  return(squaretolist(thintosquare(thin, nvert))) 
}
# #----------------------------------------
listtothin <- function(inlist) 
{
  # Yet to vectorize it
  # But basically algo. is simple
  # Create empty matrix and add each element pair
  # from the inlist list
  len = length(inlist)
  tempMatrix <- matrix(, nrow=0, ncol=2)
  for(i in 1:len) {
    for(j in inlist[[i]]) {
      if(!is.na(j)) {
        tempMatrix <- rbind(tempMatrix, c(i,j))
      }
    }
  }
  # Format to have no column names. See specs.
  colnames(tempMatrix) <- c("","")
  return(tempMatrix)
}
# #----------------------------------------
listtosquare <- function(inlist) {
  # Very similar to listtothin
  # Same algorithm in fact
  total_size <- length(inlist)
  tempMatrix <- matrix(0, nrow=total_size, ncol=total_size)
  for(i in 1:total_size) {
    for(j in inlist[[i]]) {
      if(!is.na(j)) {
        tempMatrix[i, j] <- 1
      }
    }
  }
  return(tempMatrix)
}
