# docker-php
一个可以直接用的php-fpm

```
docker run -d --name=mysql --restart=always \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=mypassword \
    -e MYSQL_LOG_CONSOLE=true \
    -v /data/my.cnf:/etc/mysql/conf.d/my.cnf \
    -v /data/mysql:/var/lib/mysql \
    mariadb:10
docker run -d --name=php7fpm --restart=always \
    -p 9000:9000 \
    -v /data/php/fpm7.3.conf:/usr/local/etc/php-fpm.conf \
    -v /data/www:/var/www/html \
    ghostry/php:7.3-fpm-alpine
docker run -d --name=apache --restart=always \
    -p 80:80 \
    -p 443:443 \
    -v /data/apache2/httpd.conf:/usr/local/apache2/conf/httpd.conf \
    -v /data/apache2/vhosts:/usr/local/apache2/vhosts \
    -v /data/apache2/ssl:/usr/local/apache2/ssl \
    -v /data/www:/var/www/html \
    httpd:alpine
```
