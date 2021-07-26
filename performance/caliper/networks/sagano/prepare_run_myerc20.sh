#!/bin/bash

cd $(dirname $0)

if [[ -v TX_NUMBER ]]; then
	sed -i "s/txNumber.*/txNumber: $TX_NUMBER/g" ../../smartcontract/myerc20/config.yaml 
fi
if [[ -v TX_TPS ]]; then
	sed -i "s/tps.*/tps: $TX_TPS/g" ../../smartcontract/myerc20/config.yaml 
fi
