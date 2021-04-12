#!/bin/bash
cd "$(dirname "$0")"
echo "Building docker image"
sudo docker build -t mocked-miner:local .
