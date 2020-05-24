pragma solidity >=0.4.21 <0.7.0;

contract HelloWorld {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function helloWorld() public pure returns (string memory){
        return ("HelloWorld");
    }

}
