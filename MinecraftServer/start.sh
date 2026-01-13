#!/bin/bash

# Arrancar ngrok en background
ngrok tcp 25565 &

# Arrancar Minecraft
java -Xmx512M -Xms512M -jar server.jar nogui