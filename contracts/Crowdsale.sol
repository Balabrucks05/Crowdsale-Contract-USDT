//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Crowdsale is Ownable{
    IERC20 public saleToken; // The token being sold
    IERC20 public usdtToken; // USDT as payment currency
    uint256 public rate; //Nummber of tokens per 1 Ether
    address  public wallet; //Wallet to receive USDT payments

    constructor(
        uint256 _rate,
        address _wallet,
        IERC20 _saleToken,
        IERC20 _usdtToken
    )Ownable(msg.sender){
        require(_rate > 0, "Rate must be positive");
        require(_wallet != address(0), "Invalid wallet address");
        require(address(_saleToken) != address(0), "Invalid token address");
        require(address(_usdtToken) != address(0), "Invalid payment token address");

        rate= _rate;
        wallet = _wallet;
        saleToken = _saleToken;
        usdtToken = _usdtToken;
    }
    //Functions to buy tokens
     function buyTokens(uint256 usdtAmount) public {
        uint256 tokensToBuy = usdtAmount * rate;

        require(tokensToBuy <= saleToken.balanceOf(address(this)), "Not enough tokens in the contract");

        // Transfer USDT from buyer to the wallet
        require(usdtToken.transferFrom(msg.sender, wallet, usdtAmount), "USDT transfer failed");

        // Transfer purchased tokens to the buyer
        saleToken.transfer(msg.sender, tokensToBuy);
    }

    function withdrawTokens(uint256 amount) public onlyOwner {
        saleToken.transfer(owner(), amount);
    }
}