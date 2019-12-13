# Udacity Blockchain Capstone

The capstone will build upon the knowledge you have gained in the course in order to build a decentralized housing product. 

## Install

To install, download or clone the repo, then:

`npm install`

Move to contracts directory, install dependencies and compile contracts:

```
cd eth-contracts
npm install
truffle compile
``` 

## Tests

Start ganache and run tests:
```
npm run ganache
npm run test
```

To run individual tests:
```
truffle test ./test/TestERC721Mintable.js
truffle test ./test/TestSquareVerifier.js
truffle test ./test/TestSolnSquareVerifier.js
```

## ZoKrates Setup

Install and instantiate a Zokrates zkSnarks development environment using Docker. Completes the Zokrates proof in `square.code` by adding the variable names in `square.code`.

Preequisite: Install Docker using instructions from [here](https://docs.docker.com/install/).


```
# Run ZoKrates
docker run -v <path to your project folder>:/home/zokrates/code -ti zokrates/zokrates /bin/bash

# Change path to code/square
cd code/square

# Compile the program
~/zokrates compile -i square.code

# Generate the Trusted Setup
~/zokrates setup

# Compute Witness
~/zokrates compute-witness -a 3 9

# Generate Proof
~/zokrates generate-proof

# Export Verifier
~/zokrates export-verifier
```

## Contracts Deployment on Rinkeby

Run the following command to deploy contracts on Rinkeby netwrok:
`npm run deployOnRinkeby`

Contract deployment information on Rinkeby netwrok:
```
Deploying 'RealEstateERC721Token'
   > transaction hash:    0x9fec6250e90c76bc811e20ebce3fc45c61062a95fa344f5769031c3c14b52ec2
   > contract address:    0x8Cb667C093850cBAc22229E7256980EC42aa766D
   > account:             0x627306090abaB3A6e1400e9345bC60c78a8BEf57

Deploying 'SquareVerifier'
   --------------------------
   > transaction hash:    0x7edabb82e0b1b7ad398e57c097ab31e0a765eee3b02337280b7d2a7effa14b8e
   > contract address:    0x418D8F46A45a39d0e00663fd455e911DA44E880c
   > account:             0x627306090abaB3A6e1400e9345bC60c78a8BEf57

Deploying 'SolnSquareVerifier'
   ------------------------------
   > transaction hash:    0xd6b5c201ff24a2cb20fea017229c466a94cceccc45f1e3437e93fccc6e4cfe4a
   > contract address:    0x28b0B7bFD9566C95Dacb0B0cC48691869bC68d2A
   > account:             0x627306090abaB3A6e1400e9345bC60c78a8BEf57

```

## Mint Tokens

1. Use [Remix](https://remix.ethereum.org/) or [MyEtherWallet](https://www.myetherwallet.com/access-my-wallet) to mint 10 tokens to list in Opensea. Use the  ABI and the deployed SolnSquareVerifier's contract address.

2. You can list the tokens by going to: [https://rinkeby.opensea.io/get-listed/step-two](https://rinkeby.opensea.io/get-listed/step-two)

## Opensea Storefront
OpenSea Link : [https://rinkeby.opensea.io/assets/real-estate](https://rinkeby.opensea.io/assets/real-estate)

# Project Resources

* [Remix - Solidity IDE](https://remix.ethereum.org/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Truffle Framework](https://truffleframework.com/)
* [Ganache - One Click Blockchain](https://truffleframework.com/ganache)
* [Open Zeppelin ](https://openzeppelin.org/)
* [Interactive zero knowledge 3-colorability demonstration](http://web.mit.edu/~ezyang/Public/graph/svg.html)
* [Docker](https://docs.docker.com/install/)
* [ZoKrates](https://github.com/Zokrates/ZoKrates)
