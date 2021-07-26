#!/bin/bash
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["0ad9b5c47bf18ffae431ac985bfcb745f5cddff7ff09f0e8e8045e56d1fd6492", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-testnet-passive-0.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0xf579f6f1040b60b48fc4aab2237b5e6aa36bc958", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-testnet-passive-0.mantis.ws
curl -X POST -H "Content-Type: application/json" \
																			-d '{
																			"jsonrpc": "2.0",
																				"method": "faucet_sendFunds", 
																				"params": ["0xf579f6f1040b60b48fc4aab2237b5e6aa36bc958"],
																				"id": 1
																			}' https://mantis-testnet-faucet.mantis.ws
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["23336d0a64c169602d21aa07ee3badb0fbce06b1c1895c68b2cbfceda6abb86c", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-testnet-passive-0.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0x0caf9db73edd872303d2b493a55adf7eee767a87", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-testnet-passive-0.mantis.ws

