#!/bin/bash

# 替换 nginx.conf 中的 ${PORT} 为实际的环境变量 PORT
sed -i "s/\${PORT}/${PORT}/g" /etc/nginx/sites-available/default

# 启动 PHP-FPM 和 Nginx
php-fpm &
nginx -g "daemon off;"
