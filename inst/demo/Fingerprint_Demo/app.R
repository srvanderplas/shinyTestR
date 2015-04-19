library(shiny)
library(htmltools)
library(shinyTestR)


server <- function(input, output, session) {
  
  outputBrowserprint(session)
  
  output$testtext <- renderText(paste("userid: ", input$userid))
}

ui <- fluidPage( 
  sidebarLayout( 
    sidebarPanel( 
      inputBrowserprint("userid"),
      helpText("nothing to see here... hidden text elements aren't editable by user")
    ),
    mainPanel(
      textOutput("testtext")
    )
  )
)

shinyApp(ui = ui, server = server)
