#!/bin/bash

# 替换 nginx.conf 中的 ${PORT} 为实际的环境变量 PORT
sed -i "s/\${PORT}/${PORT}/g" /etc/nginx/sites-available/default
sed -i "s/\${PHPPORT}/${PHPPORT}/g" /etc/nginx/sites-available/default
sed -i -E 's/(listen = 127.0.0.1:)[0-9]+/\1'"${PHPPORT}"'/' /usr/local/etc/php-fpm.d/www.conf
echo 'upload_max_filesize = 100M'>>/usr/local/etc/php/conf.d/docker-fpm.ini
echo 'post_max_size = 100M'>>/usr/local/etc/php/conf.d/docker-fpm.ini
chown -R www-data:www-data /data
# 启动 PHP-FPM 和 Nginx
php-fpm &
nginx -g "daemon off;"
