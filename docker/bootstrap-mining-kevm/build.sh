#!/bin/bash
cd "$(dirname "$0")"

echo "Copying kevm-vm"
cp ../../nomad/provisioning/kevm/kevm-vm .

echo "Copuing dag"
cd ../../nomad/persistance/dag
cat dag.tar.gz.* | tar xzvf -
ls -alsh
mv full-R23-0000000000000000 ../../../docker/bootstrap-mining-kevm/ 

cd ../../../docker/bootstrap-mining-kevm

for ((i=1;i<=5;i++)); 
do 
  echo "Processing bootstrap-mining-kevm-${i}"
  echo "Copying node.key"
  cp ../../nomad/persistance/bootstrap-${i}/dot.mantis/pottery/node.key .

  echo "Building docker image"
  sudo docker build -t bootstrap-mining-kevm-${i}:local .

  echo "Removing node.key"
  rm node.key
done

echo "Removing kevm-vm"
rm kevm-vm

echo "Removing dag"
rm full-R23-0000000000000000
