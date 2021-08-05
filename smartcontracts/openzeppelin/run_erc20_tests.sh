#!/bin/bash
git clone https://github.com/OpenZeppelin/openzeppelin-contracts.git
cp smartcontracts/openzeppelin/* openzeppelin-contracts/
cd openzeppelin-contracts
. ~/.profile
nvm use v14.17.0
npm install @nomiclabs/hardhat-solhint
npm install
npm install mocha mochawesome
npx hardhat --network $1 test test/token/ERC20/ERC20.test.js
../smartcontracts/openzeppelin/check_result.sh
