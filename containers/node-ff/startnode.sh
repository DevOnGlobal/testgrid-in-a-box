#!/bin/bash
set -e

# Run a virtual framebuffer on display :99
export DISPLAY=:99
Xvfb $DISPLAY -screen 0 $SCREEN_DIMENSION &

# Run fluxbox as light-weight window manager in the background in order to correctly size windows
fluxbox -display :99 &

# Run the selenium server as a node
java -jar /selenium-server-standalone.jar \
  -role node \
  -hub http://$HUB_PORT_4444_TCP_ADDR:$HUB_PORT_4444_TCP_PORT/wd/register \
  -browser browserName=firefox,maxInstances=$MAX_INSTANCES
