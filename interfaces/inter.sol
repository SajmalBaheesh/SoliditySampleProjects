// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

interface  Calc {
    function multi(uint a, uint b) external pure returns (uint);
    function add(uint a, uint b) external pure returns (uint);
}

contract Calculator is Calc {

    function multi(uint a, uint b) external pure returns (uint){
        return (a*b);
    }
    
    function add(uint a, uint b) external pure returns (uint){
        return (a+b);
    }


}
