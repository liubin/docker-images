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


