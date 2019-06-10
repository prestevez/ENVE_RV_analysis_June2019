# package installer

source("package_checker.R")

if(!is.null(not))
{
    cat(paste0("CRAN packages not installed: ", not,
               "\nInstalling... ", not, "\n"))


    ## Install all available on CRAN

    install.packages(not,
        repos = "https://cloud.r-project.org/")

}

# Check and install glmmADMB

if(!admb_test){
    cat("glmmADMB not installed. \nInstalling from source...\n")
    install.packages("glmmADMB",
        repos=c("http://glmmadmb.r-forge.r-project.org/repos",
                getOption("repos")),
        type="source")
}


# All packages should now be installed

source("package_checker.R")
