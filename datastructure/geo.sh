#!/usr/bin/env bash

geoadd cities:locations 116.28 39.55 beijing

geoadd cities:locations 116.28 39.55 beijing

geoadd cities:locations 117.12 39.08 tianjin 114.29 38.02 shijiazhuang
geoadd cities:locations 118.01 39.88 tangshan 115.29 38.51 baoding

geopos cities:locations beijing

geodist cities:locations beijing tianjin km

georadiusbymember cities:locations beijing 150km


