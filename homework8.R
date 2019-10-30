
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
