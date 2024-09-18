# Usar la imagen de Java 22 como base
FROM openjdk:22-ea-jdk

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar todo el código del proyecto al directorio de trabajo del contenedor
COPY . /app/

# Dar permisos de ejecución a Maven wrapper (./mvnw)
RUN chmod +x ./mvnw

# Ejecutar Maven para compilar e instalar las dependencias del proyecto
RUN ./mvnw -DskipTests clean install -Dmaven.compiler.release=22 -Dmaven.compiler.failOnError=false

