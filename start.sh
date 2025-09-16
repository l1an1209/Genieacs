#!/bin/bash
set -e

echo "Iniciando GenieACS..."

# Garante permissões
chmod +x bin/genieacs-*

# Inicia os serviços em background
./bin/genieacs-cwmp &
./bin/genieacs-fs &
./bin/genieacs-nbi &
./bin/genieacs-ui &

# Mantém o shell ativo para o Render não encerrar
wait
