//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract StringConcat {
    function stringConcat(
        string memory _a,
        string memory _b
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }
}
