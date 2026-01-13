# Imagen base con Java 17
FROM eclipse-temurin:17-jdk

WORKDIR /minecraft

# Instalar wget, ca-certificates y unzip (para ngrok)
RUN apt-get update && apt-get install -y wget ca-certificates unzip && rm -rf /var/lib/apt/lists/*

# Descargar server.jar de Minecraft
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar

# Copiar eula y script de arranque
COPY eula.txt .
COPY start.sh .

# Dar permisos al script
RUN chmod +x start.sh

# Descargar e instalar ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
    && unzip ngrok-stable-linux-amd64.zip \
    && mv ngrok /usr/local/bin/ \
    && rm ngrok-stable-linux-amd64.zip

# Poner tu token de ngrok
RUN ngrok authtoken 2jE5OMl0nKwBhf4iWLdOdfdt9SQ_vLbWgXMSMJZobeJ7STLQ

# Exponer puerto (aunque Render Free no lo abra al público)
EXPOSE 25565

# Arrancar Minecraft + ngrok
CMD ["./start.sh"]