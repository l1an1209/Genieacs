#!/bin/bash

# ===============================
# Start script para GenieACS no Render
# ===============================

# Cores para logs
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
NC="\033[0m" # Sem cor

# Porta fornecida pelo Render
PORT=${PORT:-3000}

echo -e "${GREEN}Iniciando build do GenieACS...${NC}"

# Gera todos os binários
npm run build-cwmp || { echo -e "${RED}Falha ao gerar cwmp${NC}"; exit 1; }
npm run build-fs   || { echo -e "${RED}Falha ao gerar fs${NC}"; exit 1; }
npm run build-nbi  || { echo -e "${RED}Falha ao gerar nbi${NC}"; exit 1; }
npm run build-ui   || { echo -e "${RED}Falha ao gerar ui${NC}"; exit 1; }

echo -e "${GREEN}Build concluído com sucesso!${NC}"

# Caminho do PM2 local
PM2="./node_modules/.bin/pm2"

# Instala PM2 se não existir
if [ ! -f "$PM2" ]; then
  echo -e "${YELLOW}pm2 não encontrado localmente, instalando...${NC}"
  npm install pm2 --save
fi

echo -e "${GREEN}Iniciando serviços do GenieACS...${NC}"

# Inicia serviços que não precisam de porta exposta
$PM2 start ./bin/genieacs-cwmp --name genieacs-cwmp
$PM2 start ./bin/genieacs-fs   --name genieacs-fs
$PM2 start ./bin/genieacs-nbi  --name genieacs-nbi

# Inicia UI na porta fornecida pelo Render (essa é a única que precisa estar aberta)
$PM2 start ./bin/genieacs-ui --name genieacs-ui -- --port $PORT

echo -e "${GREEN}Todos os serviços foram inicializados. Monitorando logs...${NC}"

# Mantém container vivo e mostra logs
$PM2 logs
