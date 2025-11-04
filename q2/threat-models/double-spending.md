# Double-Spending Threat Model

## Threat Description
Double-spending is an attempt to use the same digital asset in more than one transaction. In blockchain systems, this usually occurs when an attacker exploits delays or inconsistencies in transaction finality.

## Assets at Risk
- Ledger integrity
- Transaction correctness
- Supply-chain asset ownership records

## Attack Vectors
- Broadcasting conflicting transactions to different peers
- Exploiting network latency or temporary partitions
- Attempting replays before endorsement or ordering
- Manipulating endorsement policies with compromised identities

## Preconditions
- Weak endorsement policy
- Delayed block finality or slow peer synchronization
- Lack of monitoring of conflicting transactions

## Impact
- Corrupted asset states
- Inconsistent product ownership
- Loss of trust among organizations
- Potential financial or reputational damage

## Mitigations
- Strict endorsement policies requiring multiple organizations
- Immediate validation and signature checks during endorsement
- Consistent peer synchronization and robust ordering service
- Monitoring for conflicting or duplicate transaction submissions
- Certificate revocation for compromised identities
