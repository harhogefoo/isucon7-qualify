#!/bin/bash
set -ex
IPADDR=$1
USERNAME=$USER
cd /home/isucon/isubata \
&& echo 'deploy starting...' \
&& echo 'git' \
&& git pull origin master \
&& echo 'push config files' \
