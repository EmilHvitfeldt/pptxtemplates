cols <- ":::::: {.columns}\n::: {.column}\n\n:::\n::: {.column}\n\n:::\n::::::\n"

insert_pandoc_columns <- function() {

  # Gets The active Documeent
  ctx <- rstudioapi::getActiveDocumentContext()

  # Checks that a document is active
  if (!is.null(ctx)) {

    # Extracts selection as a string
    selected_text <- ctx$selection[[1]]$text

    # modify string
    selected_text <- cols

    # replaces selection with string
    rstudioapi::modifyRange(ctx$selection[[1]]$range, selected_text)

    # New position
    new_position <- rstudioapi::document_position(
      row = ctx$selection[[1]]$range$start[1] + 2,
      column = 1
    )
    rstudioapi::setCursorPosition(new_position)
  }
}
