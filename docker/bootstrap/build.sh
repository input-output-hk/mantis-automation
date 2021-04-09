#!/bin/bash
cd "$(dirname "$0")"

for ((i=1;i<=5;i++)); 
do 
  echo "Processing bootstrap-${i}"
  echo "Copying node.key"
  cp ../../nomad/persistance/bootstrap-${i}/dot.mantis/pottery/node.key .

  echo "Building docker image"
  sudo docker build -t bootstrap-${i}:local .

  echo "Removing node.key"
  rm node.key
done
