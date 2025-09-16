#!/bin/bash
set -e

# Instala dependências e gera binários
npm install
npm run build

# Inicia FS e NBI em background
node bin/genieacs-fs --log-level info &
node bin/genieacs-nbi --log-level info &

# Inicia CWMP como processo principal e vincula a porta do Render
exec node bin/genieacs-cwmp --port $PORT --log-level info
chmod +x start.sh
