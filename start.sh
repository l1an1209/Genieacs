#!/bin/bash
# Instala dependências e build
npm install
npm run build

# Inicia o GenieACS CWMP ligado à porta do Render
node bin/genieacs-cwmp --port $PORT --log-level info
