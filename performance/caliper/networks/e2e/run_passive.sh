#!/bin/bash
cd ../../caliper-benchmarks
for i in {0..0}
do
npx caliper launch manager --caliper-benchconfig ../networks/e2e/config.yaml --caliper-networkconfig ../networks/e2e/networkconfig-passive-$i.json --caliper-workspace . &
done
