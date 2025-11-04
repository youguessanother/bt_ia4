#!/bin/bash
set -e

CHAINCODE_NAME="supplychain"
CHAINCODE_VERSION="1.0"
PACKAGE="${CHAINCODE_NAME}.tar.gz"
CHANNEL="supplychainchannel"
LABEL="${CHAINCODE_NAME}_${CHAINCODE_VERSION}"
PATH_CC="../chaincode/supply-chain"

echo "peer lifecycle chaincode package ${PACKAGE} --path ${PATH_CC} --lang golang --label ${LABEL}"
echo "peer lifecycle chaincode install ${PACKAGE}"
echo "peer lifecycle chaincode queryinstalled"
echo "peer lifecycle chaincode approveformyorg --channelID ${CHANNEL} --name ${CHAINCODE_NAME} --version ${CHAINCODE_VERSION} --package-id <PACKAGE_ID> --sequence 1"
echo "peer lifecycle chaincode commit -o orderer.example.com:7050 --channelID ${CHANNEL} --name ${CHAINCODE_NAME} --version ${CHAINCODE_VERSION} --sequence 1"
