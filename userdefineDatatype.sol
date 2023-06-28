// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract BookStore {
    struct Book {
        string title;
        uint8 price;
        address owner;
    }

    Book bk;

    // fun setting book details
    // set title price owner
    function setBookDetails(string memory _title, uint8 _price) public {
        bk = Book(_title, _price, msg.sender);
    }

    // buys - ownership tranfer
    // buyer provider ether > price
    function buyBook() public payable {
        if ((msg.value / 1 ether) == bk.price) {
            bk.owner = msg.sender;
        } else if ((msg.value / 1 ether) > bk.price) {
            bk.owner = msg.sender;
            uint256 rm = msg.value - bk.price * 1 ether;

            payable(msg.sender).transfer(rm);
        } else {
            revert();
        }
    }

    function getBookDetails() public view returns (Book memory) {
        return (bk);
    }
}
