# how to run


```
docker run \
-d \
--net=host \
--privileged=true \
-v local_pub_key:/key \
-v /data/glusterfs:/data/glusterfs \
liubin/glusterfs
...

```


# probe node and probed node


Start the first node without any parameters, get the ip ( `ip1` ):

`docker run ... liubin/glusterfs`

Start the second node with any parameters, get the ip ( `ip2` ):

`docker run ... liubin/glusterfs`

...
...

Start the last node with the `ip1`, `ip2`:

`docker run ... liubin/glusterfs ip1,ip2`

And see the last container's log to verify all nodes has join the cluster.

