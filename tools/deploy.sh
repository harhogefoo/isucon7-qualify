#!/bin/bash
set -ex
USERNAME=$USER
BRANCH=$1

FROM_MYSQL_CNF=/home/isucon/isubata/files/db/mysql/mysqld.cnf
FROM_NGINX_CNF=/home/isucon/isubata/files/app/nginx.conf
TO_MYSQL_CNF=/etc/mysql/mysql.conf.d/mysqld.cnf
TO_NGNX_CNF=/etc/nginx/nginx.conf
cd /home/isucon/isubata \
&& echo "$USERNAME deploying..." \
&& echo 'git' \
&& git pull origin $BRANCH \
cp 
&& echo 'push config files' \
&& sudo service mysql restart \
&& echo 'redis' \
&& sudo service redis-server restart \
&& redis-cli KEYS "*" | xargs redis-cli DEL \
&& echo 'restart service' \
&& sudo systemctl restart isubata.nodejs.service \
# && sudo rm /var/log/nginx/access.log \ 
&& sudo service nginx restart \
&& echo "$USERNAME deploy done" \
