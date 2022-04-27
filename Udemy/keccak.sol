// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Keccak {
    function hash (string memory _string) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_string));
    }

    function hash2 (string memory _string, uint _int, address _address ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_string, _int, _address));
    }
}
