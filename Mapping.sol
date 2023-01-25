// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleMapping {
    mapping(address => bool) public members;

    function addMember(address _member) external {
        members[_member] = true;
    }

    function removeMember(address _member) external {
        members[_member] = false;
    }

    function isMember(address _member) external view returns (bool) {
        return members[_member];
    }
}

contract MappingWithStruct {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "user is already active");
        users[msg.sender] = User(100, true);
    }

    function transfer(address _recipient, uint256 _amount) external {
        require(users[msg.sender].isActive && users[_recipient].isActive);
        require(users[msg.sender].balance > _amount);
        users[_recipient].balance += _amount;
        users[msg.sender].balance -= _amount;
    }
}

contract NestedMapping {
    enum ConnectionTypes {
        Unacquainted,
        Friend,
        Family
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(
        address other,
        ConnectionTypes connectionType
    ) external {
        connections[msg.sender][other] = connectionType;
    }
}
