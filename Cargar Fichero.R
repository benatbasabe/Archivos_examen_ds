setwd("C:/Users/Usuario/Music/Beñat Basabe/Uni/RETO 4/Data Science/Examen de DS/Archivos_examen_ds")
load("muestra08.RData")


dim(muestra08)
View(muestra08)


#Cambiamos nombre de  las columnas
dput(colnames(muestra08))
colnames(muestra08) <- c("nif", "nombre", "genero")


#arreglamos la columna genero




#Expresiones regulares nif
library(tidyverse)

regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"

muestra08$genero_imp <- grepl(pattern = regexp, x = muestra08$nif)

muestra08 <- muestra08%>%
  filter(genero_imp==T)

View(muestra08) 
