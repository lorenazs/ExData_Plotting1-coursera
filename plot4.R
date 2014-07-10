# Course : Exploratory Data Analysis
# Project 1  
# Plot4
# Lorena Zúñiga Segura ,  July 2014

#leer los datos

datos <- read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings='?',stringsAsFactors=FALSE)

#seleccionar solamente fechas de interés
datos <- datos[datos$Date == '1/2/2007' | datos$Date=='2/2/2007',]

#unir fecha y hora, pasar a formato fecha

datos$Date<-paste(datos$Date,datos$Time)
datos$Date<-strptime(datos$Date,'%d/%m/%Y %H:%M:%S')

#abrir graphic device
png('plot4.png', height=480,width=480, unit='px')

#establecer dos filas y dos columnas
par(mfrow=c(2,2))

#crear el gráfico Global Active Power
plot(datos$Date,datos$Global_active_power,type='l',ylab='Global Active Power',xlab='')

#crear el gráfico voltage
plot(datos$Date,datos$Voltage,type='l',ylab='Voltage',xlab='datetime')

#crear el gráfico Energy Sub Metering
plot(datos$Date,datos$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='')
lines(datos$Date,datos$Sub_metering_2,type='l',col='red')
lines(datos$Date,datos$Sub_metering_3,type='l',col='blue')
#agregar leyendas
legend('topright', box.col='NA', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=2,col=c('black','red','blue'))

#crear el gráfico Global reactive power
plot(datos$Date,datos$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime')


#cerrar graphic device
dev.off()
