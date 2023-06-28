// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract BookStore {
    struct Book {
        string title;
        uint8 price;
        address owner;
        bool sold;
       
    }

    //Using a dynamic array for storing book lists 
    uint[]  booklist;



    mapping (uint => Book) Books;


    // fun setting book details
    // set title price owner
    function setBookDetails(uint _slno,string memory _title, uint8 _price) public {
        Books[_slno] = Book(_title, _price, msg.sender,false);
        booklist.push(_slno);
    }

    //Fn overloading: for registering an already sold book
    function setBookDetails(uint _slno,string memory _title, uint8 _price, bool _soldornot) public {
        Books[_slno] = Book(_title, _price, msg.sender,_soldornot);
        booklist.push(_slno);
    }

    // buys - ownership transfer
    // buyer provider ether > price
    function buyBook(uint _slno) public payable {
        require( msg.sender != Books[_slno].owner,"You are already the owner");
        require(Books[_slno].sold,"Book is already sold");
        if ((msg.value / 1 ether) == Books[_slno].price) {
            Books[_slno].owner = msg.sender;
            Books[_slno].sold = true;
        } else if ((msg.value / 1 ether) > Books[_slno].price) {
            Books[_slno].owner = msg.sender;
            uint256 rm = msg.value - Books[_slno].price * 1 ether;
            Books[_slno].sold = true;
            payable(msg.sender).transfer(rm);
            
        } else {
            revert();
        }
    }

    function getBookDetails(uint _slno) public view returns (Book memory) {
        return (Books[_slno]);
    }

    function getBooklist() public view returns(uint [] memory) {
        return booklist;
    }

}
