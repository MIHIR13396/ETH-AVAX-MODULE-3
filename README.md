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
- **Decimals**: 12
- **Total Supply**: Initial supply of 1000 tokens (1000 * 10^12 with 12 decimals) plus additional tokens minted to predefined addresses

## Token Functions

The ERC-20 token smart contract provides the following functions:

1. **mint(address _to, uint256 _amount)**
   - This function allows the contract owner to mint new tokens and assign them to a specified address. Only the contract owner can call this function.

2. **burn(uint256 _amount)**
   - This function allows any token holder to burn (destroy) their own tokens. The tokens are removed from circulation, and the total supply decreases accordingly.

3. **transfer(address _to, uint256 _amount)**
   - This function allows users to transfer tokens to another address. The caller must have a sufficient balance to perform the transfer.
  

## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract MyUniqueToken {
    string public name = "XeronToken";
    string public symbol = "XRN";
    uint8 public decimals = 12;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Invalid address");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
    }

    function burn(uint256 _amount) public {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Burn(msg.sender, _amount);
        emit Transfer(msg.sender, address(0), _amount);
    }

    function transfer(address _to, uint256 _amount) public {
        require(_to != address(0), "Invalid address");
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        balanceOf[msg.sender] -= _amount;                         
        // 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 (Trasfer token to this address or any address you want)
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
    }                                                                          
}

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

