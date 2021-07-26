#!/bin/bash

cd "$(dirname "$0")"

git clone https://github.com/OpenZeppelin/openzeppelin-contracts.git
cp ../smartcontracts/openzeppelin/* openzeppelin-contracts/
cd openzeppelin-contracts

export MANTIS_IP=$(sudo docker network inspect nomad_mantis | more | grep passive-kevm -A 5 | grep -i ipv4address | grep -o [0-9]*\\.[0-9]*\\.[0-9]*\\.[0-9]* | head -n 1)
echo "Mantis IP: $MANTIS_IP"
sed -i "s|https://mantis-testnet-passive-0.mantis.ws|http://$MANTIS_IP:8546|g" hardhat.config.js
sed -i "s|8000000|32000000|g" hardhat.config.js

. ~/.profile
nvm use v14.17.0
npm install @nomiclabs/hardhat-solhint
npm install
npm install mocha mochawesome

sed -i '/if (!expectedError/,/}/d' node_modules/@openzeppelin/test-helpers/src/expectRevert.js

