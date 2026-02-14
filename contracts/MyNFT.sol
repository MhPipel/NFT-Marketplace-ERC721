// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import از OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, ERC2981, Ownable {
    uint256 public tokenIdCounter;

    // Constructor
    constructor() ERC721("MyNFT", "MNFT") Ownable(msg.sender) {
        _setDefaultRoyalty(msg.sender, 500); // 500 = 5%
    }

    function mint(address to) external onlyOwner {
        tokenIdCounter++;
        _safeMint(to, tokenIdCounter);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}

