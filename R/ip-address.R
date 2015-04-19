#' Function which returns a user's IP address
#' This input field is hidden from the user by default, so it will not appear or be editable.
#' Include in ui.R with the following code: inputIp("ipid")
#' @export
#'
inputIP <- function(inputId, value=' '){
  tagList(
    tags$input(id = inputId, class = "ip", value=as.character(value), type="text", style="display:none;"), 
    singleton(tags$head(includeScript(system.file("js/ip.js", package="shinyTestR")))),
    singleton(tags$head(includeScript(system.file("js/javascriptMessages.js", package="shinyTestR"))))
  )
}

#' Function to send a message from shiny to get a user's IP address
#' Include in server.R with the following code: outputIP(session)
#' Note: you must call the shinyServer function with session as an argument.
#' @export
#'
outputIP <- function(session=session){
  observe({
    session$sendCustomMessage(type='javascript', message=list(value="getip();"))
  }) 
}
