#!/bin/bash
# start.sh - Inicializa os serviços do GenieACS com logs coloridos

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

echo -e "${YELLOW}Iniciando serviços do GenieACS...${NC}"

# CWMP
if [ -f ./bin/genieacs-cwmp ]; then
    pm2 start ./bin/genieacs-cwmp --name genieacs-cwmp -- --port $PORT --log-level info
    echo -e "${GREEN}genieacs-cwmp iniciado com sucesso!${NC}"
else
    echo -e "${RED}Arquivo bin/genieacs-cwmp não encontrado!${NC}"
fi

# FS
if [ -f ./bin/genieacs-fs ]; then
    pm2 start ./bin/genieacs-fs --name genieacs-fs
    echo -e "${GREEN}genieacs-fs iniciado com sucesso!${NC}"
else
    echo -e "${RED}Arquivo bin/genieacs-fs não encontrado!${NC}"
fi

# NBI
if [ -f ./bin/genieacs-nbi ]; then
    pm2 start ./bin/genieacs-nbi --name genieacs-nbi
    echo -e "${GREEN}genieacs-nbi iniciado com sucesso!${NC}"
else
    echo -e "${RED}Arquivo bin/genieacs-nbi não encontrado!${NC}"
fi

# UI
if [ -f ./bin/genieacs-ui ]; then
    pm2 start ./bin/genieacs-ui --name genieacs-ui
    echo -e "${GREEN}genieacs-ui iniciado com sucesso!${NC}"
else
    echo -e "${RED}Arquivo bin/genieacs-ui não encontrado!${NC}"
fi

echo -e "${YELLOW}Todos os serviços foram inicializados. Monitorando logs...${NC}"
pm2 logs
