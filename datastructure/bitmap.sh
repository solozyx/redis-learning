#!/usr/bin/env bash

# 字符串 big 在内存中是 32bit
set hello big
getbit hello 0
getbit hello 1
setbit hello 7 1
get hello

setbit unique:users:2016-04-05 0 1
    getbit unique:users:2016-04-05 0
setbit unique:users:2016-04-05 5 1
setbit unique:users:2016-04-05 11 1
setbit unique:users:2016-04-05 15 1
setbit unique:users:2016-04-05 19 1
    get unique:users:2016-04-05

bitcount unique:users:2016-04-05
bitcount unique:users:2016-04-05 1 3
