// Tipo de datos estructurado que almacena un conjunto homogéneo de datos 
// udemy https://www.udemy.com/course/solidity-a-z/learn/lecture/27706626#learning-tools
// postgrado https://campus.bsmexecutive.com/course/view.php?id=22&section=6 VIDEO 1 1.49.05

/*
    Arrays de tamaño fijo (fixed-size arrays)
    No se puede hacer push
    Tienen un tamaño fijo en tiempo de compilación
    • Bytes1, bytes2, ..bytes32
    • //se asignan los códigos hexadecimales ASCII
    bytes2 example = 'ab';
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13; 

contract Arrays {
    bytes2 public example = 'ab'; // comilla simple
    bytes1 public byteExample = 'b';
    bytes3 public byteExample3 = '?2w';
    // Integer fixed-size arrays int8 a int256
    int[3] exampleArray = [int(1),2,4]; // casteo el primero, si no se queja LENGTH 3 O MENOR
    // Memory arrays se requiere new  uint[] memory a = new uint[](7);
    // uint[] public memory array = new uint[](7);
    // Operadores: length
    /*
    Los arrays solo podían ser respuesta de un retorno si el tipo
    era simple hasta versión 0.8. actualmente se permite retornos
    tipo complejo.
    */
}

pragma solidity ^0.8.13;

contract FixedArrayExample {
    
    uint[3] public array3;
    uint[] public dynamicArray;
    
    function initializeArray() public {
        uint[3] memory aux = [uint(1),2,3];
        array3 =  aux;
    }

    function setItem(uint8 _index, uint _value) public {
        array3[_index] = _value;
    }
   
	function getArrayLength () public view returns (uint intarray) {
		return array3.length;
	}
	
	function getArray() public view returns (uint[3] memory){
	    return array3;
	}
    
    function setArray(uint[3] memory _array) public {
        // array3 = uint[](_array); // no se pueden castear arrays
        array3 = _array; 
    }

    function setDynamicArray(uint[3] memory _array) public {
        // array3 = uint[](_array); // no se pueden castear arrays
        dynamicArray = _array; // Se puede meter un array más pequeño en otro más grande sin casteo
        // si pides la posición 4 sale revertida
    }

    function initializeDynamicArray() public {
        uint[] memory aux = new uint[](7); // ????
        dynamicArray =  aux;
    }

    
}

// ARRAYS DINÁMICOS
/*
    Definir keyword [] antes del tipo
    Bytes[], int[], StructType[], etc.
    Operadores: push, pop y length (excepción string no disponibles) ??
    String - codificación UTF-8
    El tipo de datos string no es tratado como tipo básico sino como
    array. Aunque no se permite ni lenght ni acceso por índice.
    En v0.8 se permite retorno lista de strings.
*/


contract dynamicArraysExamples {
    
    string public auxString;
    int[] public  intList;
    
    function initializeVars() public {
        auxString = "helloWorld";
        intList.push(1);
        intList.push(2);
    }
    
	function addItem(int _item) public {
	   intList.push(_item);
	}
	
	function setItem(uint8 _index, int _value) public {
        intList[_index] = _value;
    }
	
	function getArray() public view returns (int[] memory) {
	    return intList;
	}

	function getItem(uint _index) public view returns (int) {
	    return intList[_index]; // Sin interés porque es pública. REDUNDANTE
	}

	function getArrayLength () public view returns (uint) {
		return  intList.length;
	}
	
	function deleteItem(uint _index) public {
        uint length = intList.length;
        bool canDelete = _index < length;

	    if(canDelete) {
	        for(uint i = _index; i < length - 1; i++) {
	            intList[i] = intList[i + 1];
	        }
	        //  intList.length--;  //deprecated
            intList.pop();
	    } 
	}
}

contract Course {

    enum Status { Registered, Unsubscribed }
    
    struct Student {
        string ID;
        string name;
        uint8 age;
        Status status;
    }

    Student[] public students;
    Student public lastStudent;

    function subscribeStudent(string memory _ID, string memory _name, uint8 _age) public {
        Student memory currentStudent = Student({ ID: _ID, name: _name, age: _age, status: Status.Registered });
        students.push(currentStudent);
    }

   
}

/*
    Complications for Arrays and Structs
    The semantics of assignments are more complicated for non-value types like arrays and structs, 
    including bytes and string, see Data location and assignment behaviour for details.

    In the example below the call to g(x) has no effect on x because it creates an independent copy of the storage value in memory. 
    However, h(x) successfully modifies x because only a reference and not a copy is passed.
*/

contract C {
    uint[20] public x;

    function f() public {
        g(x); // x(2) = 0
        h(x); // x(3) = 4
    }

    function g(uint[20] memory y) internal pure {
        y[2] = 3;
    }

    function h(uint[20] storage y) internal {
        y[3] = 4;
    }
}