FROM php:7.4-fpm 
 
# Preparação do Timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Preparação dos Repositorios
RUN apt -y update
RUN apt -y upgrade

# Instalacao dos pacotes basicos
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

RUN apt-get update -y && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6-dev

RUN apt -y install ntpdate locales wget apt-transport-https lsb-release ca-certificates curl

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-webp --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install zip

RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev

RUN docker-php-ext-install exif

# Instalacao dos pacotes necessários
RUN apt -y install 

# Ajuste dos Locales
RUN rm /etc/locale.gen
COPY ./docker/system/locale.gen /etc/.
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

RUN locale-gen pt_BR.utf8

ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV TZ America/Sao_Paulo

# Preparacao do Ambiente
RUN mkdir -p /var/www/app
WORKDIR /var/www/app

# Instancao da Aplicação
COPY ./arquivos-teste/. /var/www/app/.

VOLUME ["/var/www/app"]

