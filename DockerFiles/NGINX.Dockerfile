# Instala a base do server NGINX
FROM nginx:latest

# Atualiza o Servidor
RUN apt -y update
RUN apt -y upgrade

# Instala o NGINX Full
RUN apt -y install nginx-full wget git

# Copia tudo o que é Necessario para o NGINX
RUN rm -Rf /etc/nginx/*
COPY ./docker/nginx/. /etc/nginx/.

# Criacao das pastas de trabalho para a Aplicacao
RUN mkdir -p /var/www/app

# Copiando a aplicação
COPY ./arquivos-teste/. /var/www/app/.

EXPOSE 80
EXPOSE 443

VOLUME ["/var/www/app"]
