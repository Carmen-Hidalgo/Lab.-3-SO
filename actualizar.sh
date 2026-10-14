#!/bin/bash
set -euo pipefail
cd /root/hello-express
git fetch origin main
LOCAL=$(git rev-parse HEAD)
REMOTO=$(git rev-parse origin/main)
if [ "LOCAL" = "REMOTO" ]; then
    echo "Sin cambios en main."
    exit 0
fi
echo "Se detectaron cambios en main."
git pull --ff-only origin main
/usr/bin/npm ci
echo "Código actualizado."
