library(tidyverse)
library(sf)
library(plotly)
library(magrittr)
library(leaflet)
library(ggdark)
#
# Cargar Distritos
map3 <- st_read("gadm41_PER_shp/gadm41_PER_3.shp")

# Filtrando Distrito:La Molina y generando shp
molina <- map3 %>%
  filter(NAME_3 == "La Molina")
st_write(molina, "molina.shp")

# Cargando Mzn de La Molina
molina_mzn <- st_read("SIGRID_resultados_molina/polygons.shp")

mg1 <-
  ggplot() +
  geom_sf(data = molina, fill = "orange", alpha = .2) +
  geom_sf(data = molina_mzn, fill = "blue", alpha = .5) +
  dark_mode()

ggplotly(mg1)

leaflet() %>%
  addTiles() %>%
  addPolygons(data = molina_mzn) %>%
  addPolygons(data = molina)
