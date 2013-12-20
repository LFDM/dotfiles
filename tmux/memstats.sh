#!/bin/sh
total=$(($(egrep 'MemTotal' /proc/meminfo | cut -d " " -f 9) / 1024))
used=$(($(egrep 'Active:' /proc/meminfo | cut -d " " -f 11) / 1024))

echo "$((used/ (total / 100)))% of ${total}mb"
