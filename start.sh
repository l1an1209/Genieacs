#!/bin/bash

# ===============================
# Start script para GenieACS no Render
# ===============================

# Cores para logs
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
NC="\033[0m" # Sem cor

echo -e "${GREEN}Iniciando build do GenieACS...${NC}"

# Gera todos os binários
npm run build-cwmp || { echo -e "${RED}Falha ao gerar cwmp${NC}"; exit 1; }
npm run build-fs   || { echo -e "${RED}Falha ao gerar fs${NC}"; exit 1; }
npm run build-nbi  || { echo -e "${RED}Falha ao gerar nbi${NC}"; exit 1; }
npm run build-ui   || { echo -e "${RED}Falha ao gerar ui${NC}"; exit 1; }

echo -e "${GREEN}Build concluído com sucesso!${NC}"

# Porta fornecida pelo Render (obrigatório)
PORT=${PORT:?A variável de porta do Render não está definida}
echo -e "${GREEN}Usando porta $PORT${NC}"

# Caminho do PM2 local
PM2="./node_modules/.bin/pm2"

# Verifica se pm2 está instalado
if [ ! -f "$PM2" ]; then
  echo -e "${YELLOW}pm2 não encontrado localmente, instalando...${NC}"
  npm install pm2 --save
fi

echo -e "${GREEN}Iniciando serviços do GenieACS...${NC}"

# Função para iniciar serviço e verificar existência do binário
start_service() {
  local BIN="$1"
  local NAME="$2"
  if [ -f "$BIN" ]; then
    echo -e "${GREEN}Iniciando $NAME na porta $PORT...${NC}"
    $PM2 start "$BIN" --name "$NAME" -- --port $PORT
    echo -e "${GREEN}$NAME iniciado com sucesso${NC}"
  else
    echo -e "${RED}Arquivo $BIN não encontrado!${NC}"
  fi
}

# Inicia todos os serviços
start_service "./bin/genieacs-cwmp" "genieacs-cwmp"
start_service "./bin/genieacs-fs" "genieacs-fs"
start_service "./bin/genieacs-nbi" "genieacs-nbi"
start_service "./bin/genieacs-ui" "genieacs-ui"

echo -e "${GREEN}Todos os serviços foram inicializados. Monitorando logs...${NC}"

# Mantém container vivo com PM2 logs
$PM2 logs
