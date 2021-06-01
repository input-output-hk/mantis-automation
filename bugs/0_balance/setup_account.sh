#!/bin/bash
curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_importRawKey", 
                                        "params": ["44d83b6498db69a92ab53987f986640bec6f0c40cc5b7153690a7fbf0d135765", "qwertyuiop"],
                                        "id": 1
                                      }' https://mantis-testnet-passive-0.mantis.ws 

curl -X POST -H "Content-Type: application/json" \
                                      -d '{
                                      "jsonrpc": "2.0",
                                        "method": "personal_unlockAccount", 
                                        "params": ["0xa4713d6ab3ad3c77bee2156037e2d7953b45eafe", "qwertyuiop", 0],
                                        "id": 1
                                      }' https://mantis-testnet-passive-0.mantis.ws

