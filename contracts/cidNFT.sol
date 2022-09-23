// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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
        return newItemId;
    }
}