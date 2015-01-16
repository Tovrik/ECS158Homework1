Skip to content
 This repository
Explore
Gist
Blog
Help
Stefan Peterson TovrikTheThird
 
2  Unwatch 
  Star 0
 Fork 0TovrikTheThird/ECS158Homework1 PRIVATE
 branch: master  ECS158Homework1/Problem 1.R
arjunb090arjunb090 23 hours ago Removed test cases
2 contributors arjunb090Stefan Peterson
106 lines (102 sloc)  2.995 kb RawBlameHistory   
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
Status API Training Shop Blog About
© 2015 GitHub, Inc. Terms Privacy Security Contact
# Authors(Alphabetical Order): 
# Agahi, Bijan
# Bharadwaj, Arjun
# Peterson, Stefan

<<<<<<< HEAD

=======
ms = matrix(c(1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1), nrow=4, ncol=4) 
#----------------------------------------
>>>>>>> f670e09d9dd47b27d3bc36d2d987ef62a0f389c4
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
<<<<<<< HEAD
B = squaretolist(A)



=======
>>>>>>> f670e09d9dd47b27d3bc36d2d987ef62a0f389c4
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
<<<<<<< HEAD
C = squaretothin(A)


#----------------------------------------
=======
# #----------------------------------------
>>>>>>> f670e09d9dd47b27d3bc36d2d987ef62a0f389c4
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
<<<<<<< HEAD
thintolist(C,4)


#----------------------------------------
=======
# #----------------------------------------
>>>>>>> f670e09d9dd47b27d3bc36d2d987ef62a0f389c4
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
<<<<<<< HEAD
listtothin(B)


#----------------------------------------
listtosquare <- function(inlist,nvert) {
  tempMatrix <- matrix(0, nrow=nvert, ncol=nvert)
  for(i in 1:nvert) {
=======
# #----------------------------------------
listtosquare <- function(inlist) {
  # Very similar to listtothin
  # Same algorithm in fact
  total_size <- length(inlist)
  tempMatrix <- matrix(0, nrow=total_size, ncol=total_size)
  for(i in 1:total_size) {
>>>>>>> f670e09d9dd47b27d3bc36d2d987ef62a0f389c4
    for(j in inlist[[i]]) {
      if(!is.na(j)) {
        tempMatrix[i, j] <- 1
      }
    }
  }
  return(tempMatrix)
}


cat("printing ms matrix\n")
prmatrix(ms)
cat("##########################\n")

cat("calling squaretolist(m)\n")
x1 <- squaretolist(ms)
print(x1)
cat("##########################\n")

cat("calling squaretothin(m)\n")
x2 <- squaretothin(ms)
prmatrix(x2)
cat("##########################\n")

nvert <- 4
cat("calling thintolist(thin,nvert)\n")
x3 <- thintolist(x2,nvert)
print(x3)
cat("##########################\n")

cat("calling thintosquare(thin,nvert)\n")
x4 <- thintosquare(x2,nvert)
prmatrix(x4)
cat("##########################\n")

cat("calling listtothin(inlist)\n")
x5 <- listtothin(x1)
prmatrix(x5)
cat("##########################\n")

cat("calling listtosquare(inlist)\n")
x6 <- listtosquare(x1)
prmatrix(x6)


############# OUTPUT #################
# printing ms matrix
#      [,1] [,2] [,3] [,4]
# [1,]    1    1    1    0
# [2,]    0    0    0    0
# [3,]    1    0    0    0
# [4,]    0    1    0    1

#################################
# calling squaretolist(m)
# [[1]]
# [1] 1 2 3

# [[2]]
# [1] NA

# [[3]]
# [1] 1

# [[4]]
# [1] 2 4

##################################
# calling squaretothin(m)
        
# [1,] 1 1
# [2,] 1 2
# [3,] 1 3
# [4,] 3 1
# [5,] 4 2
# [6,] 4 4
#############################

# calling thintolist(thin,nvert)
# [[1]]
# [1] 1 2 3

# [[2]]
# [1] NA

# [[3]]
# [1] 1

# [[4]]
# [1] 2 4

#################################
# calling thintosquare(thin,nvert)
#      [,1] [,2] [,3] [,4]
# [1,]    1    1    1    0
# [2,]    0    0    0    0
# [3,]    1    0    0    0
# [4,]    0    1    0    1

#################################
# calling listtothin(inlist)
        
# [1,] 1 1
# [2,] 1 2
# [3,] 1 3
# [4,] 3 1
# [5,] 4 2
# [6,] 4 4
##################################
# calling listtosquare(inlist,nvert)
#      [,1] [,2] [,3] [,4]
# [1,]    1    1    1    0
# [2,]    0    0    0    0
# [3,]    1    0    0    0
# [4,]    0    1    0    1
####################################
