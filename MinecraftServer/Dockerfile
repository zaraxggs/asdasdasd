FROM openjdk:17-jdk-slim

WORKDIR /minecraft

# Instalar wget
RUN apt-get update && apt-get install -y wget

# Descargar server.jar
RUN wget https://piston-data.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar -O server.jar

# Copiar EULA
COPY eula.txt .

# Exponer puerto
EXPOSE 25565

# Comando para arrancar el servidor (shell form)
CMD java -Xmx512M -Xms512M -jar server.jar nogui
