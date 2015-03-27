#' Function to create a hashed user fingerprint based on browser characteristics.
#' This input field is hidden from the user by default, so it will not appear editable.
#' Include in ui.R with the following code: inputUserID("fingerprint")
#' @export
#'
inputUserID <- function(inputId, value='') {
  #   print(paste(inputId, "=", value))
  tagList(
    singleton(tags$head(tags$script(src = "js/md5.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "js/shinyBindings.js", type='text/javascript'))),
    tags$body(onload="setvalues()"),
    tags$input(id = inputId, class = "userid", value=as.character(value), type="text", style="display:none;")
  )
}
