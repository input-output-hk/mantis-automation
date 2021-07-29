#!/bin/bash
set -x

npm_or_exit () {
	npm -version || (echo "missing npm; exiting" && exit 1)
}

8546_or_exit () {
	:
#nc -z localhost 8546 || (echo "no 8546 port open; did you run mantis client?; exiting" && exit 1)
}

clone_benchmarks () {
	git clone https://github.com/hyperledger/caliper-benchmarks.git
}

handle_benchmarks () {
	cd caliper-benchmarks
	npm init -y
	npm install --save @hyperledger/caliper-cli@0.4.0
	sed -i "s/this.checkConfig(ethereumConfig);/\/\/this.checkConfig(ethereumConfig);/g" node_modules/@hyperledger/caliper-ethereum/lib/ethereum-connector.js
	npx caliper bind --caliper-bind-sut ethereum:1.2.1
}

npm_or_exit

8546_or_exit

clone_benchmarks

handle_benchmarks

exit 0
