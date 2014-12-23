#!/bin/bash
if ! [ -z "$1" ]; then
	docker kill $1-hub
	docker kill $1-ff
	docker kill $1-chrome

	docker rm $1-hub
	docker rm $1-ff
	docker rm $1-chrome
else
	echo "Usage: $0 GRIDNAME"
fi
