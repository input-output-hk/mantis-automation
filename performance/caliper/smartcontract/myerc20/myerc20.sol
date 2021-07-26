pragma solidity ^0.8.0;

import "./ERC20.sol";

contract MyERC20 is ERC20 {
  uint constant _supply = 100000000; 
  constructor() ERC20("MyERC20", "MRC"){
		_mint(msg.sender, _supply);
	}
}
