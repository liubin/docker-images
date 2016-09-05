TCP_TIMEOUT=1
DAEMON_PORT=24007


peer_wait_hosts()
{
    ready=false
    while [ "$ready" != true ]; do
        echo "waiting for the daemons: $1"
        sleep 5
        ready=true

        array=(${1//,/ })

        for i in "${!array[@]}"
        do
            IP=${array[i]}
            echo "Check connection to $IP"
            timeout $TCP_TIMEOUT bash -c ">/dev/tcp/$IP/$DAEMON_PORT"
            if [ "$?" -ne "0" ]; then
                echo "Peer $IP is not ready"
                ready=false
            fi
            echo "Connection to $IP is OK"
        done
    done
}

peer_probe_hosts()
{

    array=(${1//,/ })

    for i in "${!array[@]}"
    do
        IP=${array[i]}
        echo gluster peer probe ${IP}
        gluster peer probe ${IP}
        sleep 1
    done
}

peer_probe()
{
    array=(${1//,/ })
    node_size=`expr ${#array[@]} + 1`
    echo "peer size should be: $node_size"

    # peer_wait_hosts $1

    tries=1
    while true; do
        PEER_COUNT=$(gluster pool list|grep -v UUID|wc -l)
        if [ "${node_size}" -ne "${PEER_COUNT}" ]; then
            echo "Not all glusterfs nodes are ready, will try again."
            peer_probe_hosts $1
        else
            echo "All nodes are ready"
            break
        fi
        sleep 15
        ((tries++))
        if [ $tries -ge 50 ]; then
            echo "Fatal: Glusterfs cluster can't be probed"
            exit 1
        fi
    done
}

