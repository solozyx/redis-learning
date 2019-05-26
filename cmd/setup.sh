#!/usr/bin/env bash

# 单机版Redis安装
mkdir -p /opt/soft
wget http://download.redis.io/releases/redis-3.0.7.tar.gz
tar -zxf redis-3.0.7.tar.gz
# 创建软连接
ln -s redis-3.0.7 redis
cd redis
make
make install

# 启动Redis
cd redis
ls src/ | grep redis-
redis-server
redis-cli -h 127.0.0.1 -p 6379

redis-server --port 6380

ps -ef | grep redis-server
ps -ef | grep redis-server | grep -v "grep"

mkdir config
cp redis.conf config/
cat redis.conf | grep -v "#" | grep -v "^$" > redis-6382.conf


