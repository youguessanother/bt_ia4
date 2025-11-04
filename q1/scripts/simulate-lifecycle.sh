#!/bin/bash
set -e

CHANNEL="supplychainchannel"
CHAINCODE="supplychain"

peer chaincode invoke -o orderer.example.com:7050 -C ${CHANNEL} -n ${CHAINCODE} -c '{"Args":["CreateProduct","P100","Widget","ManufacturerA"]}' --waitForEvent
peer chaincode invoke -o orderer.example.com:7050 -C ${CHANNEL} -n ${CHAINCODE} -c '{"Args":["TransferProduct","P100","DistributorA","ManufacturerA"]}' --waitForEvent
peer chaincode invoke -o orderer.example.com:7050 -C ${CHANNEL} -n ${CHAINCODE} -c '{"Args":["TransferProduct","P100","RetailerA","DistributorA"]}' --waitForEvent
peer chaincode query -C ${CHANNEL} -n ${CHAINCODE} -c '{"Args":["GetProduct","P100"]}'
peer chaincode query -C ${CHANNEL} -n ${CHAINCODE} -c '{"Args":["QueryHistory","P100"]}'
