#!/bin/bash



. /glusterfs/funcs.sh

# set -e

echo "Start sshd..."

mkdir -p /root/.ssh
chmod 700 /root/.ssh
cp /key /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
/usr/sbin/sshd


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
