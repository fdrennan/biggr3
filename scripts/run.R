library(glue)
library(stringr)

glue_system <- function(string) {
  string <- glue(string)
  message(string)
  system(string)
}

APPLICATION <- "SHINY" # 'SHINY', 'PLUMBER', 'SCRIPT'
HOST <- "0.0.0.0"
PORT <- 3838
SWAGGER_UI <- TRUE # PLUMBER ONLY

if (APPLICATION == "SHINY") {
  shiny::runApp(
    appDir = "app",
    port = PORT,
    launch.browser = FALSE,
    host = HOST
  )
} else if (APPLICATION == "PLUMBER") {
  pr <- plumber::plumb("plumber.R")
  pr$run(
    host = HOST,
    port = PORT,
    swagger = SWAGGER_UI
  )
} else if (APPLICATION == "SCRIPT") {
  print(reticulate::import("paramiko"))
}
