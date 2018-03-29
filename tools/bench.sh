cd ../bench
./bin/bench -remotes=172.28.128.3 -output result.json
jq . < result.json | head
