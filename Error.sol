// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error NotEnoughPlayers(uint256 _participants);

contract ErrorHandling {
    string public game;
    uint256 public players;
    uint256 public participants;

    constructor(string memory _game, uint256 _players) {
        game = _game;
        players = _players;
    }

    // function to check enough participants count using require
    function countCheck(uint256 _participants) external {
        require(_participants >= players, "Not enough players to participate!");
        participants = _participants;
        // let's say some logic that changes players count
        // Even then players should never be zero
        assert(players > 0);
    }

    // function to check enough participants count using revert with custom error
    function countCheckWithRevert(uint256 _participants) external {
        if (_participants < players) {
            revert NotEnoughPlayers(_participants);
        }
        participants = _participants;
        // let's say some logic that changes players count
        // Even then players should never be zero
        assert(players > 0);
    }
}
