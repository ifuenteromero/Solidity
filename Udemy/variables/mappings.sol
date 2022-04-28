// Postgrado https://campus.bsmexecutive.com/course/view.php?id=22&section=6 2.18.50 Lección 6 :  Solidity parte 1
// Udemy https://www.udemy.com/course/solidity-a-z/learn/lecture/27706624#questions

// Asociación clave-valor para guardar y ver datos
/*
    mapping (_keyType => _valueType) [public]* <mapping_name>;
    el _key_Type no puede ser otro mapping (el valueType puede ser cualquier tipo de datos)
    el modificador public es opcional.Si se pone pública, crea un getter en la interfaz del contrato que para pedirlo tenemos 
    que especificar el nombre de la clave

    GUARDAR DATOS
    <mapping_name> [_key] = _value;

    VER DATOS
    <mapping_name> [_key];

    -Es una estructura de datos que almacena key -> value (una hash table)
    -Todas las keys deben ser del mismo tipo al igual que los valores
    -Las keys no pueden ser de tipo: mapping, dynamic array, enum o struct ???
    -El valor puede ser de cualquier tipo incluido mapping
    -Mappings siempre son almacenados en storage
    -Las keys no se almacenan. Para obtener un valor del mapping debemos
     proporcionar la key la cual es pasada a través de una función hash.
    -Consultar un maping con una key no registrada devuelve 0 (defecto)
    -Ventajas: el coste es constante sin importar el tamaño
    mientras que en arrays el coste es linial.
    -Desventajas: no es iterable, no se conocen las claves, ni cantidad valores
*/


// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13; 
import "hardhat/console.sol";

contract Mapping1 {
    mapping (address => uint) public chosenNumbers;
    address owner;

    constructor () {
        owner = msg.sender;
        chosenNumbers[owner] = block.number;
    }

    function chooseMyNumber (uint _number) public {
        address currentUser = msg.sender;
        chosenNumbers[currentUser] = _number;
    }

    function getYourNumber () public view returns (uint) {
        // No es igual que el getter de la definición 
        address currentUser = msg.sender;
        return chosenNumbers[currentUser];
    }

    function getOwnerInfo () public view returns (address, uint) {
        return (owner, chosenNumbers[owner]);
    }
}

contract GuessOwnersNumber {
    address owner;
    uint8 number;

    constructor () {
        owner = msg.sender;
        number = uint8(block.timestamp);
    }

    function isSuccess (uint8 _number) internal view returns (bool) {
        // require(_number <= 255);
        // aunque lo castee da error primero
        return number == _number;
    }

    function castedNumber (uint _number) public pure returns (uint8) {
        // devulve el resto 256 => 0 257 => 1
        return uint8(_number);
    }

    function guessNumber (uint8 _number) public view returns (string memory) {
        if(isSuccess(_number)) return "has acertado";
        return "mal";
    }

}

contract SearchByDni {

    struct Person {
        string name;
        uint8 age;
    }

    Person defaultPerson = Person("",0);

    function areEqualStrings (string memory _string1, string memory _string2) internal pure returns (bool) {
        return keccak256(abi.encodePacked(_string1)) == keccak256(abi.encodePacked(_string2));
    }

    function areDistinctStrings (string memory _string1, string memory _string2) internal pure returns (bool) {
        return !areEqualStrings(_string1, _string2);
    }

    mapping (uint32 => Person) public people;

    function signUp (uint32 _dni, string memory _name, uint8 _age) public returns(string memory) {
        Person memory currentUser = people[_dni];
        bool hasName = areEqualStrings(currentUser.name, "");
        bool hasAge = currentUser.age != 0;
        bool isAlreadyReqisted = hasName && hasAge;
  
        console.log(currentUser.name);
        if(isAlreadyReqisted){
            return "You are already registered";
        } 
        else {
            people[_dni] = Person({name: _name,age: _age});
            return "Done";
        }
        
    }
}

contract Wallets {
        
    mapping(address => int) public wallets;
    
    function setWallet(address _walletAddress, int value) public {
        wallets[_walletAddress] = value;
    }
    
}
    
contract Profiles {
    
    struct User {
        string name;
        uint8 age;
        string userAlias;
    }
    
    mapping(address => User) public walletProfile;
    
    function setProfile(string memory _name, uint8 _age, string memory _alias) public {
        walletProfile[msg.sender] =   User({ name: _name, age: _age, userAlias: _alias}); 
    }

    function getProfile() public view returns(User memory) {
        return walletProfile[msg.sender];
    }
    
    
}
  
  