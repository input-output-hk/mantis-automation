#!/bin/bash
set -e

base/build.sh

openjdk11/build.sh

morpho/build.sh

explorer/build.sh

hoverfly/build.sh

passive/build.sh

bootstrap/build.sh

miner/build.sh
