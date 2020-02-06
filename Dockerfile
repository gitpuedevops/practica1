FROM debian:10

ENV DEBIAN_FRONTEND noninteractive

RUN set -uex ; \
    apt update;\
    apt -y install curl libapache2-mod-php php-xml php-gd php-mysql php-redis ; \
    a2enmod rewrite ; \
    a2dismod status

RUN   rm -f /var/www/html/*
COPY  index.php /var/www/html
#RUN set -eux ; \
#    curl -s https://download.dokuwiki.org/src/dokwiki/dokuwiki-stable.tgz | tar -zc -C /var/www ; \
#    rm -rf /var/www/html ; \
#    mv /var/www/dokuwiki* /var/www/html ; \
#    chown -R www-data: /var/www/html/data ; \
#    chown -R www-data: /var/www/html/conf ; \


EXPOSE 80

CMD [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
