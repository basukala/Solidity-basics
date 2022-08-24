// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ExampleVarScope{
    uint public scopeData=33;
    uint internal scopeData2=50;

    function scopes() public returns(uint){
        scopeData=11;
        return scopeData;
    }

}

contract Example2Scope is ExampleVarScope{
    function xc() public returns(uint){
        scopeData2=45;
        return scopeData2;
    }

    function mulNum() public pure returns (uint){
        uint a=2;
        uint b=6;
        uint results=a*b;
        return results;
    }
}


  
