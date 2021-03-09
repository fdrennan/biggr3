message('Begin .Rprofile')
tryCatch(expr = {
  source("renv/activate.R")
}, error = function(err) {
  message('Passing renv/activate.R failure as warning')
  warning(as.character(err))
  message('\n\nsystem(\'./rstudio_startup.sh\')\n\n')
})
