
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


####   UI defined

ui <- fluidPage(
  
  # Application title
  titlePanel("Effect of Population Growth"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      # Creating slider with range
      sliderInput("pop_range",
                  "Range of population",
                  min = min.pop,
                  max = max.pop,
                  value = c(min.pop, max.pop)),
      
      
      # Selecting  x and y variables
      selectInput(inputId = "xvar",
                  label = "X axis",
                  choices = axis_vars,
                  selected = "gdpPercap"),
      
      selectInput(inputId = "yvar",
                  label = "Y axis",
                  choices = axis_vars,
                  selected = "lifeExp"),
      
      # Defining colour of datapoints
      selectInput(inputId = "continent",
                  label = "Color", 
                  choices = factor.columns,
                  selected = "continent"),
      
      
      # seting action button
      actionButton("go", 
                   "Go!",
                   icon = icon("adjust")) 
    ),
    
    # Setting of Output to be plotted
    mainPanel(
      plotOutput("gapminder_plot")
    )
  )
)


# Defining server logic 
server <- function(input, output) {
  
  # Filtering gapminder dataset based on population (pop) 
  
  filt_gap <- reactive ({
    gapminder %>%
      filter(pop >= min(input$pop_range)) %>%
      filter(pop <= max(input$pop_range))
  })

  
  # Making the plot
  
  p_gap <- eventReactive(input$go, {
    ggplot(filt_gap(), aes_string(x = input$xvar, y = input$yvar, colour = input$continent)) + 
      geom_point()
  })
  
  
  # Creating diagnostic output window 
  output$diagnostic <- renderText(
    input$pop_range
  )
  
  
  # Creating a dynamic ggplot plot
  
  output$gapminder_plot <- renderPlot(
    p_gap()
  )
  
}

# Running the application 
shinyApp(ui = ui, server = server)



  










