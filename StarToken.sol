// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title STAR Token
 * @dev Simple ERC20 token for the StarGazing staking ecosystem
 */
contract StarToken is ERC20, Ownable {
    /**
     * @dev Constructor that gives msg.sender all of existing tokens
     * Initial supply: 1,000,000 STAR tokens (18 decimals)
     */
    constructor() ERC20("Star", "STAR") Ownable(msg.sender) {
        // Mint 1,000,000 tokens with 18 decimals
        _mint(msg.sender, 1000000 * 10**18);
    }

    /**
     * @dev Allows the owner to mint new tokens
     * @param to Address to mint tokens to
     * @param amount Amount of tokens to mint
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Allows the owner to burn tokens
     * @param amount Amount of tokens to burn
     */
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    /**
     * @dev Allows the owner to burn tokens from any address (with approval)
     * @param from Address to burn tokens from
     * @param amount Amount of tokens to burn
     */
    function burnFrom(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }
}
