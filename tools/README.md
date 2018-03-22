# notify_slack
## setup
```
cd ~/etc/notify_slack.toml
```
``` notify_slack.toml
[slack]
url = "https://hooks.slack.com/services/XXXX"
channel = "#times_harhogefoo"
username = "notify"
icon_emoji = ":rocket:"
```
## 全ての出力をslackに通知する
```bash
sh deploy.sh  2>&1 | ../../go/bin/notify_slack
```

