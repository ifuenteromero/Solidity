// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract FirstContract {
    address owner;

    constructor () {
        owner = msg.sender;
    }

    function getOwner () public view returns (address) {
        return owner;
    }
}