library(pacman)
p_load(stringr, magrittr, rmarkdown)

# Render to pdf
render("syllabus.Rmd",
  pdf_document(
    latex_engine = "xelatex",
    toc = F,
    number_sections = F,
    highlight = "pygments",
    pandoc_args = c(
      # "--metadata=author:\"Ed Rubin\"",
      # pandoc_variable_arg("mainfont", "Charter"),
      # pandoc_variable_arg("mainfont", "Georgia"),
      # pandoc_variable_arg("mainfont", "Avenir"),
      # pandoc_variable_arg("monofont", "Hack"),
      # pandoc_variable_arg("fontsize", "10pt")
      pandoc_variable_arg("mainfont", "Lato"),
      # pandoc_variable_arg("mainfont", "Fira Sans"),
      pandoc_variable_arg("monofont", "Hack"),
      pandoc_variable_arg("fontsize", "11pt"),
      pandoc_variable_arg("linestretch", "0.85")
      )
    ),
  output_file = "syllabus.pdf",
  output_dir = ".")
