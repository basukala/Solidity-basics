// Solidity program to demonstrate value and reference datatypes
pragma solidity ^ 0.5.0;

//value Datatypes
contract Data_types{
  //initialize boolean variable
  bool public bool_data=true;
  
  //initialize integer variable
  int32 public int_data=45;
  
  //initialize string variable
  string public str_data='solidity';
  
  //initialize byte variable
  bytes1 public b='a';
  
  //defining enumerator
  enum my_enum {geeks_,_for,_geeks}
  
  //defining a function to return the value of the enumerator
   function Enum() public pure returns (
        my_enum){
            return my_enum._geeks;
        }
}

//reference Datatypes
contract mappingExample{
  //defining an array
  uint[4] public arrs=[uint(1),2,3,4];
  
  //defining a structure
  struct teacher{
    string name;
    string faculty;
    string subject;
    uint8 score;
  }
  
  //creating a struct object
  teacher public teach1;
  
  //defining a function to return the value of the element of the teachInfo
  function teachInfo() public view returns(
  string memory, string memory, string memory, uint){
    teach1.name='Lisa';
    teach1.faculty='management';
    teach1.subject='accounts';
    teach1.score=89;
    return(
      teach1.name,teach1.faculty,teach1.subject,teach1.score);    
  }
  
  //create a mapping and array
    mapping(address=> teacher) finalresult;
    address[] final_result; 

}
