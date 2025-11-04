#!/bin/bash

CHANNEL="supplychainchannel"
CHAINCODE="supplychain"

echo "peer chaincode invoke -C ${CHANNEL} -n ${CHAINCODE} -c '{\"Args\":[\"CreateProduct\",\"P200\",\"Gadget\",\"ManufacturerA\"]}'"
echo "peer chaincode invoke -C ${CHANNEL} -n ${CHAINCODE} -c '{\"Args\":[\"TransferProduct\",\"P200\",\"DistributorA\",\"ManufacturerA\"]}'"
echo "peer chaincode invoke -C ${CHANNEL} -n ${CHAINCODE} -c '{\"Args\":[\"TransferProduct\",\"P200\",\"RetailerA\",\"DistributorA\"]}'"
echo "peer chaincode query -C ${CHANNEL} -n ${CHAINCODE} -c '{\"Args\":[\"GetProduct\",\"P200\"]}'"
echo "peer chaincode query -C ${CHANNEL} -n ${CHAINCODE} -c '{\"Args\":[\"QueryHistory\",\"P200\"]}'"
