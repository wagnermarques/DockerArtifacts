#!/bin/bash

# ===================================================================================
# Script para Adicionar Pacotes com 'ng add' dentro de um Contêiner Docker
#
# Uso: ./bin/ng-add.sh <nome-do-pacote>
# Exemplo: ./bin/ng-add.sh @angular/material
#
# Funcionalidades:
# - Detecta se o contêiner de desenvolvimento está rodando e usa 'docker exec'.
# - Se o contêiner não estiver rodando, usa 'docker run' em modo temporário.
# - Se houver múltiplos projetos, pede para o usuário escolher um.
# - Corrige as permissões de todo o projeto após a instalação do pacote.
# ===================================================================================

set -e
source ./.env

# --- 1. Validação de Entradas e Variáveis ---
if [ -z "$1" ]; then
  echo "❌ Erro: O nome do pacote não foi fornecido."
  echo "   Uso: $0 <nome-do-pacote>"
  echo "   Exemplo: $0 @angular/material"
  exit 1
fi

if [ -z "$DOCKER_CONTAINER_NAME" ] || [ -z "$DOCKER_IMG_NAME" ]; then
  echo "❌ Erro: Verifique se DOCKER_CONTAINER_NAME e DOCKER_IMG_NAME estão definidos no arquivo .env"
  exit 1
fi

# O nome do pacote a ser adicionado
package_to_add="$1"


# --- 2. Seleção Inteligente do Projeto Angular ---
echo "🔎 Procurando por projetos na pasta 'src-projects'..."
mapfile -t projects < <(find src-projects -maxdepth 1 -mindepth 1 -type d -printf "%f\n")

if [ ${#projects[@]} -eq 0 ]; then
    echo "❌ Erro: Nenhum projeto encontrado em 'src-projects'."
    exit 1
elif [ ${#projects[@]} -eq 1 ]; then
    chosen_project=${projects[0]}
    echo "✅ Projeto único encontrado: '$chosen_project'"
else
    echo "✨ Múltiplos projetos encontrados:"
    PS3="Digite o número do projeto desejado: "
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


# --- 3. Lógica Principal: Montar Comando e Executar ---

echo "📦 Adicionando o pacote '${package_to_add}' ao projeto '${chosen_project}'..."

# Comando do Angular CLI para adicionar o pacote
NG_ADD_COMMAND="ng add ${package_to_add}"

# O diretório de trabalho para o caso de 'docker run'
CONTAINER_WORKDIR_FOR_RUN="/app/${chosen_project}"


function roda_ng_add_with_docker_exec(){
  echo "🐳 Contêiner encontrado em execução. Usando 'docker exec'..."
  # O workdir é /app, pois o ng-serve já montou o projeto lá.
  docker exec -it -w "/app" "$RUNNING_CONTAINER_ID" /bin/sh -c "$NG_ADD_COMMAND"
}

function roda_ng_add_with_docker_run(){
  echo "🐳 Contêiner não está em execução. Usando 'docker run' em modo temporário..."
  # Aqui, usamos o workdir dinâmico, pois montamos toda a pasta 'src-projects'
  docker run --rm -it \
    -v "./src-projects:/app" \
    -w "$CONTAINER_WORKDIR_FOR_RUN" \
    "$DOCKER_IMG_NAME" /bin/sh -c "$NG_ADD_COMMAND"
}


# Procura por um contêiner em execução com o nome exato
RUNNING_CONTAINER_ID=$(docker ps -q -f "name=^${DOCKER_CONTAINER_NAME}$")

if [ -n "$RUNNING_CONTAINER_ID" ]; then
  roda_ng_add_with_docker_exec
else
  roda_ng_add_with_docker_run
fi


# --- 4. Pós-execução: Corrigir Permissões ---
echo "🔧 Corrigindo permissões do projeto..."
# Como 'ng add' pode modificar vários arquivos, corrigimos as permissões do projeto inteiro.
project_dir="src-projects/${chosen_project}"

if [ -d "$project_dir" ]; then
    sudo chown -R $USER:$USER "$project_dir"
    echo "✅ Permissões corrigidas para todo o projeto '$chosen_project'."
else
    echo "⚠️ Aviso: O diretório do projeto '$project_dir' não foi encontrado."
fi

echo "🎉 Processo concluído!"
