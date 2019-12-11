// migrating the appropriate contracts
var RealEstateERC721Token = artifacts.require("./RealEstateERC721Token.sol");
var SquareVerifier = artifacts.require("./SquareVerifier.sol");
var SolnSquareVerifier = artifacts.require("./SolnSquareVerifier.sol");

module.exports = function (deployer) {
  deployer.deploy(RealEstateERC721Token);
  deployer.deploy(SquareVerifier).then(() => {
    return deployer.deploy(SolnSquareVerifier, SquareVerifier.address);
  });
};
