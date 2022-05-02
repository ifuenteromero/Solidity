// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract newOwner {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            msg.sender == owner,
            "Only owner can call this function."
        );
        _;
    }

    modifier validAddress(address _address) {
        require(
            _address != address(0)
            ,
            "Not valid address"
        );
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    function getAddress() public view returns(address){
        // dirección del contrato
        return address(this);
    }
}