FROM php:7.2-apache

# 安装php扩展
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN pecl install redis-4.0.1 \
    && docker-php-ext-enable redis

ADD ssl.conf /etc/apache2/sites-available/ssl.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD entrypoint.sh /opt/entrypoint.sh

RUN chmod a+x /opt/entrypoint.sh
RUN /bin/bash -c "source /opt/entrypoint.sh /etc/apache2/ssl_keys localhost"

RUN { \
    echo '';\
    echo '# add settings'; \
    echo 'TraceEnable off'; \
    echo 'Header append X-FRAME-OPTIONS "SAMEORIGIN"'; \
    echo 'Header set X-XSS-Protection "1; mode=block"'; \
    echo 'Header set X-Content-Type-Options nosniff'; \
    echo 'Header unset X-Powered-By'; \
    echo 'Header always set Strict-Transport-Security "max-age=63072000"'; \
    echo 'Header set Content-Security-Policy "default-src 'none';style-src 'self' 'unsafe-inline' fonts.googleapis.com; script-src 'self' 'unsafe-inline' 'unsafe-eval'; connect-src 'self'; media-src 'self';img-src 'self';font-src 'self' 'unsafe-inline' fonts.googleapis.com fonts.gstatic.com;"'; \
    echo 'Header set X-WebKit-CSP "default-src 'none';style-src 'self' 'unsafe-inline' fonts.googleapis.com; script-src 'self' 'unsafe-inline' 'unsafe-eval'; connect-src 'self'; media-src 'self';img-src 'self';font-src 'self' 'unsafe-inline' fonts.googleapis.com fonts.gstatic.com;"'; \
    echo 'RequestHeader unset Proxy'; \
    echo 'ServerTokens ProductOnly'; \
    echo 'ServerSignature off'; \
    echo 'FileETag None'; \
} >> /etc/apache2/apache2.conf

RUN a2enmod headers
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2ensite ssl

RUN echo 'error_reporting = E_ALL' >> /usr/local/etc/php/conf.d/99_myconf.ini
RUN echo 'date.timezone = Asia/Tokyo' >> /usr/local/etc/php/conf.d/99_myconf.ini
