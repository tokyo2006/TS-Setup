# TS-Setup
## Setup with docker-compose
1. make some directories, just type, no talk
```
mkdir -p $HOME/DockerData/Tradeshift/riak  
mkdir -p $HOME/DockerData/Tradeshift/postgres  
mkdir -p $HOME/DockerData/Tradeshift/es1  
mkdir -p $HOME/DockerData/Tradeshift/es2
```
  
2. docker-compose -f global_servers.yml up -d
3. postgres, riak, hornetq, elasticsearch, mailcatcher are in place, even with elasticsearch head(http://localhost:9100)
4. postgres is preloaded with some database and superuser porta/porta, you can alter the preloaded stuff and postgres config by changing init_db.sql and postgresql.conf


First line.  
Second line.