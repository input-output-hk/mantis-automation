#!/bin/bash
set -e

sudo docker container prune -f
sudo docker image prune -af
