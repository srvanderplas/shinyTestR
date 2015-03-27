#' SVG output code
#' Function searches SVG file for links to javascript scripts, adds head tags to include those JS files, and outputs the SVG marked as HTML.
#'
#' @import stringr
#' @import shiny
#' @import magrittr
#' @param svg.text svg text (can be a character string or a list of character strings)
#' @param file link to svg file to read in

renderSVG <- function(svg.text=NULL, file=NULL){
  # allow file or text generation to read in successfully
  if(is.null(svg.text) & is.null(file)){
    stop("Both file and svg.text arguments cannot be NULL")
  } else if(is.null(svg.text)){
    # if text not provided, read file name
    svg.text <- readLines(file)
  }


 script.includes <- extractScripts(svg.text) %>%
    lapply(function(i) singleton(tags$head(tags$script(src=i, type="text/javascript"))))

  return(tagList(script.includes, HTML(svg.text)))
}

#' Function to extract script links from SVG files
#' @import stringr
#' @import magrittr
extractScripts <- function(svg.text){
  script.idx <- str_detect(svg.text, "\\.js")

  if(sum(script.idx)>0){
    svg.text[script.idx] %>%
      str_extract_all("(src|href)=(\'|\").*?\\.js\\2") %>%
      as.character %>%
      str_replace_all("(src|href)=", "") %>%
      str_replace_all("\"", "") %>%
      unlist()
  } else {
    NULL
  }
}
