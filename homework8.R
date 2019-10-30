
########
# 
#   Visualization of Gapminder Dataset With Shiny App 
#
##############################################################################

 #  Library required packages ..shiny, tidyverse, gapminder

library(shiny)
library(tidyverse)
library(gapminder)


# Setting range of population growth 

min.pop <- min(gapminder$pop)
max.pop <- max(gapminder$pop)


# Setting axis variables
axis_vars <- names(gapminder)


# Creating character vectors of  gapminder dataset 
factor.indices <- vapply(gapminder, is.factor, TRUE)



# Creating character vectors of  gapminder dataset

numeric.indices <- vapply(gapminder, is.numeric, TRUE) 

numeric.columns <- axis_vars[numeric.indices] # selecting the numeric indices

factor.columns <- axis_vars[factor.indices]   # selecting the factor indices









