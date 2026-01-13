# Imagen base con Java
FROM openjdk:17-jdk-slim

# Carpeta del servidor
WORKDIR /minecraft

# Descargar automáticamente el server.jar
RUN apt-get update && apt-get install -y wget
RUN wget https://piston-data.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar -O server.jar

# Copiar eula.txt
COPY eula.txt .

# Exponer el puerto de Minecraft
EXPOSE 25565

# Comando para arrancar el servidor
CMD ["java", "-Xmx512M", "-Xms512M", "-jar", "server.jar", "nogui"]