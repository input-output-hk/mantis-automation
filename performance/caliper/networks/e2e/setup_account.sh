#!/bin/bash
FAUCET_BACKOFF=60
for i in {0..4}
do

if [ "$i" -eq "0" ]; then
# 0ad9b5c47bf18ffae431ac985bfcb745f5cddff7ff09f0e8e8045e56d1fd6492
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["0ad9b5c47bf18ffae431ac985bfcb745f5cddff7ff09f0e8e8045e56d1fd6492", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0xf579f6f1040b60b48fc4aab2237b5e6aa36bc958", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws

sleep $FAUCET_BACKOFF
curl -X POST -H "Content-Type: application/json" \
																			-d '{
																			"jsonrpc": "2.0",
																				"method": "faucet_sendFunds", 
																				"params": ["0xf579f6f1040b60b48fc4aab2237b5e6aa36bc958"],
																				"id": 1
																			}' https://mantis-e2e-faucet.mantis.ws
fi

if [ "$i" -eq "1" ]; then
# 23336d0a64c169602d21aa07ee3badb0fbce06b1c1895c68b2cbfceda6abb86c
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["23336d0a64c169602d21aa07ee3badb0fbce06b1c1895c68b2cbfceda6abb86c", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0x0caf9db73edd872303d2b493a55adf7eee767a87", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws

sleep $FAUCET_BACKOFF
curl -X POST -H "Content-Type: application/json" \
																			-d '{
																			"jsonrpc": "2.0",
																				"method": "faucet_sendFunds", 
																				"params": ["0x0caf9db73edd872303d2b493a55adf7eee767a87"],
																				"id": 1
																			}' https://mantis-e2e-faucet.mantis.ws
fi

if [ "$i" -eq "2" ]; then
# 0d5e9e0c42d9daf614608f2606a179fdf81cd23e62243695da6e76d3fbd50603
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["0d5e9e0c42d9daf614608f2606a179fdf81cd23e62243695da6e76d3fbd50603", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0xd013fe9b834af0b45203fc809e4f5ecd7d7e7fc6", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws

sleep $FAUCET_BACKOFF
curl -X POST -H "Content-Type: application/json" \
																			-d '{
																			"jsonrpc": "2.0",
																				"method": "faucet_sendFunds", 
																				"params": ["0xd013fe9b834af0b45203fc809e4f5ecd7d7e7fc6"],
																				"id": 1
																			}' https://mantis-e2e-faucet.mantis.ws
fi

if [ "$i" -eq "3" ]; then
# 994058e33603705662e20cdb4b279053552c754711d14f2b6604d14ded562a47
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["994058e33603705662e20cdb4b279053552c754711d14f2b6604d14ded562a47", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0x24c969f591dabc295ccb08d4ffd9c67599669906", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws

sleep $FAUCET_BACKOFF
curl -X POST -H "Content-Type: application/json" \
																			-d '{
																			"jsonrpc": "2.0",
																				"method": "faucet_sendFunds", 
																				"params": ["0x24c969f591dabc295ccb08d4ffd9c67599669906"],
																				"id": 1
																			}' https://mantis-e2e-faucet.mantis.ws
fi

if [ "$i" -eq "4" ]; then
# b1c74929c998cae30e48b34cefa79206f5fee5959ae577347e17e6a46c86deb5 
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["b1c74929c998cae30e48b34cefa79206f5fee5959ae577347e17e6a46c86deb5", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0x9f8d7f26051a09901bf84ec88f6c6cf6c8f09d57", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-e2e-miner-$i.mantis.ws

sleep $FAUCET_BACKOFF
curl -X POST -H "Content-Type: application/json" \
																			-d '{
																			"jsonrpc": "2.0",
																				"method": "faucet_sendFunds", 
																				"params": ["0x9f8d7f26051a09901bf84ec88f6c6cf6c8f09d57"],
																				"id": 1
																			}' https://mantis-e2e-faucet.mantis.ws
fi

done
