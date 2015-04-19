#' Function to create a hashed browser fingerprint based on browser characteristics.
#' This input field is hidden from the user by default, so it will not appear editable.
#' Include in ui.R with the following code: inputBrowserprint("userid")
#' @export
#' @param inputId string to identify the browser fingerprint input element
#' @example
inputBrowserprint <- function(inputId, value=" ") {
  tagList(
    tags$input(id = inputId, class = "fingerprint", value=as.character(value), 
               type="text", style="display:none;"),
    # singleton(tags$head(includeScript(system.file("js/md5.js", package="shinyTestR")))), 
    singleton(tags$head(includeScript(system.file("js/fingerprint.js", package="shinyTestR")))),
    singleton(tags$head(includeScript(system.file("js/javascriptMessages.js", package="shinyTestR"))))
  )
}

#' Function to send a message from shiny to get a user's browser fingerprint
#' Include in server.R with the following code: outputBrowserprint(session)
#' Note: you must call the shinyServer function with session as an argument.
#' @export
#'
outputBrowserprint <- function(session=session){
  observe({
    session$sendCustomMessage(type='javascript', message=list(value="getfingerprint();"))
  }) 
}
