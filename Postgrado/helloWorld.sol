// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract MessageBox {
    string public message;

    constructor (string memory _message) {
        message = _message;
    }

    function setMessage (string memory _new_message) public {
        message = _new_message;
    }

    function getMessage () public view returns (string memory) {
        return message;
    }
}