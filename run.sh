#!/bin/bash

RUNARG="$1"
if [ "$ZK_ID" == "" ];then
    echo "ZK_ID not set, defaulting to 1"
    ZK_ID=1
fi
echo -n "$ZK_ID" | grep '^[0-9]*$' >/dev/null;
if [ "$?" != "0" ]; then
    echo "ZK_ID: $ZK_ID is not an integer"
    exit 1
fi
mkdir /tmp/zookeeper
echo -n $ZK_ID > /tmp/zookeeper/myid
SERVERS="$(env | grep ZK_HOST | sed -e's/ZK_HOST_/server./')"
echo -e "Servers:\n$SERVERS"
echo "$SERVERS" >> /opt/zookeeper-3.4.6/bin/../conf/zoo.cfg

if ["$RUNARG" == ""];then
    exec /opt/zookeeper-3.4.6/bin/zkServer.sh start-foreground
fi
exec /bin/bash

