#!/bin/bash
cd ../../caliper-benchmarks
npx caliper launch manager --caliper-benchconfig ../smartcontract/myerc20/config.yaml --caliper-networkconfig ../networks/sagano/networkconfig_myerc20.json --caliper-workspace . 
if [ ! -f report.html ]; then
  exit 1
fi

