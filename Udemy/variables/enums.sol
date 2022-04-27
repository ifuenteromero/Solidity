// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Enums {
    // tipos de datos creados por el usuario enumerable
    // miembros
    enum state {ON, OFF}
    state light;

    function turnOn () public {
        if(isOff(light)) light = state.ON;
    }

    function turnOff () public {
        if(isOn(light)) light = state.OFF;
    }

    function getState () public view returns (state) {
        return light;
    }

    function setState (uint8 _index) public {
        light = state(_index);
    }

    function toggleState () public {
        if(isOn(light)) turnOff();
        else turnOn();
    }

    function isOn(state _state) internal pure returns (bool) {
        return _state == state.ON;
    }

    function isOff(state _state) internal pure returns (bool) {
        return !isOn(_state);
    }
}