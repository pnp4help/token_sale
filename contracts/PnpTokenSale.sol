pragma solidity ^0.4.2;
import "./PnpToken.sol";
/**
 * The contractName contract does this and that...
 */
contract PnpTokenSale {
	address admin;
	PnpToken public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokensSold;

	event Sell(address _buyer, uint256 _amount);
	
	function PnpTokenSale(PnpToken _tokenContract, uint256 _tokenPrice) public {
		admin = msg.sender; // Assign an admin
		tokenContract = _tokenContract; // Token contract
		tokenPrice = _tokenPrice; // Token Price
	}	
	// multiply function 
	function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    	}
	// Buy Tokens 
	 function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice)); 
        // Require that value equal to tokens
        require(tokenContract.balanceOf(this) >= _numberOfTokens); 
        // Require that contract has enough tokens
        require(tokenContract.transfer(msg.sender, _numberOfTokens)); 
        // Require that a transfer is successful
        tokensSold += _numberOfTokens;
        Sell(msg.sender, _numberOfTokens); // Trigger Sell Event
    }
    // Ending Token PnpTokenSale
     function endSale() public {
        require(msg.sender == admin); // Require admin 
        require(tokenContract.transfer(admin, tokenContract.balanceOf(this))); 
        // Transfer remaining PnpToken to the admin
        selfdestruct(admin); // Destroy contract
    }
}
