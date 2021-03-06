% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f7Preloader.R
\name{showF7Preloader}
\alias{showF7Preloader}
\alias{f7HidePreloader}
\title{Framework7 preloader}
\usage{
showF7Preloader(
  target = NULL,
  color = NULL,
  session = shiny::getDefaultReactiveDomain()
)

f7HidePreloader(target = NULL, session = shiny::getDefaultReactiveDomain())
}
\arguments{
\item{target}{Element where preloader overlay will be added.}

\item{color}{Preloader color.}

\item{session}{Shiny session object.}
}
\description{
\code{showF7Preloader} shows a preloader.

\code{f7HidePreloader} hides a preloader.
}
\examples{
if (interactive()) {
 library(shiny)
 library(shinyMobile)

 # basic preloader with red color
 shinyApp(
  ui = f7Page(
    title = "Preloader",
    f7SingleLayout(
      navbar = f7Navbar(
        title = "Preloader",
        hairline = FALSE,
        shadow = TRUE
      ),
      # main content
      f7Button("showLoader", "Show loader"),
      f7Shadow(
        intensity = 10,
        hover = TRUE,
        f7Card(
          title = "Card header",
          f7Slider("obs", "Number of observations", 0, 1000, 500),
          plotOutput("distPlot")
        )
      )
    )
  ),
  server = function(input, output, session) {
    output$distPlot <- renderPlot({
      dist <- rnorm(input$obs)
      hist(dist)
    })

    observeEvent(input$showLoader, {
      showF7Preloader(color = "red")
      Sys.sleep(2)
      f7HidePreloader()
    })
  }
 )

 # preloader in container
 shinyApp(
  ui = f7Page(
    title = "Preloader in container",
    f7SingleLayout(
      navbar = f7Navbar(
        title = "Preloader in container",
        hairline = FALSE,
        shadow = TRUE
      ),
      # main content
      f7Shadow(
        intensity = 10,
        hover = TRUE,
        f7Card(
          title = "Card header",
          f7Slider("obs", "Number of observations", 0, 1000, 500),
          plotOutput("distPlot")
        )
      ),
      f7Card("This is a simple card with plain text,
       but cards can also contain their own header,
       footer, list view, image, or any other element.")
    )
  ),
  server = function(input, output, session) {
    output$distPlot <- renderPlot({
      dist <- rnorm(input$obs)
      hist(dist)
    })

    observeEvent(input$obs, {
      showF7Preloader(target = "#distPlot", color = "red")
      Sys.sleep(2)
      f7HidePreloader()
    })
  }
 )
}
}
