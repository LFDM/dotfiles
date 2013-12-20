#!/bin/sh
total=$(($(egrep 'MemTotal' /proc/meminfo | cut -d " " -f 9) / 1024))
free=$(($(egrep 'MemFree' /proc/meminfo | cut -d " " -f 10) / 1024))
used=$((total - free))

echo "$((used/ (total / 100)))% of ${total}mb"
