# Configuration file for the Sphinx documentation builder.
from datetime import datetime

project = "OMNIA"
author = "E4SMA"
copyright = f"{datetime.now().year}, E4SMA, ESMIA, UCL, Imperial"
release = "D 3.9"
version = "D 3.9"

extensions = [
    "myst_parser",
    "sphinx.ext.mathjax",
    "sphinx.ext.autosectionlabel",
]

templates_path = ["_templates"]
exclude_patterns = [
    "_build",
    "Thumbs.db",
    ".DS_Store",
]

source_suffix = {
    ".md": "markdown",
}

myst_enable_extensions = [
    "colon_fence",
    "deflist",
    "html_image",
    "dollarmath",
    "amsmath",
]

# Number figures/tables so {numref} references resolve as "Fig. N"
numfig = True

# Landing page
master_doc = "index"

# Theme (same family as the open-prom reference site)
html_theme = "sphinx_rtd_theme"
html_static_path = ["_static"]
html_title = "OMNIA"
html_baseurl = "https://github.com/CLIMATE-DIAMOND/OMNIA"
html_show_sourcelink = False

html_theme_options = {
    "collapse_navigation": False,
    "navigation_depth": 3,
    "titles_only": False,
}
