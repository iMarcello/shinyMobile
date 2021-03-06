% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f7Popup.R
\name{f7Popup}
\alias{f7Popup}
\title{Create a f7 popup}
\usage{
f7Popup(
  ...,
  id,
  title,
  backdrop = TRUE,
  closeByBackdropClick = TRUE,
  closeOnEscape = FALSE,
  animate = TRUE,
  swipeToClose = FALSE
)
}
\arguments{
\item{...}{Content.}

\item{id}{Popup unique id.}

\item{title}{Title.}

\item{backdrop}{Enables Popup backdrop (dark semi transparent layer behind). Default to TRUE.}

\item{closeByBackdropClick}{When enabled, popup will be closed on backdrop click. Default to TRUE.}

\item{closeOnEscape}{When enabled, popup will be closed on ESC keyboard key press. Default to FALSE.}

\item{animate}{Whether the Popup should be opened/closed with animation or not. Default to TRUE.}

\item{swipeToClose}{Whether the Popup can be closed with swipe gesture. Can be true to allow to close popup with swipes to top and to bottom.
Default to FALSE.}
}
\description{
Create a f7 popup
}
\examples{
if (interactive()) {
 library(shiny)
 library(shinyMobile)
 shiny::shinyApp(
   ui = f7Page(
     color = "pink",
     title = "My app",
     f7SingleLayout(
      navbar = f7Navbar(
        title = "f7Popup",
        hairline = FALSE,
        shadow = TRUE
      ),
      f7Button("togglePopup", "Toggle Popup"),
      f7Popup(
       id = "popup1",
       title = "My first popup",
       f7Text("text", "Popup content", "This is my first popup ever, I swear!"),
       verbatimTextOutput("popupContent")
      )
     )
   ),
   server = function(input, output, session) {

    output$popupContent <- renderPrint(input$text)

    observeEvent(input$togglePopup, {
     f7TogglePopup(id = "popup1")
    })

    observeEvent(input$popup1, {

     popupStatus <- if (input$popup1) "opened" else "closed"

     f7Toast(
      session,
      position = "top",
      text = paste("Popup is", popupStatus)
     )
    })
   }
 )
}
}
