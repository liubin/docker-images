#!/bin/bash



. /glusterfs/funcs.sh

# set -e

echo "Start glusterd..."

glusterd -p /var/run/gluster.pid --log-file=/var/log/gfs.log

echo "Glusterd started..."

if [ -n "$1" ]; then
    peer_probe $1
    echo "All peers are ready..."
else
    echo "Salve started"
fi


tail -f /var/log/gfs.log
