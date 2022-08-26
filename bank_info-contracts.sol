// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank{
    struct UserData{
        uint256 bank_name;
        string branch;
        uint256 balance;
        bool isExists;
    }


    struct UserDataReturn{
        uint256 bank_account_num;
        uint256 bank_name;
        string branch;
        uint256 balance;
    }

    mapping(address=>mapping(uint256=>UserData)) public UserDetails; //mapping address with the user account details

    address[] public user_address; //initializing dynamic state variable for address
    uint256[] public user_acc; //initializing dynamic state varaible for user account


    //set data as per the mapping for user accounts
    function setUserData(uint256 _bank_account_num,uint256 _bank_name, string memory _branch, uint256 _balance)  public {
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
            if(UserDetails[msg.sender][user_acc[i]].isExists == true){
                UserDataReturn memory returnData =UserDataReturn(
                    user_acc[i],
                    UserDetails[msg.sender][user_acc[i]].bank_name,
                    UserDetails[msg.sender][user_acc[i]].branch,
                    UserDetails[msg.sender][user_acc[i]].balance
                );
                 userReturns[counter] = returnData;
                 counter++;
            }
           
        }
        return userReturns;
    }

    //get all accounts and info for specific bank
    function getAllAccount(uint256 _bankName) public view returns(UserDataReturn[] memory){
        UserDataReturn[] memory userAdd= new UserDataReturn[](user_acc.length);
        uint256 counter;
        for(uint i=0; i<user_address.length; i++){
            for(uint j=0; j<user_acc.length; j++){
                
                if(UserDetails[user_address[i]][user_acc[j]].bank_name == _bankName){
                    UserDataReturn memory accAddress=UserDataReturn(
                        user_acc[j],
                        _bankName,
                        UserDetails[user_address[i]][user_acc[j]].branch,
                        UserDetails[user_address[i]][user_acc[j]].balance
                        );

                        userAdd[counter]=accAddress;
                        counter++;
                }                

            }
        }
        return userAdd;

    }

    //get balance for specific address and user account
    function getBalance(address _accAddress, uint _user_acc) public view returns(uint256){
       return UserDetails[_accAddress][_user_acc].balance;
    }

    //transfer balance from one account to another
    function balanceTransfer(uint256 _senderBalance,uint256 _senderAcc,uint256 _receiverAcc, address _receiverAddress) public{                        
        uint256 totalBalance=getBalance(msg.sender,_senderAcc);
        if(totalBalance >= _senderBalance){
            //decrease sender balance
            UserDetails[msg.sender][_senderAcc].balance=UserDetails[msg.sender][_senderAcc].balance - _senderBalance;
            //increase receiver balance
            UserDetails[_receiverAddress][_receiverAcc].balance=UserDetails[_receiverAddress][_receiverAcc].balance + _senderBalance;
        }       
    }
    
}
