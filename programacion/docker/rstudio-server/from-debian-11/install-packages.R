# packages required to create an Rmd file
packages_rmd = c(
    "base64enc", "digest", "evaluate", "glue", "highr",
    "htmltools", "jsonlite", "knitr", "magrittr", "markdown",
    "mime", "rmarkdown", "stringi", "stringr", "xfun", "yaml"
)

# packages used in estadistica-descriptiva course
packages_ed = c(
    "reticulate", "tidyverse", "gmodels", "kableExtra", "xtable",
    "MASS", "Rlab"
)

# packages used in probabilidad course
packages_p = c(
    "gtools", "latex2exp", "Pareto", "dgumbel", "data.table",
    "dplyr", "gumbel", "Matrix"
)

theming = c("rmdformats")

# packages used in estadistica-inferencial course
packages_ei = c(
    "epitools", "faraway", "nortest", "EnvStats", "lmtest",
    "car", "TeachingDemos", "fBasics", "agricolae", "ggplot2",
    "lessR", "devtools", "amap"#, "HH"
)

packages = c(
    packages_rmd,
    packages_ed,
    packages_p,
    packages_ei,
    theming
)

install.packages(packages)
