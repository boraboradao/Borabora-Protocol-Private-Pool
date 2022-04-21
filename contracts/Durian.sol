// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BEP20/BEP20Basic.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./interface/ITokenInterface.sol";

contract Durian is BEP20Basic {
    using SafeMath for uint;

    uint256 public _token_apple_base = 1000;
    uint256 public _token_banana_base = 300;
    uint256 public _token_coconut_base = 1000;

    constructor (address[] memory executor_, address[] memory whiteAddress) BEP20Basic("Durian","DUR",100000000000000000000000000,whiteAddress, executor_) {}

    function mintToken(uint256 amount,address[] memory tokenAddress) public {
        require(_open_receive, "Mint has not yet started");
        require(whiteTransAddr[tokenAddress[0]] && whiteTransAddr[tokenAddress[1]] && whiteTransAddr[tokenAddress[2]], "You must have Apple, Banana, Coconut token to mint Durian token");
        IToken tokenApple = IToken(tokenAddress[0]);
        IToken tokenBanana = IToken(tokenAddress[1]);
        IToken tokenCoconut = IToken(tokenAddress[2]);

        uint256 token_apple_balance = tokenApple.balanceOf(msg.sender);
        uint256 token_banana_balance = tokenBanana.balanceOf(msg.sender);
        uint256 token_coconut_balance = tokenCoconut.balanceOf(msg.sender);

        uint256 apple_amount = _token_apple_base.mul(amount);
        uint256 banana_amount = _token_banana_base.mul(amount);
        uint256 coconut_amount = _token_coconut_base.mul(amount);

        require(token_apple_balance >= apple_amount, "Insufficient Apple Token");
        require(token_banana_balance >= banana_amount, "Insufficient Banana Token");
        require(token_coconut_balance >= coconut_amount, "Insufficient Coconut Token");

        tokenApple.transferFrom(msg.sender, address(this), apple_amount);
        tokenBanana.transferFrom(msg.sender, address(this), banana_amount);
        tokenCoconut.transferFrom(msg.sender, address(this), coconut_amount);

        tokenApple.burn(apple_amount);
        tokenBanana.burn(banana_amount);
        tokenCoconut.burn(coconut_amount);

        _mint(msg.sender, amount);
        emit Minted(msg.sender, amount, address(this));
    }

    function setTokenBase (uint256[] memory token_base) public onlyOwner returns (bool) {
        _token_apple_base = token_base[0];
        _token_banana_base = token_base[1];
        _token_coconut_base = token_base[2];
        return true;
    }
}