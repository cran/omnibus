#' Append values to elements of a list from another list
#'
#' This function "adds" two lists with the same or different names together. For example, if one list is as \code{l1 <- list(a=1, b="XYZ")} and the second is as \code{l2 <- list(a=3, c=FALSE)}, the output will be as \code{list(a = c(1, 3), b = "XYZ", c = FALSE)}. All elements in each list must have names.
#'
#' If two lists share the same name and these elements have the same class, then they will be merged as-is. If the classes are different, one of them will be coerced to the other (see *Examples*). The output will have elements with the names of all lists.
#'
#' @param ... Two or more lists. All elements must have names.
#'
#' @seealso \code{\link{mergeLists}}
#'
#' @returns A \code{list}.
#'
#' @examples
#' 
#' # same data types for same named element
#' l1 <- list(a=1, b="XYZ")
#' l2 <- list(a=3, c=FALSE)
#' appendLists(l1, l2)
#' 
#' # different data types for same named element
#' l1 <- list(a=3, b="XYZ")
#' l2 <- list(a="letters", c=FALSE)
#' appendLists(l1, l2)
#' 
#' @aliases appendLists
#' @rdname appendLists
#' @export
appendLists <- function(...) {

	dots <- list(...)
	
	for (i in seq_along(dots)) {
		names <- names(dots[[i]])
		if (any(is.null(names)) || anyNA(names)) stop("All elements in the list have to have names.")
	}

	out <- dots[[1L]]
	for (i in 2L:length(dots)) {

		l1 <- out
		l2 <- dots[[i]]
		binded <- c(l1, l2)
		out <- tapply(binded, names(binded), function(x) unlist(x, FALSE, FALSE))
		
	}
	
	out
	
}
