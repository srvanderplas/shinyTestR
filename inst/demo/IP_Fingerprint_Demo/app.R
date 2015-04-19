library(shiny)
library(htmltools)
library(shinyTestR)


server <- function(input, output, session) {

  outputIP(session)
  
  output$testtext <- renderText(paste("     ip: ", input$ipid))
}

ui <- fluidPage(
  sidebarLayout( 
    sidebarPanel( 
      inputIP("ipid"),
      helpText("nothing to see here... hidden text elements aren't editable by user")
    ),
    mainPanel(
      textOutput("testtext")
    )
  )
)

shinyApp(ui = ui, server = server)
