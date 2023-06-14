#!/bin/bash

mkdir -p /tmp/openresty/nginx-client-body
mkdir -p /var/log/openresty

set -xe

luarocks install luasec
luarocks install moonpick
luarocks install http
luarocks install json-lua
luarocks install lpeg
luarocks install uuid