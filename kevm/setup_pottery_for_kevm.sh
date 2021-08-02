#!/bin/bash
#set -e

cd "$(dirname "$0")"

cd ../nomad

sed -i "s|/home/ubuntu/mantis-automation|${PWD%%nomad*}|g" nomad.conf
sudo nomad agent -dev -config=nomad.conf --config=extra/pottery-kevm.json | grep -i error &
sleep 15
export NOMAD_ADDR=http://127.0.0.1:4696
export NOMAD_PORT_http=4696
export NOMAD_PORT_rpc=4697
export NOMAD_PORT_serf=4698

cd ../kevm
nomad job run hcl/bootstrap-mining-kevm.hcl
nomad job run hcl/passive-kevm.hcl

until sudo docker ps | grep bootstrap-mining-kevm | head -n 1 | awk '{print $1}' | xargs sudo docker logs | grep -i "Loading DAG from file 99"; do echo LOADING DAG; sleep 30; done

