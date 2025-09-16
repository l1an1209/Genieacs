#!/bin/bash

# ===============================
# Start script para GenieACS no Render
# ===============================

# Porta fornecida pelo Render
PORT=${PORT:-3000}

echo "Iniciando GenieACS..."

# Gera binários
npm run build-cwmp || exit 1
npm run build-fs   || exit 1
npm run build-nbi  || exit 1
npm run build-ui   || exit 1

# Inicia serviços de backend (não precisam expor porta)
./bin/genieacs-cwmp &
./bin/genieacs-fs   &
./bin/genieacs-nbi  &

# Inicia UI na porta que o Render exige
exec ./bin/genieacs-ui --port $PORT --host 0.0.0.0
