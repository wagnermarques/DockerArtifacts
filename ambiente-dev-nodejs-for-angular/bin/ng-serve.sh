#!/bin/bash

# ===================================================================================
# Script para Iniciar o Servidor de Desenvolvimento Angular para um Projeto Específico
# ===================================================================================

set -e

# --- Ponto de Configuração ---
# Pega o diretório absoluto onde o script está localizado
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Define o diretório raiz do projeto (um nível acima da pasta 'bin')
PROJECT_ROOT_DIR="$SCRIPT_DIR/.."

# caminho para o seu arquivo docker-compose.yml
# Verifique se este caminho está correto para a sua estrutura de pastas!
COMPOSE_FILE_PATH="$PROJECT_ROOT_DIR/build-containers/nodejs/docker-compose.yml" 
# Se o seu arquivo estiver em outro lugar, ajuste aqui. Exemplo:
# COMPOSE_FILE_PATH="$PROJECT_ROOT_DIR/build-containers/nodejs/docker-compose.yml"

# Verifica se o arquivo de compose realmente existe antes de continuar
if [ ! -f "$COMPOSE_FILE_PATH" ]; then
    echo "❌ Erro Crítico: O arquivo docker-compose.yml não foi encontrado em: $COMPOSE_FILE_PATH"
    echo "   Por favor, edite a variável 'COMPOSE_FILE_PATH' no topo do script 'ng-serve.sh' para apontar para o local correto."
    exit 1
fi

# --- 1. Seleção Inteligente do Projeto Angular ---
SRC_PROJECTS_DIR="$PROJECT_ROOT_DIR/src-projects"
echo "🔎 Procurando por projetos em: '$SRC_PROJECTS_DIR'..."

mapfile -t projects < <(find "$SRC_PROJECTS_DIR" -maxdepth 1 -mindepth 1 -type d -printf "%f\n")

if [ ${#projects[@]} -eq 0 ]; then
    echo "❌ Erro: Nenhum projeto encontrado em '$SRC_PROJECTS_DIR'."
    exit 1
elif [ ${#projects[@]} -eq 1 ]; then
    chosen_project=${projects[0]}
    echo "✅ Projeto único encontrado: '$chosen_project'"
else
    echo "✨ Múltiplos projetos encontrados:"
    PS3="Digite o número do projeto que deseja servir: "
    select project in "${projects[@]}"; do
        if [[ -n "$project" ]]; then
            chosen_project=$project
            echo "✅ Você selecionou o projeto: '$chosen_project'"
            break
        else
            echo "Opção inválida. Tente novamente."
        fi
    done
fi

# --- 2. Preparar o Ambiente ---

export PROJECT_TO_SERVE=${chosen_project}

cleanup() {
    echo -e "\n🛑 Finalizando o ambiente Docker..."
    unset PROJECT_TO_SERVE
    # Usa a flag -f para garantir que o arquivo correto seja encontrado
    docker compose -f "$COMPOSE_FILE_PATH" down
    echo "✅ Ambiente finalizado."
}

trap cleanup EXIT

# --- 3. Executar o Servidor ---
echo "🚀 Iniciando o servidor de desenvolvimento para o projeto '${PROJECT_TO_SERVE}'..."
echo "Usando o arquivo de configuração: $COMPOSE_FILE_PATH"
echo "Acesse http://localhost:4200 quando a compilação estiver concluída."
echo "Pressione [Ctrl+C] para parar o servidor e finalizar o ambiente."

# Usa a flag -f para apontar para o arquivo de compose correto
docker compose -f "$COMPOSE_FILE_PATH" up --build
