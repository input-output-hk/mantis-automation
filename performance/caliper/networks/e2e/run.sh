#!/bin/bash
cd ../../caliper-benchmarks
for i in {0..4}
do
#npx caliper launch manager --caliper-benchconfig ../networks/e2e/config.yaml --caliper-networkconfig ../networks/e2e/networkconfig-miner-$i.json --caliper-workspace . &
npx caliper launch manager --caliper-benchconfig ../smartcontract/hello/config.yaml --caliper-networkconfig ../networks/e2e/networkconfig-miner-$i.json --caliper-workspace . &
sleep 600
done
