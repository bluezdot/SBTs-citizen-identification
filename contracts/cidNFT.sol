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

    // Mapping
    mapping (uint => address) sbtToOwner;

    uint sbtCount = 0;
    
    // ERC721 with (name, symbol)
    constructor() ERC721("Citizen Identification", "CID") {}
    
    function mintTo(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI); 
        // https://flic.kr/p/2nNufGH
        sbtToOwner[newItemId] = recipient;
        sbtCount ++;
        return newItemId;
    }

// CHO A GIANG NE
    function mintToFree(address recipient, string memory tokenURI) public returns (uint256) {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI); 
        // https://flic.kr/p/2nNufGH
        return newItemId;
    }

    function returnABC(address recipient, string memory tokenURI) public returns (uint256) {
        return 35;
    }
// CHO A GIANG NE

    function getSbtByOwner(address _owner) external view returns(uint[] memory) {
    uint[] memory result = new uint[](balanceOf(_owner));
    uint counter = 0;
    for (uint i = 0; i < sbtCount; i++) {
      if (sbtToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
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