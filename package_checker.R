# Package checker script

source("required_packages.R")

test <- packages %in% rownames(installed.packages())

if(all(test))
{
    cat("All required CRAN packages are installed.\n")
    not <- NULL
} else
{
    not <- packages[which(test == FALSE)]
    cat(paste0("CRAN packages not installed: ", not,
               ". \nPlease install them.\n"))
}

### Check glmmADMB

admb_test <- "glmmADMB" %in% rownames(installed.packages())

if(admb_test){
    cat("glmmADMB is installed.\n")
} else{
    cat("glmmADMB is NOT installed.\nPlease install.\n")
}

### Check victim

victim_test <- "victim" %in% rownames(installed.packages())

if(victim_test){
    cat("victim is installed.\n")
} else{
    cat("victim is NOT installed.\nPlease install.\n")
}
