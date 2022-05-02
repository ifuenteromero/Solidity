/*
    A partir del smart contract MessageBox que creamos en la anterior sesión
    adaptarlo para:
    REQ1: Se puedan añadir más de un mensaje. 
    REQ2: Recuperar listado mensajes existentes.
    REQ3: Se debe pagar un mínimo de 10 wei para añadir un nuevo mensaje.
    REQ4: El creador del contrato puede eliminar mensajes. (admin)
    REQ5: Se registra la fecha UNIX del último mensaje añadido.
*/

/* MESSAGE BOX ORIGINAL

pragma solidity ^0.8.7;

contract MessageBox {
    string public message;
    
    constructor (string memory _message)  {
        message = _message;
    }
    
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
    
    function getMessage() public view returns (string memory) {
        return message;
    }
}
*/

//SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.13;

contract MessageBoxV2 {
    string[] messageList;
    uint constant MINIMUM_PRICE = 10;
    address owner;
    uint dateLastMessage;
   
    constructor () {
        owner = msg.sender;
    }

    function isAdmin() internal view returns (bool) {
        address currentUser = msg.sender;
        return currentUser == owner;
    }

    function addMessage(string memory _newMessage) public payable {
        uint price = msg.value;
        bool canAddMessages = price >= MINIMUM_PRICE;
        if(canAddMessages) {
            messageList.push(_newMessage);
            setDateLastMessage(block.timestamp);
        }
    }

    function getMessages() public view returns (string[] memory) {
        return messageList;
    }

    function deleteMessage(uint _index) public {
        uint length = messageList.length;
        bool isValidIndex = _index < length;
        bool canDelete = isValidIndex && isAdmin();

	    if(canDelete) {
	        for(uint i = _index; i < length - 1; i++) {
	            messageList[i] = messageList[i + 1];
	        }
            messageList.pop();
	    } 
    }

    function setDateLastMessage(uint _date) internal {
        dateLastMessage = _date;
    }
}