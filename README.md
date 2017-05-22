# TS-Setup
## Elastic Search
1. docker-compose -f elasticsearch.yml up -d
2. install https://chrome.google.com/webstore/detail/cors-toggle/omcncfnpmcabckcddookmnajignpffnh?hl=en to enalbe CORS in chrome, without this plugin, elasticsearch head won't be able to connect to elastic search cluster.
3. open http://localhost:9100 with CORS enabled
