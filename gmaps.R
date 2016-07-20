library(magrittr)
library(leaflet)
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=78.3489, lat=17.4401, popup="Gachibowli")
m  # Print the map
