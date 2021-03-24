#!/bin/bash

set -x

cd "$(dirname "$0")"

sudo rm -rf ../persistance/bootstrap-1/dot.mantis/pottery/rocksdb/ 
sudo rm -rf ../persistance/bootstrap-2/dot.mantis/pottery/rocksdb/ 
sudo rm -rf ../persistance/bootstrap-3/dot.mantis/pottery/rocksdb/ 
sudo rm -rf ../persistance/bootstrap-4/dot.mantis/pottery/rocksdb/ 
sudo rm -rf ../persistance/bootstrap-5/dot.mantis/pottery/rocksdb/ 
sudo rm -rf ../persistance/bootstrap-1/dot.mantis/pottery/logs/* 
sudo rm -rf ../persistance/bootstrap-2/dot.mantis/pottery/logs/* 
sudo rm -rf ../persistance/bootstrap-3/dot.mantis/pottery/logs/* 
sudo rm -rf ../persistance/bootstrap-4/dot.mantis/pottery/logs/* 
sudo rm -rf ../persistance/bootstrap-5/dot.mantis/pottery/logs/* 
