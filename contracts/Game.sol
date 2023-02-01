// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Game {
    constructor() payable {}

    function pickACard() private view returns (uint) {
        uint packedCard = uint(
            keccak256(
                abi.encodePacked(blockhash(block.number), block.timestamp)
            )
        );
        return packedCard;
    }

    function guess(uint _guess) public {
        uint _packedCard = pickACard();
        if (_guess == _packedCard) {
            (bool sent, ) = msg.sender.call{value: 0.1 ether}("");
            require(sent, "Failed");
        }
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
