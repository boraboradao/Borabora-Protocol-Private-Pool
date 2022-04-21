// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BEP20/BEP20Basic.sol";

contract Apple is BEP20Basic {
    mapping(address => uint) public claimIndex;

    uint256 public _MAX_CLAIM_TOTAL = 500000000000000000000;

    constructor (address[] memory executor_, address[] memory whiteAddress) BEP20Basic("Apple", "APP", 100000000000000000000000000, whiteAddress, executor_) {}

    function claim() public {
        require(_open_receive, "Claim has not yet started");
        require(claimIndex[msg.sender] == 0, "The token can only be claimed once");
        claimIndex[msg.sender] = 1;
        _claim(_MAX_CLAIM_TOTAL);
    }

    function claimIncome(uint256 amount,bytes32[] memory _merkleProof) public {
        require(_open_receive, "Claim has not yet started");
        require(claimIndex[msg.sender] == 1, "The token can only be claimed once");
        require(whiteListBeInvitedClaim(amount,_merkleProof));
        claimIndex[msg.sender] = 2;
        _claim(amount);
    }

    function _claim (uint256 amount) private {
        _mint(msg.sender, amount);
        emit ClaimedApple(claimIndex[msg.sender], msg.sender, amount, address(this));
    }

    event ClaimedApple(uint256 current_index,address recipient,uint256 amount,address tokenAddress);
}