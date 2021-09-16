#!/bin/bash

# Startup script to initialize and boot a go-ethereum instance.
#
# This script assumes the following files:
#  - `geth` binary is located in the filesystem root
#  - `genesis.json` file is located in the filesystem root (mandatory)
#  - `chain.rlp` file is located in the filesystem root (optional)
#  - `blocks` folder is located in the filesystem root (optional)
#  - `keys` folder is located in the filesystem root (optional)
#
# This script assumes the following environment variables:
#
#  - HIVE_BOOTNODE                enode URL of the remote bootstrap node
#  - HIVE_NETWORK_ID              network ID number to use for the eth protocol
#  - HIVE_CHAIN_ID
#  - HIVE_TESTNET                 whether testnet nonces (2^20) are needed
#
# Forks:
#
#  - HIVE_FORK_HOMESTEAD          block number of the homestead hard-fork transition
#  - HIVE_FORK_DAO_BLOCK          block number of the DAO hard-fork transition
#  - HIVE_FORK_DAO_VOTE           whether the node support (or opposes) the DAO fork
#  - HIVE_FORK_TANGERINE          block number of Tangerine Whistle transition
#  - HIVE_FORK_SPURIOUS           block number of Spurious Dragon transition
#  - HIVE_FORK_BYZANTIUM          block number for Byzantium transition
#  - HIVE_FORK_CONSTANTINOPLE     block number for Constantinople transition
#  - HIVE_FORK_PETERSBURG         block number for ConstantinopleFix/PetersBurg transition
#  - HIVE_FORK_ISTANBUL           block number for Istanbul transition
#  - HIVE_FORK_MUIRGLACIER        block number for Muir Glacier transition
#  - HIVE_FORK_BERLIN             block number for Berlin transition
#  - HIVE_FORK_LONDON             block number for London
#
# Other:
#
#  - HIVE_MINER                   enable mining. value is coinbase address.
#  - HIVE_SKIP_POW                if set, skip PoW verification during block import
#  - HIVE_LOGLEVEL		          client loglevel (0-5)

#Remove in production
source /setup_env.sh
#

# Immediately abort the script on any error encountered
set -e

# $1 - loglevel, $2 - objective
LOGLEVEL=""
translate_loglevel () {
	case $1 in
		0)
			LOGLEVEL="OFF"
			;;
		1)
			LOGLEVEL="ERROR"
			;;
		2)
			LOGLEVEL="ERROR"
			;;
		3)
			if [ $2 == "akka" ]
			then
				LOGLEVEL="WARNING"
			else
				LOGLEVEL="WARN"
			fi
			;;
		4)
			LOGLEVEL="INFO"
			;;
		5)
			LOGLEVEL="DEBUG"
			;;
	esac
}

MANTIS_DIR=/root/mantis-dist/
POTTERY_CONF=$MANTIS_DIR/conf/pottery.conf
POTTERY_CHAIN=$MANTIS_DIR/conf/chains/pottery-chain.conf
ETC_CHAIN=$MANTIS_DIR/conf/chains/etc-chain.conf

# Set RPC port to 8545
echo -e "mantis {\n  rpc {\n    http {\n      port = 8545\n    }\n  }\n}" >> $POTTERY_CONF

# Disable metrics for pottery
sed -i "s/\senabled = true/\tenabled = false/g" $POTTERY_CONF

if [ "$HIVE_LOGLEVEL" != "" ]; then

	# Remove akka stanza from pottery
	sed -z 's/akka[^}]*}[^}]*}//' $POTTERY_CONF > /tmp/pottery.conf
	mv /tmp/pottery.conf $POTTERY_CONF

	# Remove logging stanza from pottery
	sed -z 's/logging[^}]*}//g' $POTTERY_CONF > /tmp/pottery.conf
	mv /tmp/pottery.conf $POTTERY_CONF

	# Add loglevel for akka
	translate_loglevel $HIVE_LOGLEVEL "akka"
	echo -e "\nakka {\n loglevel = \"$LOGLEVEL\" \n} \n" >> $POTTERY_CONF

	# Add loglevel for logging
	translate_loglevel $HIVE_LOGLEVEL "logging"
	echo -e "\nlogging {\n logs-level = \"$LOGLEVEL\" \n} \n" >> $POTTERY_CONF

fi

if [ "$HIVE_NETWORK_ID" != "" ]; then

	# Set network id for pottery
	sed -i "s/network-id = 9/network-id = $HIVE_NETWORK_ID/g" $POTTERY_CHAIN

fi

if [ "$HIVE_CHAIN_ID" != "" ]; then

	# Convert decimal chain id to hex
	HEX_CHAIN_ID=$( printf "%x" $HIVE_CHAIN_ID )

	# Set hex chain id for pottery
	echo "chain-id = \"0x$HEX_CHAIN_ID\"" >> $POTTERY_CHAIN
fi

# Disable mining for pottery
sed -i 's/mining-enabled = true/mining-enabled = false/g' $POTTERY_CONF

# Set pow
sed -i 's/restricted-pow/pow/g' $POTTERY_CONF

if [ "$HIVE_MINER" != "" ]; then

	# Enable mining
	sed -i 's/mining-enabled = false/mining-enabled = true/g' $POTTERY_CONF

	# Set coinbase
	sed -i "s/coinbase = .*/coinbase = \"$HIVE_MINER\"/g" $POTTERY_CONF

fi

# Remove bootstrap-nodes stanza from pottery
sed -z 's/bootstrap-nodes[^]]*]//' $POTTERY_CHAIN > /tmp/pottery-chain.conf
mv /tmp/pottery-chain.conf $POTTERY_CHAIN

# Add Hive bootstrap node
if [ "$HIVE_BOOTNODE" != "" ]; then
	echo -e "\nbootstrap-nodes = [\"$HIVE_BOOTNODE\"]" >> $POTTERY_CHAIN
else
	echo -e "\nbootstrap-nodes = []" >> $POTTERY_CHAIN 
fi

if [ $HIVE_FORK_HOMESTEAD != "" ]; then
	echo "homestead-block-number = \"$HIVE_FORK_HOMESTEAD\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_DAO_BLOCK != "" ]; then
	grep -zo "dao[^}]*}" $ETC_CHAIN >> $POTTERY_CHAIN
	echo -e "\n" >> $POTTERY_CHAIN
	sed -i "s/fork-block-number = \"[0-9]*\"/fork-block-number = \"$HIVE_FORK_DAO_BLOCK\"/g" $POTTERY_CHAIN
fi

if [ $HIVE_FORK_TANGERINE != "" ]; then
	echo "eip150-block-number = \"$HIVE_FORK_TANGERINE\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_SPURIOUS != "" ]; then
	echo "atlantis-block-number = \"$HIVE_FORK_SPURIOUS\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_BYZANTIUM != "" ]; then
	echo "byzantium-block-number = \"$HIVE_FORK_BYZANTIUM\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_CONSTANTINOPLE != "" ]; then
	echo "constantinople-block-number = \"$HIVE_FORK_CONSTANTINOPLE\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_PETERSBURG != "" ]; then
	echo "petersburg-block-number = \"$HIVE_FORK_PETERSBURG\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_ISTANBUL != "" ]; then
	echo "istanbul-block-number = \"$HIVE_FORK_ISTANBUL\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_MUIRGLACIER != "" ]; then
	echo "muir-glacier-block-number = \"$HIVE_FORK_MUIRGLACIER\"" >> $POTTERY_CHAIN
fi

if [ $HIVE_FORK_BERLIN != "" ]; then
	echo "berlin-block-number = \"$HIVE_FORK_BERLIN\"" >> $POTTERY_CHAIN
fi

set +e

mv /genesis.json /genesis-input.json
jq -f /mapper.jq /genesis-input.json > /genesis.json

echo "Supplied genesis state:"
cat /genesis.json

#mv /genesis.json $MANTIS_DIR/conf/chains/pottery-genesis.json

set -e
echo "Running mantis client"
$MANTIS_DIR/bin/mantis-launcher pottery
