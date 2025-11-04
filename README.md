# Blockchain Technology – IA4  
Hyperledger Fabric Supply Chain Network and Security Analysis

---

## Overview

This repository contains the complete submission for IA4 – Blockchain Technology. It is divided into two major components:

1. **Q1 – Fabric Supply Chain Network**  
   A minimal Hyperledger Fabric setup demonstrating a multi-organization supply-chain workflow. It includes chaincode written in Go, network configuration artifacts, lifecycle scripts, and example transactions.

2. **Q2 – Security Analysis**  
   A structured set of threat models and mitigation strategies covering double-spending, Sybil attacks, and smart contract exploits, along with recommendations for improving consensus robustness and operational monitoring.

The goal of this repository is to showcase understanding of blockchain architecture, chaincode development, and enterprise security considerations.

---

## Repository Structure

├── q1
│   ├── chaincode
│   │   ├── go.mod
│   │   ├── go.sum
│   │   ├── supply-chain
│   │   └── supply-chain.go
│   ├── network
│   │   ├── configtx.yaml
│   │   └── docker-compose.yml
│   ├── scripts
│   │   ├── install-chaincode.sh
│   │   ├── setup-network.sh
│   │   └── simulate-lifecycle.sh
│   └── transactions
│       └── transaction-examples.sh
├── q2
│   ├── mitigation-strategies
│   │   ├── code-audit-verification.md
│   │   ├── consensus-improvements.md
│   │   └── monitoring-alerting.md
│   ├── security-report.md
│   └── threat-models
│       ├── double-spending.md
│       ├── smart-contract-exploits.md
│       └── sybil-attack.md
└── README.md




---

## Q1 – Fabric Supply Chain Network

### Chaincode
Implements a straightforward product lifecycle model covering:
- Creation of a product  
- Transfer of ownership across participants  
- Querying current state and historical events  

The chaincode is implemented in Go with a clean, deterministic structure suitable for demonstrating Fabric programming fundamentals.

### Network Configuration
Includes:
- `configtx.yaml` for generating channel artifacts  
- `docker-compose.yml` defining orderer and peer nodes for three organizations  
- Lightweight setup scripts outlining the sequence of channel creation, joining, chaincode packaging, approval, and commitment  

These files are designed for clarity and academic demonstration rather than full production deployment.

### Transaction Examples
The repository provides scripted example commands that illustrate:
- Chaincode invocation  
- Ownership transfer events  
- Ledger queries  
- History inspection  

These examples map directly to typical real-world supply chain workflows.

---

## Q2 – Security Analysis

### Threat Models
Three dedicated documents analyze key blockchain threats:
- Double-spending  
- Smart contract exploits  
- Sybil attacks  

Each model outlines description, attack vectors, preconditions, impacts, and mitigation strategies.

### Mitigation Strategies
Focused on:
- Formal code audits and verification techniques  
- Improving consensus and endorsement policies  
- Operational monitoring and alerting patterns  

### Security Report
A summarised, high-level analysis combining findings across network, consensus, and application layers. It provides a concise evaluation of the platform’s security posture and recommended improvements.


## Conclusion

This submission demonstrates:
- Practical understanding of Hyperledger Fabric components  
- Ability to design and implement chaincode  
- Capability to evaluate and document security risks within blockchain systems  

All deliverables are self-contained and organized for clear review and grading.

