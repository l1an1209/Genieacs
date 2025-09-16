#!/bin/bash

PORT=${PORT:-10000}

echo "Iniciando GenieACS..."

# CWMP (TR-069)
./bin/genieacs-cwmp &

# File Server
./bin/genieacs-fs &

# NBI (API)
./bin/genieacs-nbi &

# UI (forçar porta do Render)
./bin/genieacs-ui --port $PORT &

wait
