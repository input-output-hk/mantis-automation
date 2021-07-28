#!/bin/bash

cd $(dirname $0)

if [[ -v TX_NUMBER ]]; then
	sed -i "s/txNumber.*/txNumber: $TX_NUMBER/g" ../../smartcontract/hello/config.yaml 
fi
if [[ -v TX_TPS ]]; then
	sed -i "s/tps.*/tps: $TX_TPS/g" ../../smartcontract/hello/config.yaml 
fi
