// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract MyUniqueToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor() {
        name = "XeronToken";
        symbol = "XRN";
        decimals = 12;
        totalSupply = 1000 * 10**uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;

  
        address[] memory addresses = new address[](3);
        addresses[0] = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        addresses[1] = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        addresses[2] = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        uint256 tokensPerAddress = 1000 * 10**uint256(decimals);

        for (uint256 i = 0; i < addresses.length; i++) {
            balanceOf[addresses[i]] += tokensPerAddress;
            totalSupply += tokensPerAddress;
            emit Transfer(address(0), addresses[i], tokensPerAddress);
            emit Mint(addresses[i], tokensPerAddress);
        }
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
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
    }
}
