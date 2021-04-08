#' Extract Content Dimension from pptx document
#'
#' @param file Filepath to pptx document
#'
#' @return Named list
#' @export
pptx_content_dimensions <- function(file) {
  template <- officer::read_pptx(file)
  full <- officer::layout_properties(template, "Title and Content")
  full <- full[full$ph_label == "Content Placeholder 2", ]

  columns_ph_labels <- c("Content Placeholder 2", "Content Placeholder 3")
  columns <- officer::layout_properties(template, "Two Content")
  columns <- columns[columns$ph_label %in% columns_ph_labels, ]

  list(
    full = list(fig.height = full$cy, fig.width = full$cx),
    left = list(fig.height = columns$cy[1], fig.width = columns$cx[1]),
    right = list(fig.height = columns$cy[2], fig.width = columns$cx[2])
  )
}
