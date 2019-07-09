# install packages

if (!require(pacman)){
	install.packages("pacman")
}

# packages needed for this project
pacman::p_load(tidyverse, 
							 readxl, 
							 openxlsx,
							 readODS,
							 here,
							 rlang,
							 glue)
