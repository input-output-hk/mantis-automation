#!/bin/bash
#set -e

cd "$(dirname "$0")"


git clone https://github.com/input-output-hk/mantis.git
cd mantis
git checkout $MANTIS_COMMIT
git submodule update --recursive --init
sbt dist

cd target/universal
unzip mantis-*.zip
rm mantis-*.zip
mv mantis* mantis-client
sed -i 's|@bootstrap-|@bootstrap-pr-|g' mantis-client/conf/chains/pottery-chain.conf
#sed -i 's|testnet-internal-nomad|mordor|g' mantis-client/conf/chains/pottery-chain.conf
sed -i 's|discovery-enabled = true|discovery-enabled = false|g' mantis-client/conf/pottery.conf
sed -i 's|0x2fefd8|0x7A1200|g' mantis-client/conf/chains/pottery-genesis.json
sed -i "s/restricted-pow/pow/g" mantis-client/conf/pottery.conf

cp -r mantis-client/* ../../../../nomad/distributions/bootstrap-common/

sed -i 's|mining-enabled = true|mining-enabled = false|g' mantis-client/conf/pottery.conf

cp -r mantis-client/* ../../../../nomad/distributions/passive/

cd ../../../../nomad
cd persistance/dag
cat dag.tar.gz.* | tar xzvf -
ls -alsh
rm dag.tar.gz.*
cp -r * ../bootstrap-1/dot.ethash/
cp -r * ../bootstrap-2/dot.ethash/
cp -r * ../bootstrap-3/dot.ethash/
cp -r * ../bootstrap-4/dot.ethash/
cp -r * ../bootstrap-5/dot.ethash/
cd ../..
sed -i "s|/home/ubuntu/mantis-automation|${PWD%%nomad*}|g" nomad.conf
sudo nomad agent -dev -config=nomad.conf --config=extra/pottery-pr.json | grep -i error &
sleep 15
export NOMAD_ADDR=http://127.0.0.1:4686
export NOMAD_PORT_http=4686
export NOMAD_PORT_rpc=4687
export NOMAD_PORT_serf=4688

cd ../pullrequest
nomad job run hcl/bootstrap-pr.hcl
nomad job run hcl/passive-pr.hcl

until sudo docker ps | grep bootstrap-pr | head -n 1 | awk '{print $1}' | xargs sudo docker logs | grep -i "Loading DAG from file 99"; do echo LOADING DAG; sleep 30; done

