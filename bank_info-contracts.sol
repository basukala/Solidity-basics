// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank{
    struct UserData{
        string bank_name;
        string branch;
        uint256 balance;
        bool isExists;
    }

    struct UserDataReturn{
        uint256 bank_account_num;
        string bank_name;
        string branch;
        uint256 balance;
    }

    mapping(address=>mapping(uint256=>UserData)) public UserDetails; //mapping address with the user account details

    address[] public user_address; //initializing dynamic state variable for address
    uint256[] public user_acc; //initializing dynamic state varaible for user account


    //set data as per the mapping for user accounts
    function setUserData(uint256 _bank_account_num,string memory _bank_name, string memory _branch, uint256 _balance)  public {
        UserDetails[msg.sender][_bank_account_num]=UserData(_bank_name,_branch,_balance,true);
        user_address.push(msg.sender);
        user_acc.push(_bank_account_num);
    }

    //set deposit balance as per the bank acc number
    function userDeposit(uint256 _bank_account_num,uint256 _balance) public{
        UserDetails[msg.sender][_bank_account_num].balance=UserDetails[msg.sender][_bank_account_num].balance + _balance;
    }

    //set withdraw balance as per the bank acc number
    function userWithDraw(uint256 _bank_account_num, uint256 _balance) public{
        UserDetails[msg.sender][_bank_account_num].balance=UserDetails[msg.sender][_bank_account_num].balance - _balance;
    }

    //get specific address data
    function getSpecificAddressData() public view returns(UserDataReturn[] memory){
        UserDataReturn[] memory userReturns=new UserDataReturn[](user_acc.length);
        uint256 counter;
        for(uint i=0; i<user_acc.length; i++){
            if(UserData[msg.sender][user_acc[i]].isExists == true){
                UserDataReturn memory returnData =UserDataReturn(
                    user_acc[i],
                    UserDataReturn[msg.sender][user_acc[i]].bank_name,
                    UserDataReturn[msg.sender][user_acc[i]].branch,
                    UserDataReturn[msg.sender][user_acc[i]].balance
                );
            }
            userReturns[msg.sender]=UserDataReturn;
            counter++;
        }
        return userReturns;
    }
}
