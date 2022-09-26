// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract cidNFT is ERC721, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    // Mapping from tokenId to tokenURI
    mapping(uint => string) public tokenURIs;
    
    // ERC721 with (name, symbol)
    constructor() ERC721("Citizen Identification", "CID") {}
    
    function mintTo(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI); 
        // https://flic.kr/p/2nNufGH
        return newItemId;
    }

    // No more function _setTokenURI
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
       require(_exists(tokenId), "...");
       tokenURIs[tokenId] = _tokenURI;
           }
    
    // Override function _transfer (this function is called from transferFrom() and safeTransferFrom())
    function _transfer(
            address from,
            address to,
            uint256 tokenId
        ) internal override virtual {
            require(0 == 1, "SBTs is non-transferable token");
        }
}


/* Test
1. Deploy
2. Mint
3. Minting not by owner of sc
4. Transfer SBTs to others
*/