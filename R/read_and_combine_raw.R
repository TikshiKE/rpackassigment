#' Data reading function
#'
#' @param dir dirrectory with all the raw data files
#' @param na.rm FALSE by default
#'
#' @return A one combined dataset with filename and data
#' @export readData
#'
#' @examples
#'
read_and_combine_raw <- function(dir, na.rm = FALSE) {
  result <- list()
  for(i in c(1:length(dir))) {
    dta <- lapply(dir, readRDS)
    names(dta) <- dir
    dta <- rbindlist(dta, idcol = 'SID')
    result[[i]] <- as.data.table(dta, na.rm = na.rm)
  }
  rbindlist(result)
}
