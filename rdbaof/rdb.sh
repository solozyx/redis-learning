#!/usr/bin/env bash

vim /opt/soft/redis_config/redis-6379.conf
----------------------------------------------
daemonize yes
pidfile /var/run/redis_6379.pid
port 6379
logfile "/opt/soft/redis_log/redis-6379.log"
# save 900 1
# save 300 10
# save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
dbfilename dump-6379.rdb
dir /opt/soft/redis_data
----------------------------------------------

ps -ef | grep redis- | grep -v "redis-cli" | grep -v "grep"
save
bgsave
tail -30f /opt/soft/redis_log/redis-6379.log
