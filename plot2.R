# Course : Exploratory Data Analysis
# Project 1  
# Plot2
# Lorena Zúñiga Segura ,  July 2014

#leer los datos

datos <- read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings='?')

#convertir a clase Date

datos$Date<-paste(datos$Date,datos$Time)
datos$Date<-strptime(datos$Date,'%d/%m/%Y %H:%M:%S')

#escoger fechas de interés
 
datos<-datos[year(datos$Date)=='2007' & month(datos$Date)=='2' & (day(datos$Date)=='1'| day(datos$Date)=='2'),]

#abrir graphic device
png('plot2.png', height=480,width=480, unit='px')

#crear el grafico
plot(datos$Date,datos$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')
#cerrar graphic device
dev.off()
