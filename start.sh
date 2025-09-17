#!/bin/bash
set -e

# ===============================
# CONFIGURAÇÃO DE VARIÁVEIS
# ===============================

export MONGO_URL="mongodb+srv://luanpa082:L1an1010@cluster0.n3wzlxp.mongodb.net/genieacs?retryWrites=true&w=majority"
export REDIS_URL="rediss://default:GyF7WltUj6MDZ7xo7qTg568ppJUpzW38GyF7WltUj6MDZ7xo7qTg568ppJUpzW38@redis-14320.crce207.sa-east-1-2.ec2.redns.redis-cloud.com:14320"

# Porta do UI (obrigatório para Render)
PORT=${PORT:-3000}

# ===============================
# FUNÇÃO PARA RODAR MÓDULOS
# ===============================

run_module() {
    MODULE=$1
    echo "Iniciando GenieACS $MODULE..."
    # Redireciona logs para arquivo
    node ./bin/$MODULE > logs/$MODULE.log 2>&1 &
}

# Criar pasta de logs
mkdir -p logs

# Rodar todos os módulos em background
run_module cwmp
run_module fs
run_module nbi

# Rodar UI como processo principal (Render monitora este)
echo "Iniciando GenieACS UI na porta $PORT..."
exec PORT=$PORT node ./bin/genieacs-ui
