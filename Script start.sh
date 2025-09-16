#!/bin/bash
# Inicia todos os módulos do GenieACS usando PM2

# CWMP (usa porta do Render)
npx pm2 start bin/genieacs-cwmp --name genieacs-cwmp -- --port $PORT --log-level info

# FS
npx pm2 start bin/genieacs-fs --name genieacs-fs

# NBI
npx pm2 start bin/genieacs-nbi --name genieacs-nbi

# Mantém logs ativos
npx pm2 logs
