// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

import {Manageable} from "./manageable.sol";

contract Whitelist is Manageable {
    event NewSignUp(address UserAddress);
    constructor(address initialOwner) Manageable(initialOwner) {}
    modifier validateSender(){
        require(
            msg.sender == tx.origin,
            "Some thing wrong with the msgSender"
        );
        _;
    }

    function SignUp() external payable validateSender() {
        require(msg.value >= Fee, "Not Enough Fee Provided");
        emit NewSignUp(msg.sender);
    }
}

