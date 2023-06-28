// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract BookStore {
    struct Book {
        string title;
        uint8 price;
        address owner;
        bool sold;
       
    }
    mapping (uint => Book) Books;


    // fun setting book details
    // set title price owner
    function setBookDetails(uint _slno,string memory _title, uint8 _price) public {
        Books[_slno] = Book(_title, _price, msg.sender,false);
    }

    // buys - ownership transfer
    // buyer provider ether > price
    function buyBook(uint _slno) public payable {
        if ((msg.value / 1 ether) == Books[_slno].price) {
            Books[_slno].owner = msg.sender;
        } else if ((msg.value / 1 ether) > Books[_slno].price) {
            Books[_slno].owner = msg.sender;
            uint256 rm = msg.value - Books[_slno].price * 1 ether;

            payable(msg.sender).transfer(rm);
        } else {
            revert();
        }
    }

    function getBookDetails(uint _slno) public view returns (Book memory) {
        return (Books[_slno]);
    }
}
