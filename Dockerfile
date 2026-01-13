# Imagen base con Java 17
FROM eclipse-temurin:17-jdk

# Carpeta del servidor
WORKDIR /minecraft

# Instalar wget, ca-certificates y tar (para ngrok)
RUN apt-get update && apt-get install -y wget ca-certificates tar && rm -rf /var/lib/apt/lists/*

# Descargar server.jar de Minecraft
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar

# Copiar EULA y script de arranque
COPY eula.txt .
COPY start.sh .

# Dar permisos al script
RUN chmod +x start.sh

# Descargar e instalar ngrok v3 estable
RUN wget -O ngrok-v3.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz \
    && tar xvzf ngrok-v3.tgz \
    && mv ngrok /usr/local/bin/ \
    && rm ngrok-v3.tgz

# Configurar tu token de ngrok (reemplaza TU_NGROK_TOKEN)
RUN ngrok config add-authtoken 2jE5OMl0nKwBhf4iWLdOdfdt9SQ_vLbWgXMSMJZobeJ7STLQ

# Exponer puerto 25565 (Minecraft)
EXPOSE 25565

# Arrancar Minecraft + ngrok
CMD ["./start.sh"]
