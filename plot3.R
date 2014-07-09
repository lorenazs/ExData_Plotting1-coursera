# Course : Exploratory Data Analysis
# Project 1  
# Plot3
# Lorena Zúñiga Segura ,  July 2014

#leer los datos

datos <- read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)

#seleccionar solamente fechas de interés
datos <- datos[datos$Date == '1/2/2007' | datos$Date=='2/2/2007',]

#unir fecha y hora, pasar a formato fecha

datos$Date<-paste(datos$Date,datos$Time)
datos$Date<-strptime(datos$Date,'%d/%m/%Y %H:%M:%S')

#abrir graphic device
png('plot3.png', height=480,width=480, unit='px')

#crear el grafico
plot(datos$Date,datos$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='')
lines(datos$Date,datos$Sub_metering_2,type='l',col='red')
lines(datos$Date,datos$Sub_metering_3,type='l',col='blue')
#agregar leyendas
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=2,col=c('black','red','blue'))

#cerrar graphic device
dev.off()
