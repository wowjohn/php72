FROM php:7.2-fpm

# 安装基本配置
RUN docker-php-source extract \
    &&apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        zlib1g-dev \
        zip unzip \
        libgmp-dev \
    && docker-php-ext-install -j$(nproc) iconv pdo pdo_mysql zip  gmp bcmath\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-source delete

# 安装redis 扩展
RUN pecl install redis \
    && docker-php-ext-enable redis

# 增加用户
RUN useradd webid -p 123456 \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#创建composer
RUN  curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com

# 创建代码目录 并指定用户
RUN mkdir -p /home/work/ \
    && chown webid:webid /home/work/

WORKDIR /home/work


