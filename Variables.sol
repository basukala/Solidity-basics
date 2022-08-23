// Solidity program to demonstrate state variables
pragma solidity ^0.5.0;

// Creating a contract
contract Var_Test {
	
    // Declaring a state variable
    uint8 public state_var;	

    // Defining a constructor
    constructor() public {
        state_var = 16;
    }

    // Defining function to show the declaration and scope of local variables
    function getResult() public view returns(uint){
        
        // Initializing local variables
        uint local_var1 = 5;
        uint local_var2 = 7;
        uint result = local_var1 + local_var2;
        
        // Access the local variable
        return result;
    }

}


//Global Variable
// Creating a contract
contract Test2 {
        
    // Defining a variable
    address public userAdmin;
        
    // Creating a constructor to
    // use Global variable
    constructor() public {	
        userAdmin = msg.sender;
    }
}


