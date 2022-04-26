// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract FirstContract {
    //  comentarios de línea
    /*
        Comentarios de 
        bloque
    */
    // Comentarios natspec
    /// @title <Título del contrato>
    /// @author <Autor del contrato>
    /// @notice <Explicar lo que hace el código o función>
    /// @dev <Detalles adicionales sobre el contrato o función>
    /// @param 
    /// @return

    address owner;

    constructor () {
        owner = msg.sender;
    }

    function getOwner () public view returns (address) {
        return owner;
    }
}
