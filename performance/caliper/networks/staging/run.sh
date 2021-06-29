#!/bin/bash
cd ../../caliper-benchmarks
npx caliper launch manager --caliper-benchconfig ../smartcontract/hello/config.yaml --caliper-networkconfig ../networks/staging/networkconfig.json --caliper-workspace . 
