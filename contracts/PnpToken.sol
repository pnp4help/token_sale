pragma solidity ^0.4.2;
contract PnpToken {
	string public name="PNP Token"; //Name
	string public symbol="PNP"; // Symbol
	string public standard="PNP Token v1.0"; // Standard
	uint256 public totalSupply;
	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);
	// Approve
	event Approval(
		address indexed _owner,
		address indexed _spender,
		uint256 _value
	);
	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance; 
	// Allowance
	function PnpToken(uint256 _initialSupply) public {
		balanceOf[msg.sender] = _initialSupply; // Key Value
		totalSupply = _initialSupply;
	}
	// Transfer 
	function transfer(address _to, uint256 _value) public returns(bool success) {
	require(balanceOf[msg.sender] >= _value);
	balanceOf[msg.sender] -= _value; // Transfer the balance
	balanceOf[_to] += _value; // Change the balance
	Transfer(msg.sender, _to, _value); // Transfer Event
		return true; // Return a boolean
	}
	// Approve
	function approve (address _spender, uint256 _value) public returns(bool success) {
		allowance[msg.sender][_spender] = _value; // Allowance
		Approval(msg.sender,_spender,_value); // Approve Event
		return true; // return a boolean
	}
	// TransferFrom
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]); // Require _from has enough tokens
        require(_value <= allowance[_from][msg.sender]); // Require allowance is big enough
        balanceOf[_from] -= _value; // Change the balance
        balanceOf[_to] += _value; // Change the balance
        allowance[_from][msg.sender] -= _value; // Update the allowance
        Transfer(_from, _to, _value);
        return true; // return a boolean
	} }
