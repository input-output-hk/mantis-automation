#!/bin/bash
cd ../../caliper-benchmarks
npx caliper launch manager --caliper-benchconfig ../smartcontract/hello/config.yaml --caliper-networkconfig ../networks/sagano/networkconfig.json --caliper-workspace . 
if [ ! -f report.html ]; then
  exit 1
fi

