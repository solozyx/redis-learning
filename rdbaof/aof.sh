#!/usr/bin/env bash

config get appendonly
config set appendonly yes
config rewrite

set hello world
set hello java
set hello redis

incr counter
incr counter

rpush list a
rpush list b
rpush list c

bgrewriteaof

