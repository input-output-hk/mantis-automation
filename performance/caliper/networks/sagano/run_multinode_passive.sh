#!/bin/bash
cd ../../caliper-benchmarks
for i in {0..4}
do
npx caliper launch manager --caliper-benchconfig ../smartcontract/hello/config.yaml --caliper-networkconfig ../networks/sagano/networkconfig-passive-$i.json --caliper-workspace . &
sleep 600
done
