#!/bin/bash
if [ ! -d hive ]; then
git clone https://github.com/ethereum/hive.git
fi

rm -rf hive/clients/mantis
cp -r client hive/clients/mantis

rm -rf hive/simulatos/obft-simualtor
cp -r obft-simulator hive/simulators/

cd hive
sed -i "s/8545/9076/g" internal/libdocker/container.go
if [ ! -f hive ]; then
go build
fi

./hive --sim devp2p/eth --client mantis
