package main

import (
	"encoding/json"
	"fmt"
	"time"

	"github.com/hyperledger/fabric-chaincode-go/shim"
	sc "github.com/hyperledger/fabric-protos-go/peer"
)

type SimpleSupplyChain struct{}

type Product struct {
	ID          string   `json:"id"`
	Name        string   `json:"name"`
	Owner       string   `json:"owner"`
	Status      string   `json:"status"`
	History     []string `json:"history"`
	CreatedAt   string   `json:"createdAt"`
	LastUpdated string   `json:"lastUpdated"`
}

func (s *SimpleSupplyChain) Init(APIstub shim.ChaincodeStubInterface) sc.Response {
	return shim.Success(nil)
}

func (s *SimpleSupplyChain) Invoke(APIstub shim.ChaincodeStubInterface) sc.Response {
	fn, args := APIstub.GetFunctionAndParameters()
	switch fn {
	case "CreateProduct":
		return s.CreateProduct(APIstub, args)
	case "TransferProduct":
		return s.TransferProduct(APIstub, args)
	case "GetProduct":
		return s.GetProduct(APIstub, args)
	case "QueryHistory":
		return s.QueryHistory(APIstub, args)
	default:
		return shim.Error("Invalid function name")
	}
}

func (s *SimpleSupplyChain) CreateProduct(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	if len(args) < 3 {
		return shim.Error("Missing args")
	}
	id := args[0]
	name := args[1]
	owner := args[2]

	existing, _ := APIstub.GetState(id)
	if existing != nil {
		return shim.Error("Product exists")
	}

	now := time.Now().UTC().Format(time.RFC3339)
	p := Product{
		ID:          id,
		Name:        name,
		Owner:       owner,
		Status:      "CREATED",
		History:     []string{now + ":CREATED by " + owner},
		CreatedAt:   now,
		LastUpdated: now,
	}

	bytes, _ := json.Marshal(p)
	APIstub.PutState(id, bytes)
	return shim.Success(bytes)
}

func (s *SimpleSupplyChain) TransferProduct(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	if len(args) < 3 {
		return shim.Error("Missing args")
	}
	id := args[0]
	newOwner := args[1]
	by := args[2]

	bytes, err := APIstub.GetState(id)
	if err != nil || bytes == nil {
		return shim.Error("Not found")
	}

	var p Product
	json.Unmarshal(bytes, &p)

	now := time.Now().UTC().Format(time.RFC3339)
	entry := fmt.Sprintf("%s:TRANSFER from %s to %s by %s", now, p.Owner, newOwner, by)
	p.History = append(p.History, entry)
	p.Owner = newOwner
	p.Status = "IN_TRANSIT"
	p.LastUpdated = now

	out, _ := json.Marshal(p)
	APIstub.PutState(id, out)
	return shim.Success(out)
}

func (s *SimpleSupplyChain) GetProduct(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	if len(args) < 1 {
		return shim.Error("Missing id")
	}
	bytes, err := APIstub.GetState(args[0])
	if err != nil || bytes == nil {
		return shim.Error("Not found")
	}
	return shim.Success(bytes)
}

func (s *SimpleSupplyChain) QueryHistory(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	if len(args) < 1 {
		return shim.Error("Missing id")
	}
	bytes, err := APIstub.GetState(args[0])
	if err != nil || bytes == nil {
		return shim.Error("Not found")
	}
	var p Product
	json.Unmarshal(bytes, &p)
	hb, _ := json.Marshal(p.History)
	return shim.Success(hb)
}

func main() {
	shim.Start(new(SimpleSupplyChain))
}
