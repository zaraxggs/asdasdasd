# Imagen base con Java y certificados
FROM openjdk:17-jdk-slim

# Carpeta del servidor
WORKDIR /minecraft

# Instalar wget y ca-certificates
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

# Descargar automáticamente el server.jar
RUN wget -O server.jar https://launcher.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar

# Copiar eula.txt
COPY eula.txt .

# Exponer el puerto de Minecraft
EXPOSE 25565

# Comando para arrancar el servidor (shell form)
CMD java -Xmx512M -Xms512M -jar server.jar nogui
