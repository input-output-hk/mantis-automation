#!/bin/bash
echo "Creating provisioning mount directory"
ls provisioning || mkdir provisioning

echo "Binding provisioning directory"
mount | grep passive/provisioning || sudo mount --bind ../../nomad/provisioning provisioning

echo "Building docker image"
sudo docker build -t passive:local .

echo "Unbinding provisioning directory"
sudo umount provisioning

echo "Removing provisioning mount directory"
rmdir provisioning
