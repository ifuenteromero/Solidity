// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract selfDestruct {
    constructor() payable {}

    function destroy() public {
        // envía los ethers del contrato al que ejecuta el self destruct
        selfdestruct(payable(msg.sender));
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function functionToBeDestroyed() public pure returns(uint) {
        return 123;
    }

    function getAddressContract() public view returns(address) {
        return address(this);
    }
}