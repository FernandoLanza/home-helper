# Usar la imagen de Java 22 basada en Debian como base
FROM openjdk:22-ea-jdk-slim

# Instalar Maven usando apt-get
RUN apt-get update && apt-get install -y maven

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar todo el código del proyecto al directorio de trabajo del contenedor
COPY . /app/

# Dar permisos de ejecución a Maven wrapper (./mvnw)
RUN chmod +x ./mvnw

# Ejecutar Maven para compilar e instalar las dependencias del proyecto
RUN ./mvnw -DskipTests clean install -Dmaven.compiler.release=22 -Dmaven.compiler.failOnError=false

# Limpiar las dependencias no necesarias
RUN mvn clean

# Exponer el puerto de la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "target/servicios-tecnicos-0.0.1-SNAPSHOT.jar"]
