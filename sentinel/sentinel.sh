#!/usr/bin/env bash

vim /opt/soft/redis_config/sentinel/redis-7000.conf
--------------------------------------------------------
port 7000
daemonize yes
pidfile /var/run/redis_7000.pid
logfile "/opt/soft/redis_log/sentinel/redis-7000.log"
rdbchecksum yes
dbfilename dump-7000.rdb
dir /opt/soft/redis_data/sentinel
--------------------------------------------------------


vim /opt/soft/redis_config/sentinel/redis-7001.conf
--------------------------------------------------------
port 7001
daemonize yes
pidfile /var/run/redis_7001.pid
logfile "/opt/soft/redis_log/sentinel/redis-7001.log"
rdbchecksum yes
dbfilename dump-7001.rdb
dir /opt/soft/redis_data/sentinel
replicaof 127.0.0.1 7000
--------------------------------------------------------


vim /opt/soft/redis_config/sentinel/redis-7002.conf
--------------------------------------------------------
port 7002
daemonize yes
pidfile /var/run/redis_7002.pid
logfile "/opt/soft/redis_log/sentinel/redis-7002.log"
rdbchecksum yes
dbfilename dump-7002.rdb
dir /opt/soft/redis_data/sentinel
replicaof 127.0.0.1 7000
--------------------------------------------------------

redis-server /opt/soft/redis_config/sentinel/redis-7000.conf
redis-server /opt/soft/redis_config/sentinel/redis-7001.conf
redis-server /opt/soft/redis_config/sentinel/redis-7002.conf

redis-cli -p 7000 info replication

cp redis-5.0.5/sentinel.conf ./redis_config/sentinel/

cd ./redis_config/sentinel/

cat sentinel.conf | grep -v "#" | grep -v "^$"

cat sentinel.conf | grep -v "#" | grep -v "^$" > redis-sentinel-26379.conf

vim /opt/soft/redis_config/sentinel/redis-sentinel-26379.conf
--------------------------------------------------------------
port 26379
daemonize yes
pidfile /var/run/redis-sentinel-26379.pid
logfile "/opt/soft/redis_log/redis-sentinel-26379.log"
dir /opt/soft/redis_data/sentinel
sentinel monitor mymaster 127.0.0.1 7000 2
sentinel down-after-milliseconds mymaster 30000
sentinel parallel-syncs mymaster 1
sentinel failover-timeout mymaster 180000
sentinel deny-scripts-reconfig yes
--------------------------------------------------------------

redis-sentinel  /opt/soft/redis_config/sentinel/redis-sentinel-26379.conf
ps -e | grep redis-sentinel

redis-cli -p 26379
info

cat /opt/soft/redis_config/sentinel/redis-sentinel-26379.conf

cd /opt/soft/redis_config/sentinel
sed "s/26379/26380/g" redis-sentinel-26379.conf > redis-sentinel-26380.conf
sed "s/26379/26381/g" redis-sentinel-26379.conf > redis-sentinel-26381.conf

cat redis-sentinel-26380.conf
cat redis-sentinel-26381.conf

redis-sentinel  /opt/soft/redis_config/sentinel/redis-sentinel-26380.conf
redis-sentinel  /opt/soft/redis_config/sentinel/redis-sentinel-26381.conf
ps -e | grep redis-sentinel

redis-cli -p 26379 info sentinel
redis-cli -p 26380 info sentinel
redis-cli -p 26381 info sentinel

