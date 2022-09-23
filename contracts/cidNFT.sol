// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract cidNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    
    // ERC721 with (name, symbol)
    constructor() ERC721("Citizen Identification", "CID") {}
    
    function mintTo(address recipient) public returns (uint256) {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        // _setTokenURI(newItemId, tokenURI); 
        // https://flic.kr/p/2nNufGH
        return newItemId;
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