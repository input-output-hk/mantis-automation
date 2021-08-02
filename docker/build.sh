#!/bin/bash
set -e

cd "$(dirname "$0")"

base/build.sh

openjdk11/build.sh

#morpho/build.sh &

explorer/build.sh

hoverfly/build.sh

passive/build.sh 

passive-kevm/build.sh

bootstrap/build.sh

bootstrap-mining-kevm/build.sh

miner/build.sh

#mocked-miner/build.sh
