// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//every customer will be represented by address.


contract Bank{
    mapping(address => uint) ledgerBalance;
    address public owner; 
    
    //Use a constructor - Triggered at the time of deployment
    constructor() {
        //Whoever deploys the contract will be the owner
        owner = msg.sender;
    }

    //events
    event Depositevent(address depositor ,uint amount) ;

    //deposit
    function deposit() public payable {
        ledgerBalance[msg.sender] = ledgerBalance[msg.sender] + msg.value;
        emit Depositevent(msg.sender,msg.value);
    }

    //withdraw
    function withdraw(uint amount) public  {
       require(ledgerBalance[msg.sender] > amount,"Not enough balance");
       ledgerBalance[msg.sender] = ledgerBalance[msg.sender] - (amount );
       payable (msg.sender).transfer(amount);

    }
    function mybalance() public view returns (uint){
        return ledgerBalance[msg.sender];
    }
}
