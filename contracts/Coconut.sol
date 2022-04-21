// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BEP20/BEP20Basic.sol";
import "./interface/ITokenInterface.sol";

contract Coconut is BEP20Basic {

    bool public checkTokenAddress = false;

    mapping(address => bool) public claimedUser;

    uint256 public MINT_TOTAL_MAX = 1000000000000000000000;

    address[] public tokenWhiteList = [
       0x8076C74C5e3F5852037F31Ff0093Eeb8c8ADd8D3,
       0x8850D2c68c632E3B258e612abAA8FadA7E6958E5,
       0x74926B3d118a63F6958922d3DC05eB9C6E6E00c6,
       0xc748673057861a797275CD8A068AbB95A902e8de,
       0x641EC142E67ab213539815f67e4276975c2f8D50,
       0x69b14e8D3CEBfDD8196Bfe530954A0C226E5008E,
       0xADCa52302e0a6c2d5D68EDCdB4Ac75DeB5466884,
       0x3aD9594151886Ce8538C1ff615EFa2385a8C3A88,
       0xAb14952d2902343fde7c65D7dC095e5c8bE86920,
       0x87230146E138d3F296a9a77e497A2A83012e9Bc5
    ];

    constructor (address[] memory executor_, address[] memory whiteAddress) BEP20Basic("Coconut","COC",100000000000000000000000000,whiteAddress, executor_) {}

    function claim(uint256 amount,address tokenAddress) public {
        require(_open_receive, "Claim has not yet started");
        require(!claimedUser[msg.sender], "Each address can only be collected once");
        require(checkWhiteList(tokenAddress), "The contract address is invalid");
        _claim(amount, tokenAddress);
    }

    function _claim (uint256 amount,address tokenAddress) private {
        IToken ItokenCoc = IToken(tokenAddress);
        uint256 token_balances = ItokenCoc.balanceOf(msg.sender);
        require(token_balances > 0, "Insufficient Balance");
        ItokenCoc.transferFrom(msg.sender, address(this), amount);
        claimedUser[msg.sender] = true;
        _mint(msg.sender, MINT_TOTAL_MAX);
        emit Claimed(msg.sender, MINT_TOTAL_MAX, address(this));
    }

    function checkWhiteList(address addr) public view returns (bool) {
        for (uint i = 0;i < tokenWhiteList.length;i++) {
            if (tokenWhiteList[i] == addr) return true;
        }
        return false;
    }

    function changeTokenWhiteList(address[] memory newWhiteList) public onlyExecutor returns (bool) {
        tokenWhiteList = newWhiteList;
        return true;
    }
}