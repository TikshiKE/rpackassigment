The RPackage project(Advanced R Programming)
================

## Intro


It is a very simple extension with some function for data analysis. 
These features were used during the Advanced Programming course in R and are mostly a demonstration of the knowledge gained, rather than a really useful and unique package.

## Installation

``` r
devtools::install_github('https://github.com/TikshiKE/rpackassigment.git')
```

## Functionality

With this package you can work with raw .rds and .nc data.
Documentation for the functions is included.

# data.table

``` r
#Load the package
library(rpackassigment)
#Temerature DDF
#Assign your filenames to some var
dir <- dir()
#Run the function to read this data and make small corrections(.rds)
dt <- readData(dir('README_files'))
#Process your dataset to look properly with ddf_temp/precip
ddf <- ddf_temp(dt)
#Calculate historical ddf and delta
final_dt <- ddf_calc(final_temp)
```

# spatial data

``` r
#Load the package
library(rpackassigment)
#Read your spatial data(precipitaton, longitude and latitude)
aux <- readData_sp(dir)
#Create a dataset for the dates and forcing
dates_forcing <- read_Dates_forcing(dir)
#Summarize everything and merge it together
spatial_summary(dir, aux, dates_forcing)
```
