#intro to R

#asking for help
?sqrt
sqrt(3)
sqrt(9)

#some commands have defaults 
round (2.453) #nearest whole number
round (2.453, digits=2) #parameter for digits
?round 
args(round)

#searchingforhelp
help.search("anova") #search help window

#creating objects
5+5 #simplemath
weight_kg <- 55 #recall object
(weight_kg) #assign object and print to console
2.2*(weight_kg) #functionwithobject
weight_kg <- 57 #reassignobjectvalue
weight_lbs <- 2.2*(weight_kg) #newobjectdrivedfromfunctionofoldobject

#r vectors and other data types
weights <- c(340,560,124,607,1738) #createsvector
weights #Recallvector)
animals <- c("rats", "snakes", "pigs") # creating vector with characters
length(weights) # find number of values in vector
length(animals)
class(weights) # type of element in vector
class(animals)
animals #Recall
weights <- c(weights, 415) #Add
str(weights) # overview of structure
weights
weights <- c(30, weights) # add value to beginning of function

# remove everything in your environment
rm(list=ls())

#download data
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv", "data/gapminder.csv")

# download data to Desktop
download.file("http://k8hertweck.github.io/2015-11-19-umiami-R/data/gapminder-FiveYearData.csv", "~/Desktop/gapminder.csv")

# import data into R
gapminder <- read.csv("data/gapminder.csv")
str(gapminder) #structure
class(gapminder)
head(gapminder)

# find working directory
getwd()

# manipulating data
#extract first row, first column
gapminder[1, 1]
gapminder[5, 3] # extracting middle value
gapminder[2:6, 1:2] # slice of data
gapminder[c(2, 7, 10), c(1, 3)] # select non-contiguous values
gapminder[5, ] # select all columns from one row
lifeExp <- gapminder[ , 5] # save to object
mean(lifeExp) #find mean saved object
mean (gapminder[ ,5]) #same thing as above; capitalization matters
mean(gapminder$lifeExp) # use column header

averageColumns <- apply(gapminder[ , c(3, 5, 6)], 2, mean) # apply function across selected rows
averageColumns
# min, max, median, sd: other useful summary statistics

#creating functions
g2kg <- function(x) x/1000 
g2kg (5) #testfunction
g2kg(weights)


se <- function(x) sd(x)/sqrt(length(x))
se2 <- function(x) sqrt(var(x)/length(x))
se(weights)
se2(weights)
dec2per <- function(x) x*100
decweights <- g2kg(weights)
dec2per(decweights)
y <- dec2per(decweights)
plot (y)
plot(gapminder$year, gapminder$lifeExp)
Year <- gapminder$year 
LifeExpectancy <- gapminder$lifeExp
plot(y)
plot(Year, LifeExpectancy)
help(plot)

# create a function that converts from decimal to percentage
d2p <- function(x) x*100
d2p(.38)
D2P(.38) # R is case sensitive!

## make a quick and dirty plot
pdf("figures/figure1.pdf")
plot(gapminder$year, gapminder$lifeExp, main="My crappy figure", xlab="year", ylab="life expectancy")
dev.off()

## running statistical tests
help.search("anova")

# ANOVA
fit <- aov(lifeExp ~ country, data = gapminder) # fit model
fit # view model
summary(fit)







