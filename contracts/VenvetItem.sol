// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VenvetItem is ERC721, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // Store NFT possible properties
  mapping(uint256 => string) _colors;
  mapping(uint256 => string) _sizes;

  // Store NFT properties
  mapping(uint256 => uint256) _tokenColors;
  mapping(uint256 => uint256) _tokenSizes;

  constructor() ERC721("VenvetItem", "VTI") {
    _colors[0] = "red";
    _colors[1] = "green";
    _colors[2] = "blue";

    _sizes[0] = "small";
    _sizes[1] = "medium";
    _sizes[2] = "large";
  }

  function createItem(address _owner, uint256 _color, uint256 _size) onlyOwner public returns (uint256) {
    // Get current id
    uint256 tokenId = _tokenIds.current();

    // Mint NFT to _owner
    _mint(_owner, tokenId);

    // Setup token metadata
    _tokenColors[tokenId] = _color;
    _tokenSizes[tokenId] = _size;

    _tokenIds.increment();
    return tokenId;
  }

  function getColor(uint256 _tokenId) public view returns (string memory) {
    return _colors[_tokenColors[_tokenId]];
  }

  function getSize(uint256 _tokenId) public view returns (string memory) {
    return _sizes[_tokenSizes[_tokenId]];
  }
}
