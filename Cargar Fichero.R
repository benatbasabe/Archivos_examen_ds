setwd("C:/Users/Usuario/Music/Beñat Basabe/Uni/RETO 4/Data Science/Examen de DS/Archivos_examen_ds")
load("muestra08.RData")


dim(muestra08)
View(muestra08)


#Cambiamos nombre de  las columnas
dput(colnames(muestra08))
colnames(muestra08) <- c("nif", "nombre", "genero")


#arreglamos la columna genero
library(tidyverse)
chicos <- muestra08%>%
  filter(genero=="V")%>%
  group_by(nombre)%>%
  count(nombre)

chicas <- muestra08%>%
  filter(genero=="M")%>%
  group_by(nombre)%>%
  count(nombre)

vacios <- muestra08%>%
  filter(genero=="")%>%
  group_by(nombre)

genero <- merge(muestra08, chicas, by="nombre")
genero <- merge(genero, chicos, by="nombre")
genero <- merge(genero, vacios, by="nombre")

dput(colnames(genero))
colnames(genero) <- c("nif", "nombre", "genero", "n_M", "n_V")


genero$genero_imp[genero$n_M>genero$n_V]="M"
genero$genero_imp[genero$n_V>genero$n_M]="V"

genero <- genero%>%
  filter(genero_imp!="")


View(muestra08)




#Modificamos Expresiones regulares del Nif
library(tidyr)
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
muestra08$nif_correccion <- grepl(pattern=regexp,x=muestra08$nif)
muestra08 <- muestra08%>%
  filter(nif_correccion==T)


