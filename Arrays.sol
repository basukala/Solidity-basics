// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Array{
    //both dynamic and fixed-size are the storage memory which are permanently stored in blockchain
    //dynamic array 
    uint[] public num;

    //fixed-size array
    uint[5] public numFixed=[4,5,6,7,8]; //in this the size is fixed to 5 so the no. of element must be 5 only if it exceed then it is incorrect

    function arrayExamples() external{
        //push array
        num.push(5);
        num.push(1);
        num.push(8);
        num.push(12);

        //get array
        uint x=num[2];

        //update the array
        num[1]=12;

        //delete array
        delete num[2];

        //pop array
        num.pop();

        //length of array
        uint len=num.length;

        //create array in memory , this type of array isnot stored in blockchain as it is temporary
        uint[] memory a=new uint[](5);
        
    }

    
    function returnArr() external view returns(
        uint[] memory){
            return num;
    }
}

contract TestArr{
    string[] arrTest;

    function setArr(string memory myword) external{
        arrTest.push(myword);
    }

    function checkArr() external view returns(string[] memory ){
        return arrTest;
    }
}
