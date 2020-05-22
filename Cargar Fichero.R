setwd("C:/Users/Usuario/Music/Beñat Basabe/Uni/RETO 4/Data Science/Examen de DS/Archivos_examen_ds")
load("muestra08.RData")


dim(muestra08)
View(muestra08)


#Cambiamos nombre de  las columnas
dput(colnames(muestra08))
colnames(muestra08) <- c("nif", "nombre", "genero")


#arreglamos la columna genero
 