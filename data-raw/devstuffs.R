library(usethis)
library(desc)

# Remove default DESC
unlink("DESCRIPTION")
# Create and clean desc
my_desc <- description$new("!new")

# Set your package name
my_desc$set("Package", "rmd4j")

#Set your name
my_desc$set("Authors@R", "person('Colin', 'Fay', email = 'colin@thinkr.fr', role = c('cre', 'aut'))")

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.0.0.9000")

# The title of your package
my_desc$set(Title = "Knitr Engine for Neo4j")
# The description of your package
my_desc$set(Description = "A Knitr engine that allows to run Neo4j code inside an RMarkdown.")

# The urls
my_desc$set("URL", "https://github.com/thinkr/rmd4j")
my_desc$set("BugReports", "https://github.com/thinkr/rmd4j/issues")
# Save everyting
my_desc$write(file = "DESCRIPTION")

# If you want to use the MIT licence, code of conduct, and lifecycle badge
use_mit_license(name = "ThinkR")
use_readme_rmd()
use_code_of_conduct()
use_lifecycle_badge("Experimental")
use_news_md()


# Test that
use_testthat()
use_test("")

# Get the dependencies
use_package("attempt")
use_package("glue")
use_package("knitr")


# Vignette
use_vignette("rmd4j")
build_vignettes()

# Create the R files
file.create("R/knitr_engine.R")
file.edit("R/knitr_engine.R")

# Create the RMarkdown template
dir.create("inst/rmarkdown/templates/rmd4j/skeleton", recursive = TRUE)
file.create("inst/rmarkdown/templates/rmd4j/skeleton/skeleton.Rmd")
file.edit("inst/rmarkdown/templates/rmd4j/skeleton/skeleton.Rmd")
file.create("inst/rmarkdown/templates/rmd4j/template.yaml")
file.edit("inst/rmarkdown/templates/rmd4j/template.yaml")

# Codecov
use_travis()
use_appveyor()
use_coverage()

# Clean your description
use_tidy_description()

# Test with rhub
rhub::check_for_cran()
