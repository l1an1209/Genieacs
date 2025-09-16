@echo off
REM Inicia todos os serviços do GenieACS no Windows

start /B node bin\genieacs-cwmp
start /B node bin\genieacs-fs
start /B node bin\genieacs-nbi
start /B node bin\genieacs-ui

echo GenieACS iniciado com sucesso!
pause

