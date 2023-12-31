// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
contract Token {

    // token -> owner
    mapping(uint => address) public tokenOwner;

    // function to create a token
    function createToken() public returns (uint) {
        uint tokenID = block.timestamp;
        tokenOwner[tokenID] = msg.sender;
        return tokenID;
    }

    // change owner
    function changeTokenOwner(uint _tokenID, address newOwner) external  {
        tokenOwner[_tokenID] = newOwner;
    }

    function getOwner(uint _tokenID) external view returns (address) {
        return tokenOwner[_tokenID];
    }
}
