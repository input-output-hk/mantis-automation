#!/bin/bash

cd "$(dirname "$0")"

git clone https://github.com/OpenZeppelin/openzeppelin-contracts.git
cp ../smartcontracts/openzeppelin/* openzeppelin-contracts/
cd openzeppelin-contracts

sed -i "s|testnet-passive|e2e-miner|g" hardhat.config.js

. ~/.profile
nvm use v14.17.0
npm install @nomiclabs/hardhat-solhint
npm install
npm install mocha mochawesome

sed -i '/if (!expectedError/,/}/d' node_modules/@openzeppelin/test-helpers/src/expectRevert.js

