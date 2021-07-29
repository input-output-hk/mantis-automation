pragma solidity >=0.4.22 <0.6.0;

contract HelloWorld {

    string public message;

    constructor() public {
        message = 'initial constructor message';
    }

    function update(string memory newMessage) public {
        message = newMessage;
    }
}