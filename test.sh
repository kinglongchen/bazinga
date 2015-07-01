#!/bin/sh
input=1
echo 1|awk '/[^0-9]*/ {print $0}'
