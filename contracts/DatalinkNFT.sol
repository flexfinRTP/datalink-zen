//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// implements the ERC721 standard
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// keeps track of the number of tokens issued
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Accessing the Ownable method ensures that only the creator of the smart contract can interact with it
contract DatalinkNFT is ERC721, Ownable {

    uint256 public nftCounter;
    // Optional mapping for token URIs
    mapping (uint256 => string) private _tokenURIs;

    // the name and symbol for the NFT
    constructor() public ERC721("DataLink Verified NFT", "DAL") {
        nftCounter = 0;
    }

    // Create a function to mint/create the NFT
    // receiver takes a type of address. This is the wallet address of the user that should receive the NFT minted using the smart contract
    // tokenURI takes a string that contains metadata about the NFT
    function _setTokenURI(uint256 newItemId, string memory _tokenURI) internal virtual
    {
        require(
            _exists(newItemId),
            "ERC721Metadata: URI set of nonexistent token"
        );
        _tokenURIs[newItemId] = _tokenURI;
    }

    function createNFT(address receiver) public onlyOwner returns (uint256)
    { //need recvier address in this function, this be called in the contract
        nftCounter++;
        _safeMint(receiver, nftCounter);
        // _setTokenURI(newItemId, tokenURI);

        // returns the id for the newly created token
        return nftCounter;
    }
}
