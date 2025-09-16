#!/bin/bash
# Sai se houver algum erro
set -e

# Instala dependências
npm install

# Build dos binários
npm run build

# Inicia GenieACS
# CWMP precisa abrir a porta $PORT para Render detectar
node bin/genieacs-cwmp --port $PORT --log-level info &

# FS e NBI podem rodar em background
node bin/genieacs-fs --log-level info &
node bin/genieacs-nbi --log-level info &

# Mantém o container ativo
wait
