//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Faucet {
    function withdraw(uint withdrawAmt) public {
        require(withdrawAmt <= 100000000000000000);
        payable(msg.sender).transfer(withdrawAmt);
    }

    receive() external payable {}
}
