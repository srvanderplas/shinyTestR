library(shinyTestR)
library(magrittr)
library(stringr)
library(shiny)
context("Rendering SVG files in Shiny")

svgLink <- '<svg>
<script href="http://www.hofroe.net/examples/lineup/fhaction.js"/>
</svg>'

svgNoLink <- '<svg></svg>'

test_that("JS files are detected and passed back to renderSVG", {

  expect_equal(
    extractScripts(
      svg.text=
        '<svg>
          <script href="http://www.hofroe.net/examples/lineup/fhaction.js"/>
        </svg>'
    ),
    "http://www.hofroe.net/examples/lineup/fhaction.js")

  expect_equal(
    extractScripts(
      svg.text=
        '<svg>
        </svg>'
    ),
    NULL)

})


test_that("File links work the same as passing svg text", {

  svgLinkFile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".svg")
  writeLines(svgLink, con = svgLinkFile)

  expect_equal(gsub(renderSVG(svg.text=svgLink), "\n", ""), gsub(as.character(renderSVG(file=svgLinkFile)), "\n", ""))
})

test_that("HTML Output is marked correctly", {
  expect_is(renderSVG(svg.text=svgLink), "shiny.tag.list")
  expect_is(renderSVG(svg.text=svgLink), "list")
  expect_is(renderSVG(svg.text=svgLink)[[2]], "html")
})

