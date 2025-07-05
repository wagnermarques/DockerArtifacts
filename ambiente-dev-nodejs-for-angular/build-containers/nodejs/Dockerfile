FROM node:24-alpine as development

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

#COPY package*.json ./
RUN npm apk add git
RUN npm install -g @angular/cli

#COPY . .

#RUN npm install

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
