#!/bin/bash
set -ex
IPADDR=$1
USERNAME=$USER
cd /home/isucon/isubata \
&& echo "$USERNAME deploying..." \
&& echo 'git' \
&& git pull origin master \
&& echo 'push config files' \
&& sudo service mysql restart \
&& echo 'restart service' \
&& sudo systemctl restart isubata.nodejs.service \
&& sudo service nginx restart \
&& echo "$USERNAME deploy done" \
