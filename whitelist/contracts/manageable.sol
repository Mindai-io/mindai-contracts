// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

import "./Ownable.sol";

contract Manageable is Ownable {
    uint256 public Fee;

    constructor(address initialOwner) Ownable(initialOwner) {}

    function setEthFee(uint256 _amount) external onlyOwner {
        Fee = _amount;
    }

    function WithdrawETHFee(address payable _to) external onlyOwner {
        _to.transfer(address(this).balance);
    }
}
