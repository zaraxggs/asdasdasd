# Imagen base con Java 17 (Eclipse Temurin)
FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Instalar herramientas necesarias
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

# Descargar server.jar
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar

# Copiar EULA
COPY eula.txt .

# Exponer el puerto de Minecraft
EXPOSE 25565

# Arrancar el servidor
CMD java -Xmx512M -Xms512M -jar server.jar nogui
