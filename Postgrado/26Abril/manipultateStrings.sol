// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract manipulateStrings {

    string public text;
    
    function concatStrings(string memory _s1, string memory _s2) public {
        text = string(abi.encodePacked(_s1,_s2));
    }
    
    function compareString(string memory _string) public view returns (bool) {
        return  keccak256(abi.encodePacked(text)) == keccak256(abi.encodePacked(_string));
    }
}