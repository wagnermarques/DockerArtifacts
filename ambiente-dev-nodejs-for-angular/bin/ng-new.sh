#!/bin/bash

#PARA OS PATHS DESTE SCRIPT FUNCIONARREM
#RODA-LOS COM O COMANDO: ./bin/ng.sh <nome-do-projeto>

# Encerra o script imediatamente se um comando falhar
set -e
source ./.env


# --- 1. Validação do Input ---
if [ -z "$1" ]; then
  echo "Erro: O nome do projeto não foi fornecido."
  echo "Uso: $0 <nome-do-projeto>"
  exit 1
fi


# Valida se as variáveis necessárias do .env foram carregadas
if [ -z "$DOCKER_CONTAINER_NAME" ] || [ -z "$DOCKER_IMG_NAME" ]; then
  echo "Erro: Verifique se DOCKER_CONTAINER_NAME e DOCKER_IMAGE_NAME estão definidos no arquivo .env"
  exit 1
fi


# --- 3. Lógica Principal: Verificar Contêiner e Executar ---
echo "Verificando o status do contêiner: $DOCKER_CONTAINER_NAME..."

declare project_name=$1

# O diretório onde o projeto será criado, relativo ao workdir do container (/apps)
TARGET_DIRECTORY="apps" #na verdade o src-projects ta montado no /apps (dentro do container é apps e fora é src-projects)

# Isso passa o nome e o diretório de forma separada e correta para o Angular CLI
NG_NEW_COMMAND="ng new ${project_name} --directory ${project_name} --routing=true --style=css --ssr=false"


function roda_ng_new_with_docker_exec(){
      echo "Contêiner encontrado em execução (ID: $RUNNING_CONTAINER_ID). Usando 'docker exec'..."
      docker exec -it "$RUNNING_CONTAINER_ID" /bin/sh -c "$NG_NEW_COMMAND"
}

function roda_ng_new_with_docker_run(){
    echo "Contêiner não está em execução. Usando 'docker run' com um contêiner temporário..."
    docker run --rm -it -v "$(pwd)/src-projects":/apps -w /apps "$DOCKER_IMG_NAME" /bin/sh -c "$NG_NEW_COMMAND"
}


# Procura por um contêiner em execução com o nome exato (^...$)
RUNNING_CONTAINER_ID=$(docker ps -q -f "name=^${DOCKER_CONTAINER_NAME}$")

if [ -n "$RUNNING_CONTAINER_ID" ]; then
    # Se a variável RUNNING_CONTAINER_ID não for nula, o contêiner está rodando
    roda_ng_new_with_docker_exec
else
    # Se a variável for nula, o contêiner não está rodando
    roda_ng_new_with_docker_run
fi

# --- 4. Pós-execução: Corrigir Permissões ---
echo ""
echo "Projeto '$project_name' criado com sucesso em ../src-projects/"
echo "Corrigindo permissões de arquivo..."

# Usa sudo para garantir que a posse dos arquivos criados pelo contêiner seja do usuário atual
sudo chown -R $USER:$USER $(pwd)/src-projects/$project_name

echo "Permissões corrigidas. Processo concluído!"

