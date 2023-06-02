#' Calcula la codificación para matrices de contrastes
#' @param my_contrats Matriz de contrastes especificando un contraste por fila.
#' Para un factor con n niveles, debería tener dimensión (n - 1) x n.
get_contrasts_coding <- function(my_contrasts) {
  if ((nrow(my_contrasts) != (ncol(my_contrasts) - 1))) {
    stop(
      paste0("Invalid dimensions for my_contrasts.",
             "For n levels of a factor should be (n - 1) x n")
    )
  }
  my_contrasts <- rbind("constant" = 1 / ncol(my_contrasts), my_contrasts)
  solve(my_contrasts)[, -1]
}

