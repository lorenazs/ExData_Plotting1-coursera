# Course : Exploratory Data Analysis
# Project 1  
# Plot1
# Lorena Zúñiga Segura ,  July 2014


#leer los datos

datos <- read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings='?')

#convertir a clase Date

datos$Date = as.Date(datos$Date,'%d/%m/%Y')

#escoger fechas de interés
datos<-datos[datos$Date== '2007-02-01' | datos$Date=='2007-02-02',]

#abrir graphic device
png('plot1.png', height=480,width=480, unit='px')

#crear el histograma

hist(datos$Global_active_power, xlab='Global Active Power (kilowatts)', col ='red', main='Global Active Power')

#cerrar graphic device
dev.off()
