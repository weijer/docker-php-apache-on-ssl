FROM php:5.6-apache

ADD ./ssl.conf /etc/apache2/sites-available/ssl.conf
ADD ./000-default.conf /etc/apache2/sites-available/000-default.conf
ADD ./entrypoint.sh /opt/entrypoint.sh

RUN chmod a+x /opt/entrypoint.sh
RUN /bin/bash -c "source /opt/entrypoint.sh /etc/apache2/ssl_keys localhost"

RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2ensite ssl

RUN echo 'error_reporting = E_ALL' >> /usr/local/etc/php/conf.d/99_myconf.ini
RUN echo 'date.timezone = Asia/Tokyo' >> /usr/local/etc/php/conf.d/99_myconf.ini
