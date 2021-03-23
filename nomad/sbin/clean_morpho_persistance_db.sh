#!/bin/bash

set -x

cd "$(dirname "$0")"

sudo rm -rf ../persistance/morpho-1/dot.morpho/db/db/*
sudo rm -rf ../persistance/morpho-2/dot.morpho/db/db/*
sudo rm -rf ../persistance/morpho-3/dot.morpho/db/db/*
sudo rm -rf ../persistance/morpho-4/dot.morpho/db/db/*
sudo rm -rf ../persistance/morpho-5/dot.morpho/db/db/*
