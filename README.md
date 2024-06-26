# ERC-20 Token Smart Contract

This is a basic ERC-20 token smart contract written in Solidity. The contract allows users to create and manage a custom token on the Ethereum blockchain. The token follows the ERC-20 standard, which is widely used for fungible tokens.

## Table of Contents
- [Getting Started](#getting-started)
- [Token Details](#token-details)
- [Token Functions](#token-functions)
- [Deployment and Interactions](#deployment-and-interactions)
- [License](#license)

## Getting Started

To get started with the ERC-20 token smart contract, you can follow these steps:

1. Install a Solidity compiler such as solc or use an online Solidity IDE like Remix.
2. Copy the entire contents of the `ERC20Token.sol` file into your Solidity compiler or Remix.
3. Compile the contract to check for any errors or warnings.
4. Deploy the contract to an Ethereum network of your choice (mainnet or testnet).

## Token Details

The ERC-20 token has the following details:

- **Name**: XeronToken
- **Symbol**: XRN
- **Decimals**: 18
- **Total Supply**: Initial supply can be set during deployment or through subsequent minting.

## Token Functions

The ERC-20 token smart contract provides the following functions:

1. **mint(address to, uint256 amount)**
   - This function allows the contract owner to mint new tokens and assign them to a specified address. Only the contract owner can call this function.

2. **burn(uint256 amount)**
   - This function allows any token holder to burn (destroy) their own tokens. The tokens are removed from circulation, and the total supply decreases accordingly.

3. **transfer(address to, uint256 amount)**
   - This function allows users to transfer tokens to another address. The caller must have a sufficient balance to perform the transfer.
   -  This function is inherited from the OpenZeppelin ERC20 contract and does not need to be explicitly defined in our contract.

## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract XeronToken is ERC20, Ownable {
    constructor() ERC20("XeronToken", "XRN") Ownable(msg.sender) {
        // Initial minting can be done here if needed, for example:
        // _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 (Trasfer token to this address or any other address)
```  
## Deployment and Interactions

To deploy and interact with the ERC-20 token smart contract, you can follow these steps:

1. **Deploy the Contract**
   - Deploy the contract to an Ethereum network using your preferred deployment tool (e.g., Remix).

2. **Receive the Contract Address**
   - After deployment, you will receive the contract address. This address represents your token contract on the blockchain.

3. **Interact with the Contract**
   - You can interact with the contract using the provided functions. For example:
     - Call the `mint` function to create and assign new tokens to a specified address.
     - Call the `burn` function to burn a certain amount of your own tokens.
     - Call the `transfer` function to send tokens to another address.
   - Make sure you have sufficient gas and appropriate permissions (e.g., contract ownership) to execute certain functions.
     
## Authors

MIHIR  
[@MIHIR SINGH](https://www.linkedin.com/in/mihir-singh-0974832a8)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

