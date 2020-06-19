var PnpToken = artifacts.require("./PnpToken.sol");
var PnpTokenSale = artifacts.require("./PnpTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(PnpToken, 1000000).then(function(){
  	 // Token price is 0.001 Ether
    var tokenPrice = 1000000000000000;
  	return deployer.deploy(PnpTokenSale, PnpToken.address, tokenPrice);
  });
};

