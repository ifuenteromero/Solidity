// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

    // function deleteArrayItem(uint[] memory array, uint _index) pure returns (uint[] memory) {
    //     uint[] memory tempArray;
    //     uint numberItems = array.length;
    //     uint numberItemsTempArray = numberItems - 1;
    //     bool canDelete = _index < numberItems;
    //     if(canDelete){
    //         for(uint i = 0; i < numberItemsTempArray; i++){
    //             uint newValue ;
    //             if(i<_index) {
    //                 newValue = array[i];
    //             } 
    //             else {
    //                 if(i > _index) {
    //                     newValue = array[i + 1];
    //                 }
    //             }
    //             tempArray[i] = newValue;
    //         }
    //     }
    //     return tempArray;
    // }

contract MessageList {
    string[] public messageList;
    uint256 dateLastAddedMessage;
    uint constant minimunValue = 10000000;
    address constant OWNER_ADDRESS = "0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC"

    function addMessage (string memory _new_message) public payable {
        require(msg.value >= minimunValue, "debe pagarse al menos 10 weis");
        messageList.push(_new_message);
        saveDateLastAddedMessage();
    }

    function getMessages () public view returns (string[] memory) {
        return messageList;
    }

    function deleteMessage(uint _index) public {
        uint numberMessages = messageList.length;
        bool isAdmin = msg.sender === OWNER_ADDRESS;
        bool canDelete = _index < numberMessages;
        //  bool isAdmin = _address == 
        //  require(canDelete); ??
        //  delete messageList[_index];
        if(canDelete && isAdmin){
            for(uint i = _index; i < numberMessages - 1; i++){
                messageList[i] = messageList[i + 1];
            }
            messageList.pop();
        }

        // Al borrar se debe actualizar la fecha
    }

    // function deleteMessage(uint _index) public {
    //     deleteArrayItem(messageList, _index);
    // }

    function saveDateLastAddedMessage() internal {
        dateLastAddedMessage = block.timestamp;
    }

    function getLastMessageDate() public view returns (uint256){
        return dateLastAddedMessage;
    }
}