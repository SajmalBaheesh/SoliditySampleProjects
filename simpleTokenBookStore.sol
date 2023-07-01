// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//every customer will be represented by address.



contract Token{
    //Token Owner
    mapping (uint => address) tokenOwner;

    // function to create a token
    function createToken() public returns (uint) {
        uint tokenID = block.timestamp;
        tokenOwner[tokenID] = msg.sender;
        return tokenID;
    }

    //change Owner
    function changeTokenOwner(uint _tokenID,address newOwner) public {
        tokenOwner[_tokenID] = newOwner;
    }
}





contract Bank{
    mapping(address => uint) ledgerBalance;
    mapping (uint=>address) addressIndex;
    address public owner; 
    uint64 public addrCount;
    
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
        if(ledgerBalance[msg.sender] ==0){
            addressIndex[addrCount++] == msg.sender;
        }
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
        //Allow owner to close account only if all other's  got their money 
        // require(addrCount==0,"You can't close the bank when existing users are there");
        
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
    
    //Function to Transfer ownership
    function transferOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
