// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint8 public decimals = 18;

    mapping(address => uint256) public balanceOf;
    // mapping(address => mapping(address => uint256)) public allowance;

    // event Transfer(address indexed _from, address indexed _to, uint256 _amount);
    // event Approval(
    //     address indexed _owner,
    //     address indexed _spender,
    //     uint256 _amount
    // );
    event Mint(address indexed _from, uint256 _amount);
    event Burn(address indexed _from, uint256 _amount);

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    // function _transfer(address _from, address _to, uint256 _amount) internal {
    //     require(_to != address(0), "Recepient cannot be Zero Address");
    //     require(balanceOf[_from] >= _amount, "Insufficient balance");
    //     balanceOf[_from] -= _amount;
    //     balanceOf[_to] += _amount;
    //     emit Transfer(_from, _to, _amount);
    // }

    // function transfer(address _to, uint256 _amount) public returns (bool) {
    //     _transfer(msg.sender, _to, _amount);
    //     return true;
    // }

    // function approve(address _spender, uint256 _amount) public returns (bool) {
    //     allowance[msg.sender][_spender] = _amount;
    //     emit Approval(msg.sender, _spender, _amount);
    //     return true;
    // }

    // function transferFrom(
    //     address _from,
    //     address _to,
    //     uint256 _amount
    // ) public returns (bool) {
    //     require(
    //         _amount <= allowance[_from][msg.sender],
    //         "Insufficient allowance"
    //     );
    //     allowance[_from][msg.sender] -= _amount;
    //     _transfer(_from, _to, _amount);
    //     return true;
    // }

    function mint(uint _amount) public {
        balanceOf[msg.sender] += _amount;
        totalSupply += _amount;
        emit Mint(msg.sender, _amount);
    }

    function burn(uint _amount) public {
        require(balanceOf[msg.sender] >= _amount);
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Burn(msg.sender, _amount);
    }
}
