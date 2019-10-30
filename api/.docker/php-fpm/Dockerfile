ARG VERSION=7.1
FROM php:${VERSION}-fpm-alpine
MAINTAINER Robert Neal <rmn316@gmail.com>

RUN apk --no-cache update \
    docker-php-ext-install apcu \
    docker-php-ext-install curl \
    docker-php-ext-install dev \
    docker-php-ext-install gd \
    docker-php-ext-install mcrypt \
    docker-php-ext-install xsl \
    docker-php-ext-install yaml

#####################################
# MySQL:
#####################################
ARG INSTALL_MYSQL=false
RUN if [ ${INSTALL_MYSQL} = true ]; then \
#   Install the mysql extension
    docker-php-ext-install mysqli pdo_mysql \
;fi

#####################################
# Postgresql:
#####################################
ARG INSTALL_POSTGRESQL=false
RUN if [ ${INSTALL_POSTGRESQL} = true ]; then \
#   Install the pgsql extension
    apk --update --no-cache add postgresql-dev \
    && docker-php-ext-install pdo_pgsql pgsql \
;fi

#####################################
# Mongo:
#####################################
ARG INSTALL_MONGO=false
RUN if [ ${INSTALL_MONGO} = true ]; then \
    # Install the mongodb extension
    apk --update --no-cache add autoconf g++ make openssl-dev \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
    && apk del --purge autoconf g++ make \
;fi

#####################################
# MEMCACHED:
#####################################
ARG INSTALL_MEMCACHED=false
RUN if [ ${INSTALL_MEMCACHED} = true ]; then \
    # Install the php memcached extension
    apk --update --no-cache add autoconf g++ libmemcached-dev make zlib-dev && \
    curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
    && mkdir -p memcached \
    && tar -C memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && ( \
        cd memcached \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r memcached \
    && rm /tmp/memcached.tar.gz \
    && docker-php-ext-enable memcached \
    && apk del --purge autoconf g++ make zlib-dev \
;fi

#####################################
# Opcache:
#####################################
ARG INSTALL_OPCACHE=false
RUN if [ ${INSTALL_OPCACHE} = true ]; then \
    docker-php-ext-install opcache \
;fi

# Copy opcache configration
COPY ./conf/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

#####################################
# REDIS:
#####################################
ARG INSTALL_REDIS=false
RUN if [ ${INSTALL_REDIS} = true ]; then \
    # Install Php Redis Extension
    apk add --update --no-cache autoconf g++ make \
    && printf "\n" | pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    && apk del --purge autoconf g++ make \
;fi

#####################################
# bcmath:
#####################################
ARG INSTALL_BCMATH=false
RUN if [ ${INSTALL_BCMATH} = true ]; then \
    # Install the bcmath extension
    docker-php-ext-install bcmath \
;fi

#####################################
# Tokenizer Modifications:
#####################################
ARG INSTALL_TOKENIZER=false
RUN if [ ${INSTALL_TOKENIZER} = true ]; then \
    docker-php-ext-install tokenizer \
;fi

#####################################
# INTL : Human Language and Character Encoding Support:
#####################################
ARG INSTALL_INTL=false
RUN if [ ${INSTALL_INTL} = true ]; then \
    # Install intl and requirements
    apk --update --no-cache add zlib-dev icu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apk del --purge zlib-dev g++ \
;fi

#####################################
# LDAP:
#####################################
# currently broken.
ARG INSTALL_LDAP=false
RUN if [ ${INSTALL_LDAP} = true ]; then \
    apk add --update --no-cache libldap \
    && docker-php-ext-configure ldap --with-libdir= lib/ \
    && docker-php-ext-install ldap \
;fi

#####################################
# SOAP:
#####################################
ARG INSTALL_SOAP=false
RUN if [ ${INSTALL_SOAP} = true ]; then \
    # Install the soap extension
    apk --update --no-cache add libxml2-dev \
    && docker-php-ext-install soap \
    && apk del --purge libxml2-dev \
;fi

#####################################
# X-Debug:
#####################################
ARG INSTALL_XDEBUG=false
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    apk --update --no-cache add autoconf g++ make\
    && pecl install -f xdebug \
    && docker-php-ext-enable xdebug \
    && apk del --purge autoconf g++ make \
;fi
# Copy xdebug configration for remote debugging
COPY ./conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

#####################################
# ZipArchive:
#####################################
ARG INSTALL_ZIP_ARCHIVE=false
RUN if [ ${INSTALL_ZIP_ARCHIVE} = true ]; then \
    # Install the zip extension
    apk --update --no-cache add libzip-dev \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip \
;fi

#####################################
# Exif:
#####################################
ARG INSTALL_EXIF=false
RUN if [ ${INSTALL_EXIF} = true ]; then \
    # Enable Exif PHP extentions requirements
    docker-php-ext-install exif \
;fi

#####################################
# GD:
#####################################
USER root
ARG INSTALL_GD=false
RUN if [ ${INSTALL_GD} = true ]; then \
    apk --update --no-cache add libpng libpng-dev \
    && docker-php-ext-install gd \
    && apk del --purge libpng-dev \
;fi

#####################################
# ImageMagick:
#####################################
USER root
ARG INSTALL_IMAGEMAGICK=false
ENV INSTALL_IMAGEMAGICK ${INSTALL_IMAGEMAGICK}
RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
    apk --update --no-cache add autoconf g++ imagemagick-dev make \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del --purge autoconf g++ make \
;fi

COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN apk add --update bash \
    && rm -rf /var/cache/apk/*

###########################################################################
# Composer:
###########################################################################
USER root
# Add the composer.json
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

USER ${USER}

EXPOSE 9000