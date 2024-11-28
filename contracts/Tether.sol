//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract USDTToken is ERC20{
    constructor() ERC20("Tether USD", "USDT"){
        _mint(msg.sender, 1000000 * 10 ** decimals()); //Mint 1M tokens to the deployer
    }
}