#!/bin/bash
cd "$(dirname "$0")"

echo "Copying kevm-vm"
cp ../../nomad/provisioning/kevm/kevm-vm .

echo "Copying dag"
cd ../../nomad/persistance/dag
cat dag.tar.gz.* | tar xzvf -
ls -alsh
mv full-R23-0000000000000000 ../../../docker/passive-kevm/

cd ../../../docker/passive-kevm

echo "Building docker image"
sudo docker build -t passive-kevm:local .

echo "Removing kevm-vm"
rm kevm-vm

echo "Removing dag"
rm full-R23-0000000000000000

