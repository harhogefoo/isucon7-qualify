#!bin/sh
sh deploy.sh  2>&1 | ../../go/bin/notify_slack

