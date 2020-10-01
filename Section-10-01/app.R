#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    navbarPage("First Shiny Plots!!!", 
               tabPanel("First Plot", 
               
                        titlePanel("Neloy is sick at R"),
                        
                        # Sidebar with a slider input for number of bins 
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("bin_number",
                                            "Number of bins:",
                                            min = 1,
                                            max = 200,
                                            value = 20), 
                                selectInput("number_bins", "Number of Bins", c(1, 10, 50, 100))
                            ),
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                                plotOutput("histPlot"),
                                plotOutput("distPlot")
                            ))
               
               ),
               tabPanel("About",
               p("I'm the best R student in the game"),
               p("I have section all to myself -- again!"),
               p("I am the second best student in the game")
                        
               )          
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$histPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = as.numeric(input$bin_number) + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkseagreen4', border = 'yellow')
    })
    
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = as.numeric(input$number_bins) + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'red', border = 'orange')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
