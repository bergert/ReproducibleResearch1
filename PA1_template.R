##############################################################################################################################
# This script to launch analysis for wearable computing
#
# all the real work is done in PA1_template.Rmd
##############################################################################################################################
#setwd("~/GitHub/ReproducibleResearch1")
#source("PA1_template.R")
library(knitr)

# check if the ZIP file is downloaded, it not then download it
file <- "repdata_data_Factivity.zip"
if (!file.exists(file)) {
    logfile <- "repdata_data_Factivity.log"
    url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
    dateDownloaded <- date()
    message(sprintf("start downloaded from '%s'", url))
    download.file(url, file.path(getwd(), file))
    message(sprintf("downloaded '%s' from '%s' on %s", file, url, dateDownloaded))

    write(sprintf("downloaded '%s' from '%s' on %s", file, url, dateDownloaded), file = logfile)
}

# I'm using the name of the expanded ZIP file as is (without moving files around)
datafile <- "activity.csv" 
if (!file.exists(datafile))
    stop(sprintf("'%s' file not found in working directory", datafile))

knit2html("PA1_template.Rmd")

# that's all folks!
