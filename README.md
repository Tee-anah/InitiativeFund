# Initiative Fund

A decentralized platform for allocating community funds to initiatives using blockchain technology.

## Overview

Initiative Fund enables community members to create funding initiatives and gather financial backing in a transparent, immutable way. The system ensures that each community member can only back one initiative at a time, maintaining allocation integrity while providing clear metrics on initiative popularity for fund distribution.

## Features

- **Initiative Creation**: Any community member can submit a new funding initiative
- **Transparent Backing**: All financial backing for initiatives is recorded on the blockchain
- **One Backing Per Member**: Each community member can only back one initiative at a time
- **Backing Tracking**: Real-time tracking of backing counts for each initiative
- **Fund Allocation Metrics**: Easy access to initiative counts and backing statistics

## Functions

### Public Functions

- `create-initiative`: Submit a new community funding initiative
- `back-initiative`: Allocate your backing to an existing initiative

### Read-Only Functions

- `get-backing-count`: View the total backing for a specific initiative
- `has-backed`: Check if a community member has already backed an initiative
- `get-initiative-count`: Get the total number of initiatives submitted
- `compare-max`: Utility function to compare two values

## Getting Started

1. Deploy the contract to your blockchain
2. Community members can begin creating funding initiatives
3. Members can back initiatives they believe deserve funding
4. Track initiative backing to determine fund allocation priorities

## Use Cases

- Community treasury allocation
- Grant distribution for projects
- Resource funding prioritization
- Decentralized budget management

## Security

The system ensures allocation integrity by limiting each member to backing only one initiative at a time, preventing manipulation of fund distribution.