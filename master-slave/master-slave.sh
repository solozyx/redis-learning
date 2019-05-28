#!/usr/bin/env bash


vim /opt/soft/redis_config/master-slave/redis-6379.conf
---------------------------------------------------------
daemonize yes
port 6379
pidfile /var/run/redis_6379.pid
logfile "/opt/soft/redis_log/master-slave/redis-6379.log"
# save 900 1
# save 300 10
# save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
rdbchecksum yes
dbfilename dump-6379.rdb
dir /opt/soft/redis_data/master-slave
replica-read-only yes
---------------------------------------------------------

vim /opt/soft/redis_config/master-slave/redis-6380.conf
---------------------------------------------------------
port 6380
logfile "/opt/soft/redis_log/master-slave/redis-6380.log"
dbfilename dump-6380.rdb
# replicaof <masterip> <masterport>
replicaof 127.0.0.1 6379
---------------------------------------------------------

redis-server redis-6379.conf
redis-cli -p 6379 info replication

redis-server redis-6380.conf
redis-cli -p 6380 info replication

cat /opt/soft/redis_log/master-slave/redis-6379.log
cat /opt/soft/redis_log/master-slave/redis-6380.log

slaveof no one
info replication

slaveof 127.0.0.1 6379
info replication

redis-cli -p 6379 info server | grep run_id
redis-cli -p 6380 info server | grep run_id

redis-cli -p 6379 info replication
redis-cli -p 6379 set key1 val1
