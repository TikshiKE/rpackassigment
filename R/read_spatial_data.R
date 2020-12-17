#' Preprocessing spatial dataset
#'
#' @param dir A directory with .nc files
#' @param ext Extention for the area
#'
#' @return A dataset with cells ID as columnnames and precipitation data
#' @export readData_sp
#'
#' @examples

read_spatial_data <- function(dir, ext){
nc <- nc_open(dir)
#Precipitation:precip
err <- try(expr = {p <- ncvar_get(nc, varid = 'pr')}, silent = TRUE)
if (inherits(err, what = 'try-error')) {
  err <- try(expr = {p <- ncvar_get(nc, varid = 'precipitation_flux')}, silent = TRUE)
}
#Longitude:lon
err <- try(expr = {lon <- ncvar_get(nc, varid = 'lon')}, silent = TRUE)
if (inherits(err, what = 'try-error')) {
  err <- try(expr = {lon <- ncvar_get(nc, varid = 'longitude')}, silent = TRUE)
}
#Latitude:lat
err <- try(expr = {lat <- ncvar_get(nc, varid = 'lat')}, silent = TRUE)
if (inherits(err, what = 'try-error')) {
  err <- try(expr = {lat <- ncvar_get(nc, varid = 'latitude')}, silent = TRUE)
}
#Creating a dt from raster
rast <- brick(p)
extent(rast) <- c(range(lon), range(lat))
aux <- as.data.table(t(extract(rast, ext)))
names(aux) <- as.character(cellsFromExtent(rast, ext))
return(aux)
}

