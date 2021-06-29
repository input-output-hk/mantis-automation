#!/bin/bash
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["0ad9b5c47bf18ffae431ac985bfcb745f5cddff7ff09f0e8e8045e56d1fd6492", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-staging-miner-0.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0xf579f6f1040b60b48fc4aab2237b5e6aa36bc958", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-staging-miner-0.mantis.ws
sleep 600 && ./$0 &
