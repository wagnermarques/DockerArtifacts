#!/bin/bash

# ===================================================================================
# Script para Gerar Componentes Angular dentro de um Contêiner Docker
#
# Uso: ./bin/ng-generate.sh <nome-do-componente>
# Exemplo: ./bin/ng-generate.sh shared/header
# ===================================================================================

set -e
source ./.env

# --- 1. Validação de Entradas e Variáveis ---
if [ -z "$1" ]; then
  echo "❌ Erro: O nome do componente não foi fornecido."
  echo "   Uso: $0 <nome-do-componente>"
  echo "   Exemplo: $0 meu-componente  ou  $0 components/meu-componente"
  exit 1
fi

if [ -z "$DOCKER_CONTAINER_NAME" ] || [ -z "$DOCKER_IMG_NAME" ]; then
  echo "❌ Erro: Verifique se DOCKER_CONTAINER_NAME e DOCKER_IMG_NAME estão definidos no arquivo .env"
  exit 1
fi

component_path_and_name="$1"

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

echo -e "\nO componente será gerado dentro de 'src-projects/$chosen_project/src/app/'"
read -p "Digite o nome do subdiretório (ex: components/shared) ou pressione [Enter] para criar na raiz 'app': " target_dir

if [ -n "$target_dir" ]; then
    target_dir_clean=$(echo "$target_dir" | sed 's:/*$::' | sed 's:^/*::')
    full_component_path="${target_dir_clean}/${component_path_and_name}"
else
    full_component_path="${component_path_and_name}"
fi

echo "📦 Gerando o componente em: 'src/app/${full_component_path}'..."

# Comando do Angular CLI. A flag --project não é mais necessária, pois o workdir já estará correto.
NG_GENERATE_COMMAND="ng generate component ${full_component_path}"

# O diretório de trabalho dentro do contêiner agora é dinâmico
CONTAINER_WORKDIR="/app/${chosen_project}"

function roda_ng_generate_with_docker_exec(){
  echo "🐳 Contêiner encontrado em execução. Usando 'docker exec'..."
  docker exec -it -w "/app" "$RUNNING_CONTAINER_ID" /bin/sh -c "$NG_GENERATE_COMMAND"
}


function roda_ng_generate_with_docker_run(){
  echo "🐳 Contêiner não está em execução. Usando 'docker run' em modo temporário..."
  # Define o workdir para o projeto específico
  docker run --rm -it \
    -v "./src-projects:/app" \
    -w "$CONTAINER_WORKDIR" \
    "$DOCKER_IMG_NAME" /bin/sh -c "$NG_GENERATE_COMMAND"
}

RUNNING_CONTAINER_ID=$(docker ps -q -f "name=^${DOCKER_CONTAINER_NAME}$")

if [ -n "$RUNNING_CONTAINER_ID" ]; then
  roda_ng_generate_with_docker_exec
else
  roda_ng_generate_with_docker_run
fi

# --- 4. Pós-execução: Corrigir Permissões ---
echo "🔧 Corrigindo permissões dos arquivos gerados..."
component_final_dir="src-projects/${chosen_project}/src/app/${full_component_path}"

if [ -d "$component_final_dir" ]; then
    sudo chown -R $USER:$USER "$component_final_dir"
    echo "✅ Permissões corrigidas para '$component_final_dir'."
else
    echo "⚠️ Aviso: O diretório do componente '$component_final_dir' não foi encontrado. A correção de permissões foi ignorada."
fi

echo "🎉 Processo concluído!"
