pacman::p_load(rworldmap)

locations <- tribble(
	~`lat`, ~`long`, ~`facility`,
	#-----/------/--------
	35.298, -78.617, "U",
	35.214, -78.435, "V",
	35.480, -78.469, "W",
	35.118, -78.147, "X",
	35.374, -77.542, "Y",
	35.227, -78.321, "Z"
)

newmap <- getMap(resolution = "low")

plot(newmap, xlim = c(-84, -75), ylim = c(33, 36))
points(locations$long, locations$lat, col = "red")


pacman::p_load(ggmap)

NC <- map_data("state") %>% 
	filter(region == "north carolina")

counties <- map_data("county") %>% 
	filter(region == "north carolina")

ggplot() +
	geom_polygon(data = NC, aes(x= long, y = lat), color = "white") +
	coord_fixed(1.3)+
	geom_polygon(data = counties, aes(x = long, y = lat)) +
	geom_point(data = locations, mapping = aes(x=long, y= lat), color = "red") +
	theme_nothing()

nc_base <- ggplot(data = NC, mapping = aes(x = long, y = lat)) +
	coord_fixed(1.3)+
	geom_polygon(color = "black", fill = "gray") +
	theme_nothing()

nc_base	+
	geom_point(data = locations, mapping = aes(x=long, y= lat), color = "red")

qmplot(long, lat, data = locations)	




