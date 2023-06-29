# DEMO LISTS
# Acessing items in a list
movie <- list("Toy Story",1995,c("Animation","Adventure","Comedy"))
movie[2]
movie[2:3]

# Name list
movie <- list(name="Toy Story",
              year=1995,
              genre=c("Animation","Adventure","Comedy"))
movie$genre
movie["genre"]

# Adding items
movie["age"] <- 5
movie

# Modifying items
movie["age"] <- 6

# Removing items
movie["age"] <- NULL









# DEMO ARRAY
1  2  3
4  5  6
7  8  9
10 11 12

my_array <- array(data = 1:12, dim = c(3, 4))
my_array[1, 2]   # truy cập phần tử ở hàng 1, cột 2
my_array[1, ]   # truy cập tất cả các phần tử trong hàng 1
my_array[, 1]   # truy cập tất cả các phần tử trong cột 2
###############
# X(4x3)
A E Z
B F A
C G B
D H C
# XY(2x4)
A C E G Z
B D F H 

name <- c("A","B","C","D","E",
          "F","G","H","Z")
x_array <- array(name, dim = c(4,3))
xy_array <- array(name, dim = c(2,4))
x_array[1,2]
x_array[2,]
x_array[,3]



demo VA
