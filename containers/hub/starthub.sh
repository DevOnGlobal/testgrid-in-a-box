#!/bin/bash
set -e

# Run the selenium server as a hub
java -jar /selenium-server-standalone.jar \
     -role hub
