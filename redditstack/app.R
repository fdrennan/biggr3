library(shiny)
library(redditsuite)

ui <- fluidPage(
  titlePanel("Hello yo!"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      dataTableOutput(outputId = "submissions")
    )
  )
)

server <- function(input, output) {
  output$submissions <- renderDataTable({
    tryCatch(expr = {
      pull_data()
    }, error = function(err) {
      read_table('.Renviron', col_names = FALSE)
    })
  })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
