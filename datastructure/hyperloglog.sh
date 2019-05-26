#!/usr/bin/env bash

pfadd 2019_05_26:unique:ids "uuid-1" "uuid-2" "uuid-3" "uuid-4"
pfcount 2019_05_26:unique:ids
pfadd 2019_05_26:unique:ids "uuid-1" "uuid-2" "uuid-3" "uuid-90"
pfcount 2019_05_26:unique:ids

pfadd 2019_05_25:unique:ids "uuid-1" "uuid-2" "uuid-3" "uuid-5"
pfcount 2019_05_25:unique:ids

pfmerge 2019_05_25_and_26:ids 2019_25_26:unique:ids 2019_05_25:unique:ids
pfcount 2019_05_25_and_26:ids
