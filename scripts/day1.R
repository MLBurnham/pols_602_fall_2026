######################
## my_first_program.R
######################
# Think about how to store and organize your files
# Get a copy of the book.
# Set up a github account. Use a personal email, not a school email.
# Create a README.md
# LaTeX. Use overleaf.

# Open a new R file
# Hot keys: Option + command + i

# set working directory
setwd("")
# Import a dataset
df <- read.csv('data/justice_results.csv')
df <- read.csv("https://raw.githubusercontent.com/MLBurnham/pols_602/refs/heads/main/R_intro/justice_results.csv")
# Do some function
n <- replicate(100000, sum(df$petitioner_pitch))

##############
## Data Types
##############
# Use typeof to identify the "type" of an object
typeof(1)
typeof('Characters are often called strings')
typeof(TRUE)


# you can also use class (and mode() and storage.mode()). class() gives a slightly 
# different answer more relevant for object oriented programming, which you 
# generally won't do in R. Class can also be changed by the user, while type cannot.
class(1)

# changing data between types is called "coercion" 
as.numeric('1')
as.character(1)
as.logical('TRUE')
as.logical(as.numeric('1'))

###################
## Data Structures
###################

# Vectors are the fundamental data structure in R
num_vect <- c(1,0,1)
is.vector(num_vect)
# they will coerce data to a single type
str_vect <- c(1, 0 , '1')
is.vector(str_vect)
# Why is this both a numeric and a vector?
# R uses vectorized functions by default, meaning it operates on each element
# of the vector by default. typeof() is thus being applied to every element of 
# num_vect
typeof(num_vect)
is.numeric(num_vect)
sum(num_vect, num_vect)
num_vect + num_vect

# lists, however, are not vectorized by default because of they can contain
# heterogeneous data types
list.1 <- list(1, 0 , 1)
list.2 <- list(2, 3, 2)
# typeof() evaluates the list object rather than the elements of the list
typeof(list.1)
is.numeric(list.1)
# vectorized functions don't work on lists
sum(list.1, list.2)
list.1 + list.2

# A matrix contains vectors all of the same type
num.mat <- matrix(data = 1:15, nrow = 5, ncol = 3)
num.mat

# an array is a matrix that can have more than two dimensions.
# same matrix as above
array(1:15, c(5,3))
# now we add a dimension
array(1:15, c(5,3,2))

# Data frames are an nxm series of vectors, and can contain vectors of different
# data types
aminals<-data.frame(animal=c('cat', 'dog', 'pig'),
               n=c(3,2,5),
               toes=c(5,5,4))
# this means vectorized functions work on data frame columns
sum(aminals$n)
aminals$n + 1

# lists can contain anything, including data frames or other lists
my.list <- list(list.1, 'cat', aminals, 1)
my.list[3][[1]]$animal

##############
## Operators
##############
# Arithmetic
2+2 # addition
2-2 # subtraction
2*2 # multiplication
2/2 # division
2%%2 # Modulus, remainder
2^2 # Exponentiation

# Logical
2>2 # greater than
2<2 # less than
2<=2 # less than or equal to
2>=2 # greater than or equal to
2==2 # exactly equal to
2!=2 # not equal to
2|2 # or (vectorized)
2&2 # and (vectorized)

# Assignment
x <- 2 # Generally the preferred assignment operator
x = 2
2 -> x # don't use this as a rule of thumb

# Misc.
1:10 # create a sequence
'cat' %in% c('cow','cat','dog','chicken') # test if an element is in a vector

#############
## Functions
#############
?library() # access help for a function
?require()
# library() and require() both load packages to your environment. library() returns
# an error if the package isn't found. require() returns a logical value.
# require() is designed to be used in functions and thus library is more commonly
# used, but you will see both.

# The values you pass to a function are called arguments
rnorm(n = 10, mean = 0, sd = 1)
# if you don't specify which argument is which, R will infer based on position
rnorm(10, 0 ,1)
# some arguments have default values the function will use if values aren't specified
rnorm(10)

