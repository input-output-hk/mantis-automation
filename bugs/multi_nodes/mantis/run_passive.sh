#!/bin/bash
cd ../caliper-benchmarks
npx caliper launch manager --caliper-benchconfig ../hello/config.yaml --caliper-networkconfig ../mantis/networkconfig-passive-0.json --caliper-workspace . &
sleep 180
npx caliper launch manager --caliper-benchconfig ../hello/config.yaml --caliper-networkconfig ../mantis/networkconfig-passive-1.json --caliper-workspace . &
sleep 180
npx caliper launch manager --caliper-benchconfig ../hello/config.yaml --caliper-networkconfig ../mantis/networkconfig-passive-2.json --caliper-workspace . &
sleep 180
npx caliper launch manager --caliper-benchconfig ../hello/config.yaml --caliper-networkconfig ../mantis/networkconfig-passive-3.json --caliper-workspace . &
sleep 180
npx caliper launch manager --caliper-benchconfig ../hello/config.yaml --caliper-networkconfig ../mantis/networkconfig-passive-4.json --caliper-workspace . 
