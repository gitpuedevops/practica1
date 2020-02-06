FROM debian:10

ENV DEBIAN_FRONTEND noninteractive

RUN set -uex ; \
    apt update ; \
    apt -y install curl libapache2-mod-php php-xml php-gd php-mysql php-redis wget ; \
    a2enmod rewrite ; \
    a2dismod status

RUN set -uex ; \
    wget -O- https://wordpress.org/latest.tar.gz | tar -zx -C /var/www/ ; \
    rm -rf /var/www/html ; \
    mv /var/www/wordpress /var/www/html ; \
    chown -R www-data. /var/www/html ; \
    ln -sf /dev/stdout /var/log/apache2/access.log 


EXPOSE 80

CMD [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
