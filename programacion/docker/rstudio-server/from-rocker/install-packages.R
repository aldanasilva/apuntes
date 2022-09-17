# packages required to create an Rmd file
r_packages_rmd = c(
    "base64enc", "digest", "evaluate", "glue", "highr",
    "htmltools", "jsonlite", "knitr", "magrittr", "markdown",
    "mime", "rmarkdown", "stringi", "stringr", "xfun", "yaml"
)

# packages used in estadistica-descriptiva course
r_packages_ed = c(
    "reticulate", "tidyverse", "gmodels", "kableExtra", "xtable",
    "MASS", "Rlab"
)

# packages used in probabilidad course
r_packages_p = c(
    "gtools", "latex2exp", "Pareto", "dgumbel", "data.table",
    "dplyr", "gumbel", "Matrix"
)

# packages used in estadistica-inferencial course
r_packages_ei = c(
    "epitools", "faraway", "nortest", "EnvStats", "lmtest",
    "car", "TeachingDemos", "fBasics", "agricolae", "ggplot2",
    "lessR", "devtools", "amap"#, "HH"
)

r_theming = c("rmdformats")

r_packages = c(
    r_packages_rmd,
    r_packages_ed,
    r_packages_p,
    r_packages_ei,
    r_theming
)

install.packages(r_packages)

# Required to write LaTeX text
tinytex::install_tinytex()

# Install python to use it with reticulate
py_packages = c(
    "numpy", "pandas", "scipy", "statsmodels",
    "matplotlib", "seaborn", "plotly",
    "sklearn"
)

reticulate::install_python(version="3.8.12")
reticulate::py_install(py_packages)
