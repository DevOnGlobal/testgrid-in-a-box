#!/bin/bash
if ! [ -z "$1" ]; then
	docker run -d -P --name $1-hub prowareness/selenium-hub
	docker run -d --link $1-hub:hub --name $1-ff prowareness/selenium-node-ff
	docker run -d --link $1-hub:hub --name $1-chrome prowareness/selenium-node-chrome
else
	echo "Usage: $0 GRIDNAME"
fi
