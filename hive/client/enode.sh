#!/bin/bash
IP=$(ifconfig | grep eth0 -A 1 | grep inet | awk '{print $2}')
while  [ -z "$ENODE" ]
do
        ENODE=$(cat /root/.mantis/pottery/logs/mantis.log | grep -o "Node address: .*" | grep -o "enode.*")
done
echo ${ENODE/0.0.0.0/$IP}?discport=30303

