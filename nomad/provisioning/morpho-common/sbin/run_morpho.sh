#!/bin/sh
/root/ECIP-Checkpointing/result/bin/morpho-checkpoint-node --topology /root/morpho-common/morpho-topology.json --config /root/.morpho/morpho-configuration.yaml --database-path /root/.morpho/db/db --socket-dir /root/.morpho/socket --port 3000 --host-addr $(hostname) || /bin/sleep 10000
