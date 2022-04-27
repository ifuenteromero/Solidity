// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Ints {
    // uint unsigned integer enteros positivos y 0
    // int signed integer enteros con signo positivos y negativos
    // int<x> x tamaño máximo en bits. De 8 a 256 múltiplos de 8 
    // uint256 equivalente a uint, análogo int
    // uint24 número máximo 2^24 - 1

    uint8 uint_8_bits = 255; // máximo
    uint16 uint_16_bits = 65535;
    uint24 uint_24_bits = 16777211;
    uint max_uint = 2**256 - 1;
    int8 int_8_bits = 127;
    int8 int_8_bits2 = -128;
}