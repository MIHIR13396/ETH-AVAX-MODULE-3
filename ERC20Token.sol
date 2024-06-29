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

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "Invalid address");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        uint256 currentAllowance = allowance(sender, _msgSender());
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);
        return true;
    }
}// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 (Trasfer token to this address)


