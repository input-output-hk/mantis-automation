pragma solidity >=0.4.25 <0.7.0;

contract HelloWorld {
    string private greeting;

    constructor() public {
        greeting = "Hello World";
    }

    function getGreeting() public view returns(string memory){
        return greeting;
    }
}