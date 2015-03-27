#' Function which returns a user's IP address
#' This input field is hidden from the user by default, so it will not appear or be editable.
#' Include in ui.R with the following code: inputIp("ipid")
#' @export
#'
inputIP <- function(inputId, value=''){
  tagList(
    singleton(tags$head(tags$script(src = "inst/md5.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "inst/shinyBindings.js", type='text/javascript'))),
    tags$body(onload="setvalues()"),
    tags$input(id = inputId, class = "ipaddr", value=as.character(value), type="text", style="display:none;")
  )
}
