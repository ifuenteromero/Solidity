// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Variables {
    // cadenas de texto UTF_8 de longitud arbitraria
    // en realidad son un array dinámico de bytes; (codificación UTF_8)
    string public _string = "Hola como esta's";
    bool isAuthorized = true;
    // bytes<x> x de 1 a 32
    // byte equivalente a byte1
    // bytes isLogged = 0;
    bytes32 hashed_string = keccak256(abi.encodePacked(_string));

    bytes4 public msg_sig;
     // address Dirección de 20bytes ??? 
    address my_adress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    // devuelve los cuatro primeros bytes de los datos enviados en la transacción
    function getMessageSig() public  {
        msg_sig = msg.sig;
    }
    
   
}