FROM php:7.2-apache

ADD ssl.conf /etc/apache2/sites-available/ssl.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD entrypoint.sh /opt/entrypoint.sh

RUN chmod a+x /opt/entrypoint.sh
RUN /bin/bash -c "source /opt/entrypoint.sh /etc/apache2/ssl_keys localhost"

# 安装php扩展
RUN apt-get update \
    && apt-get install -y php7.2-zip php7.2-intl php7.2-gd php7.2-pgsql php7.2-mysql php7.2-redis php7.2-bcmath php-pear

RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2ensite ssl

RUN echo 'error_reporting = E_ALL' >> /usr/local/etc/php/conf.d/99_myconf.ini
RUN echo 'date.timezone = Asia/Tokyo' >> /usr/local/etc/php/conf.d/99_myconf.ini
