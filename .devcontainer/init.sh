#!/bin/bash

set -xe

luarocks install luasec
luarocks install moonpick
luarocks install http
luarocks install json-lua
luarocks install lpeg
luarocks install uuid