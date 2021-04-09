#!/bin/bash
cd base
echo "Creating provisioning mount directory"
ls provisioning || mkdir provisioning

echo "Binding provisioning directory"
mount | grep morpho/provisioning || sudo mount --bind ../../../nomad/provisioning provisioning

echo "Building docker image"
sudo docker build -t morpho-base:local .

echo "Unbinding provisioning directory"
sudo umount provisioning

echo "Removing provisioning mount directory"
rmdir provisioning

cd ..
for ((i=1;i<=5;i++));
do
  echo "Processing morpho-${i}"
  echo "Copying files"
  cp ../../nomad/persistance/morpho-${i}/dot.morpho/morpho-configuration.yaml .
  cp ../../nomad/persistance/morpho-${i}/dot.morpho/private.key .
  cp ../../nomad/persistance/morpho-${i}/dot.morpho/public.key .

  echo "Building docker image"
  sudo docker build -t morpho-${i}:local .

  echo "Removing files"
  rm morpho-configuration.yaml
	rm private.key
	rm public.key
done

