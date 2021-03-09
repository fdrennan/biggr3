#!/bin/bash

R -e "install.packages('rmarkdown')"
R -e "install.packages('renv')"
R -e "renv::init(force=TRUE)"
R -e "renv::restore()"