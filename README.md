KYC - Know Your Customer
A Decentralized KYC Verification Process for Banks.
Smart Contract Flow
Bank collects the information for the KYC from Customer.

The information collected includes User Name and Customer data which is the hash link for the data present at a secure storage. This username and hash are unique for each customer. Though there could be multiple KYC requests of same username.

A bank creates the request for submission which is stored in the smart contract.

A bank then verifies the customer KYC data which is then added to the customer list.

Other banks can get the customer information from the customer list.

Other banks can also provide votes on customer data, to showcase the authenticity of the data. These votes are then used to calculate customer rating and once this rating goes above 0.5 then the customer gets added to the final customer list which means that the customer is a trusted customer and such trusted customers are given additional benefits or offers by the bank.

Banks can also provide votes and ratings on other banks to showcase the authenticity of the banks. These ratings are important as KYC requests which are from banks with rating above 0.5 are only considered for validation. And banks with very poor rating might be removed by the admin.

The folder structure of the project is as follows -
Phase - 1 - contains the smart contract file KYC.sol
Phase - 2 - contains 2 folders 1. kyc-blockchain 2. kyc-sc
kyc-blockchain - contains the genesis block creation details for the network.
kyc-sc - contains the migration scripts, smart contracts and network configuration file(truffle-config.js).
The smart contracts are written in Solidity programming language. The development and deployment of the KYC solidity smart contracts will follow the below stages -

Setting Up a Private Ethereum Blockchain.
Deploying Smart Contracts on a Private Blockchain using Truffle.
Testing the Smart Contracts on Private Blockchain.
