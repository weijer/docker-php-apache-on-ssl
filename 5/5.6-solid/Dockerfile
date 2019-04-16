FROM php:5.6-apache

ADD ./ssl.conf /etc/apache2/sites-available/ssl.conf
ADD ./000-default.conf /etc/apache2/sites-available/000-default.conf
ADD ./entrypoint.sh /opt/entrypoint.sh

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
