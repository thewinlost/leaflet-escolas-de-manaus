# Integrantes: Helen Gabriele Veleda Araújo: 20191620097, Maria Eduarda Resing Plentz: 20191620038;
# Pérola Fabiane Moura da Rosa: 20191620216; Vitória Eduarda da Rosa Jardim: 20191620151.
install.packages("dplyr")
library(dplyr)
install.packages("leaflet",dependencies = T)
library(leaflet)
utils::remove.packages('geobr')
devtools::install_github("ipeaGIT/geobr", subdir = "r-package")
library(geobr)



teste <- read_schools()

escolas <- subset(teste,teste$abbrev_state=="AM")
escolasMn <- subset(escolas, escolas$name_muni=="Manaus")
plot(escolasMn)


icone <- awesomeIcons(
  iconColor = 'black',
  library = 'ion',
  markerColor = "pink",
)

map <- leaflet(mn) %>% addTiles()
map <- leaflet(escolasMn) %>% addTiles()
map %>% addAwesomeMarkers(layer=escolasMn$name_school,label = 
                            escolasMn$name_school, icon= icone)


