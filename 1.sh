#!/bin/bash

# URL del repositorio de GitHub
REPO_URL="https://github.com/Juanprograming-cyber/PastelFrut.git"
RAMA="main"

# Mensaje del commit (si no se pasa argumento, usa uno por defecto)
COMMIT_MSG=${1:-"Actualización automática del proyecto"}

echo "📁 Navegando al directorio del script..."
cd "$(dirname "$0")" || exit

# Inicializa Git si no está inicializado
if [ ! -d .git ]; then
    echo "🔧 Inicializando repositorio Git..."
    git init
    git remote add origin $REPO_URL
fi

# Asegurar que la rama main existe
git branch -M $RAMA

echo "➕ Agregando archivos..."
git add .

# Verificar si hay commits previos
if git rev-parse --verify HEAD >/dev/null 2>&1; then
    echo "💬 Haciendo commit..."
    git commit -m "$COMMIT_MSG"
else
    echo "💬 Haciendo primer commit..."
    git commit -m "$COMMIT_MSG"
fi

echo "🚀 Subiendo cambios a GitHub..."
git push -u origin $RAMA

echo "✅ ¡Subida completada con éxito!"
