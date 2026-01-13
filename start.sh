#!/bin/bash

# Arrancar ngrok en background (túnel TCP para Minecraft)
ngrok tcp 25565 &

# Esperar 5 segundos para que ngrok inicie
sleep 5

# Arrancar Minecraft
java -Xmx512M -Xms512M -jar server.jar nogui
