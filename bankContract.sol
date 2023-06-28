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

   //custom modifier, Functions with this modifier should pass the require condition 
    modifier onlyOwner() {
        
        require(msg.sender == owner,"Access Denied");
        _;
    }

    //events
    event Depositevent(address depositor ,uint amount) ;

    //deposit
    function deposit() public payable {
        ledgerBalance[msg.sender] = ledgerBalance[msg.sender] + msg.value;
        emit Depositevent(msg.sender,msg.value);
    }

    //functions to be called by only Owner ,Fns executed only if it passes 
    function getBankBalance() public view onlyOwner returns(uint){
        return address(this).balance;
    } 

    //Send his balance back
    function deleteAccount()public  {
        payable (msg.sender).transfer(ledgerBalance[msg.sender]);
        delete ledgerBalance[msg.sender]; //reset values to default
    }

    function closeBank() public onlyOwner {
        //deprecated. Reset the code to default state
        // selfdestruct(payable (owner))

        payable (owner).transfer(address(this).balance);
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
