# Course : Exploratory Data Analysis
# Project 1  
# Plot2
# Lorena Zúñiga Segura ,  July 2014



#leer los datos

datos <- read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)

#seleccionar solamente fechas de interés
datos <- datos[datos$Date == '1/2/2007' | datos$Date=='2/2/2007',]

#unir fecha y hora, pasar a formato fecha

datos$Date<-paste(datos$Date,datos$Time)
datos$Date<-strptime(datos$Date,'%d/%m/%Y %H:%M:%S')

#abrir graphic device
png('plot2.png', height=480,width=480, unit='px')

#crear el grafico
plot(datos$Date,datos$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')
#cerrar graphic device
dev.off()
