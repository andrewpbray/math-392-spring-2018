##01 - Shiny App Basics
##Here we'll learn how to connect server and ui together with the input and output objects
#

calc.param.beta <- function(E, sd){
  V <- sd^2
  c <- E/(1-E)
  beta <- (c-V*(1+c^2 +2*c))/(V*(c^3 +1 +3*c^2+3*c))
  alpha <- beta*c
  out <- c(alpha, beta)
  out
}

binom_L <- function(x, val, n){
  dbinom(val, size = n, prob = x)
}

## loading code here
## anything you load here can be seen by both ui and server

library(shiny)
library(tidyverse)


# Define UI for application that plots 
ui <- fluidPage(
  
  # Application title
  titlePanel("Beta-Binomial"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("E", "Prior Expectation", 
                   value = .5, min = 0, max = 1),
      numericInput("sd", "Prior Standard Deviation", 
                   value = .1, min = 0, max = 1),
      numericInput("x", "X (value of data)", 
                   value = 8),
      numericInput("n", "n (number of binomial trials)", 
                   value = 145)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("prior"),
      plotOutput("likelihood"),
      plotOutput("posterior")
    )
  )
)

##Server is where all of the computations happen
server <- function(input, output) {
  
  
  
  output$prior <- renderPlot({
    pars <- calc.param.beta(input$E, input$sd)
    ggplot(data.frame(x = c(0, 1)), aes(x)) + 
      stat_function(fun = dbeta,
                    args = list(shape1 = pars[1],
                                shape2 = pars[2]),
                    n = 500,
                    lwd = 1.5) +
      labs(title = "Beta Prior")
    
  })
  
  output$likelihood <- renderPlot({

    ggplot(data.frame(x = c(0, 1)), aes(x)) + 
      stat_function(fun = binom_L,
                    args = list(val = input$x,
                                n = input$n),
                    n = 500,
                    lwd = 1.5) +
      labs(title = "Binomial Likelihood")
    
  })
  
  output$posterior <- renderPlot({
    pars <- calc.param.beta(input$E, input$sd)
    ggplot(data.frame(x = c(0, 1)), aes(x)) + 
      stat_function(fun = dbeta,
                    args = list(shape1 = input$x + pars[1],
                                shape2 = input$n - input$x + pars[2]),
                    n = 500,
                    lwd = 1.5) +
      labs(title = "Beta Posterior")
})
}

# Run the application 
shinyApp(ui = ui, server = server)

