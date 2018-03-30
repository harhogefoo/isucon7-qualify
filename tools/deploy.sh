#!/bin/bash
set -ex
USERNAME=$USER
BRANCH=$1

FROM_MYSQL_CNF=/home/isucon/isubata/files/db/mysql/mysql.conf.d/mysqld.cnf
FROM_NGINX_CNF=/home/isucon/isubata/files/app/nginx.conf
TO_MYSQL_CNF=/etc/mysql/mysql.conf.d/mysqld.cnf
TO_NGINX_CNF=/etc/nginx/nginx.conf

cd /home/isucon/isubata \
&& echo "$USERNAME deploying..." \
&& echo 'git' \
&& git pull origin $BRANCH \
&& echo 'push mysql config file' \
&& sudo cp $FROM_MYSQL_CNF $TO_MYSQL_CNF \
&& echo 'push nginx config file' \
&& sudo cp $FROM_NGINX_CNF $TO_NGINX_CNF \
&& echo 'restart mysql' \
&& sudo service mysql restart \
&& echo 'restart redis' \
&& sudo service redis-server restart \
&& redis-cli KEYS "*" | xargs redis-cli DEL \
&& echo 'restart service' \
&& sudo systemctl restart isubata.nodejs.service \
# && sudo rm /var/log/nginx/access.log \ 
&& sudo service nginx restart \
&& echo "$USERNAME deploy done" \
