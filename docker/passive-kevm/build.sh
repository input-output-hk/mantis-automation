#!/bin/bash
cd "$(dirname "$0")"

echo "Copying kevm-vm"
cp ../../nomad/provisioning/kevm/kevm-vm .

echo "Building docker image"
sudo docker build -t passive-kevm:local .

echo "Removing kevm-vm"
rm kevm-vm
