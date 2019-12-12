pragma solidity >=0.4.21 <0.6.0;

import "./ERC721Mintable.sol";
import "./verifier.sol";
// TODO define a contract call to the zokrates generated solidity contract <Verifier> or <renamedVerifier>

contract SquareVerifier is Verifier {

}

// TODO define another contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is RealEstateERC721Token {

SquareVerifier public squareContract;
    constructor(address verifierAddress) RealEstateERC721Token() public{
        squareContract = SquareVerifier(verifierAddress);
    }
    // TODO define a solutions struct that can hold an index & an address
    struct Solutions {
        uint256 index;
        address to;
    }

    // TODO define an array of the above struct
    Solutions[] SolutionsArray;

    // TODO define a mapping to store unique solutions submitted
    mapping(bytes32 => Solutions) private uniqueSolutions;

    // TODO Create an event to emit when a solution is added
    event SolutionAdded(address to, uint256 index);

    // TODO Create a function to add the solutions to the array and emit the event
    function addSolution(address _to, uint256 _index, bytes32 _key) internal {
        Solutions memory _solution = Solutions({index : _index, to : _to});
        SolutionsArray.push(_solution);
        uniqueSolutions[_key] = _solution;
        emit SolutionAdded(_to, _index);
    }

    // TODO Create a function to mint new NFT only after the solution has been verified

    function mintToken(
        address _to,
        uint256 _tokenId,
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[2] memory input
    ) public {
        // hash solution to get key
        bytes32 key = keccak256(abi.encodePacked(a, b, c, input));
        //  - make sure the solution is unique (has not been used before)
        require(uniqueSolutions[key].to == address(0), "Solution is already used.");
        //  verify solution
        require(squareContract.verifyTx(a, b, c, input), "Solution is not correct");

        addSolution(_to, _tokenId, key);
        //  - make sure you handle metadata as well as tokenSuplly
        super.mint(_to, _tokenId);
    }

}






















