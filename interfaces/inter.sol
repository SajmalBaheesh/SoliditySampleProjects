// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface Calc {
    function multi(uint a, uint b) external pure returns (uint);
    function add(uint a, uint b) external pure returns (uint);
}

// abstract contract A {
//     function multi(uint a, uint b) external virtual pure returns (uint);
//     function add(uint a, uint b) external pure returns (uint);
// }

contract Calculator is Calc {
    function multi(uint a, uint b) public pure override returns (uint) {
        return a * b;
    }

   function add(uint a, uint b) external pure returns (uint) {
       return a + b;
   }
}


contract InteractCalc {
    Calc obj;

    constructor(address conAddr) {
        obj = Calc(conAddr);
    }

    function getMul() public view returns (uint) {
       return (obj.multi(4, 5));
    }
}
