#' Historical and difference DDF calculation
#'
#' @param ddf_dt A processed dataset with historical RCP
#'
#' @return A final dataset with all the data
#' @export ddf_calc
#'
#' @examples
ddf_calculations <- function(ddf_dt){
  #Historical
  hddf <- ddf_dt[RCP == 'historical', .(Duration, hdepth = depth, freq, hour, RCP, GCM, RCM, Run)]
  ddf_dt <- ddf_dt[RCP != 'historical']
  #Delta
  cddf <- hddf[ddf_dt, on = c('Duration', 'freq', 'hour', 'GCM', 'RCM', 'Run')]
  cddf[, delta := depth / hdepth]
  #Some weird lines for beautifying
  cddf[, 5 := NULL]
  setnames(cddf, 'i.RCP', 'RCP')
  return(cddf)
}
