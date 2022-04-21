// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BEP20/BEP20Basic.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Banana is BEP20Basic {
    using SafeMath for uint;

    mapping(address => uint256) public _invitedTotal; 

    constructor (address[] memory executor_, address[] memory whiteAddress) BEP20Basic("Banana","BAN", 100000000000000000000000000, whiteAddress, executor_) {}

    function claim(uint256 amount,uint256 invitedPeople,uint256 invitedTotal,bytes32[] memory _merkleProof) public {
        require(_open_receive, "Claim has not yet started");
        require(invitedTotal > _invitedTotal[msg.sender], "Claim Failed");
        require(whiteListInvitedClaim(invitedPeople,invitedTotal,amount,_merkleProof));
        _invitedTotal[msg.sender] = invitedTotal;
        _mint(msg.sender, amount);
        emit Claimed(msg.sender, amount, address(this));
    }
}
