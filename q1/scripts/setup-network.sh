#!/bin/bash
set -e

CHANNEL_NAME="supplychainchannel"

configtxgen -profile SupplyChainGenesis -channelID system-channel -outputBlock ./system-genesis-block.block
mkdir -p channel-artifacts
configtxgen -profile SupplyChainChannel -outputCreateChannelTx ./channel-artifacts/${CHANNEL_NAME}.tx -channelID ${CHANNEL_NAME}

docker-compose -f network/docker-compose.yml up -d

echo "docker exec -it cli peer channel create -o orderer.example.com:7050 -c ${CHANNEL_NAME} -f ./channel-artifacts/${CHANNEL_NAME}.tx"
echo "docker exec -it cli peer channel join -b ${CHANNEL_NAME}.block"
