// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.4;

contract funciones_globales{
    
    
    function getMessageSender() public view returns(address){
        return msg.sender;
    }
    
    // deprecated
    // function getNow() public view returns(uint){
    //     return now;
    // }
    
    // miner address
    function getBlockCoinBase() public view returns(address){
        return block.coinbase;
    }
    
    
    function getBlockDifficulty() public view returns(uint){
        return block.difficulty;
    }
    
    // número del bloque
    function getBlockNumber() public view returns(uint){
        return block.number;
    }
    
    // devuelve los cuatro primeros bytes de los datos enviados en la transacción
    function getMessageSig() public pure returns(bytes4){
        return msg.sig;
    }
    
    // devuelve precio del gas de la transacción
    function getTxGasPrice() public view returns(uint){
        return tx.gasprice;
    }
    
}