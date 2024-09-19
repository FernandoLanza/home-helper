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
RUN ./mvnw clean install -DskipTests
RUN mkdir /app/jar
RUN cp target/servicios-tecnicos-0.0.1-SNAPSHOT.jar /app/jar/
CMD ["java", "-jar", "/app/jar/servicios-tecnicos-0.0.1-SNAPSHOT.jar"]

# Limpiar las dependencias no necesarias
RUN mvn clean

# Exponer el puerto de la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
# CMD ["java", "-jar", "target/servicios-tecnicos-0.0.1-SNAPSHOT.jar"]
#CMD ["java", "-jar", "/app/target/servicios-tecnicos-0.0.1-SNAPSHOT.jar"]
