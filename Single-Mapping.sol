// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Employee{

    struct EmployeDetails{
        string name;
        uint phoneno;
    }

    struct EmployeResponse{
        string name;
        address addresses;
    }

    mapping(address=>EmployeDetails) public EmployeInfo;

    address[] public employe_address;

    //set employee details and address
    function setEmployee(string memory _name, uint _phoneno ) public{
        EmployeInfo[msg.sender]=EmployeDetails(_name,_phoneno);
        employe_address.push(msg.sender);
    }

    //return employee details and address
    function getEmployee() public view returns( EmployeDetails[] memory){
        address[] memory empAddress=new address[](employe_address.length);
        EmployeDetails[] memory empInfo=new EmployeDetails[](employe_address.length);

        for(uint i=0; i<employe_address.length;i++){
           empAddress[i]=employe_address[i];
            empInfo[i]=EmployeInfo[employe_address[i]];
        }

        return(empInfo);
    }

    //return employee name with address only using different employestruct
    function getEmployeeResponse() public view returns( EmployeResponse[] memory){
           EmployeResponse[] memory empInfo=new EmployeResponse[](employe_address.length);

        for(uint i=0; i<employe_address.length;i++){
            EmployeResponse memory empResponse=EmployeResponse(EmployeInfo[employe_address[i]].name,employe_address[i]);
            empInfo[i]=empResponse;
        }

        return(empInfo);
    }
}
