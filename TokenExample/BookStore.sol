// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import "Token.sol";

//inherit below contract from Token

//Bookstore
contract BookStore is Token {
    struct Book {
        string title;
        uint8 price;
        address owner;
        bool sold;
    }

    uint[] public booklist;

    mapping(uint => Book) books;

    // fun setting book details
    // set title price owner
    function setBookDetails(string memory _title, uint8 _price) public returns (uint)  {
        uint _slno = createToken();
        books[_slno] = Book(_title, _price, msg.sender, false);
        booklist.push(_slno);
        return (_slno);
    }

    // buys - ownership tranfer
    // buyer provider ether > price
    function buyBook(uint _slno) public payable {
        require(books[_slno].owner != msg.sender, 'Already owns it');

        if ((msg.value / 1 ether) == books[_slno].price) {
            books[_slno].owner = msg.sender;
        } else if ((msg.value / 1 ether) > books[_slno].price) {
            books[_slno].owner = msg.sender;
            uint256 rm = msg.value - books[_slno].price * 1 ether;

            payable(msg.sender).transfer(rm);
        } else {
            revert();
        }
    }

    function getBookDetails(uint _slno) public view returns (Book memory) {
        return (books[_slno]);
    }
}
