// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Kill {
    constructor() payable {}
    
    function destroy() public {
        selfdestruct(payable(msg.sender));
    }
}

contract Helper {
    constructor() payable {}
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function destroy(Kill _contract) public {
        _contract.destroy();
    }
}