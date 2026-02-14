// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./MyNFT.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";

contract Marketplace {
    struct Listing {
        address nftContract;
        uint256 tokenId;
        address seller;
        uint256 price;
        bool sold;
    }

    Listing[] public listings;

    function listItem(address _nftContract, uint256 _tokenId, uint256 _price) external {
        require(_price > 0, "Price must be > 0");

        IERC721(_nftContract).transferFrom(msg.sender, address(this), _tokenId);

        listings.push(Listing({
            nftContract: _nftContract,
            tokenId: _tokenId,
            seller: msg.sender,
            price: _price,
            sold: false
        }));
    }

    function buyItem(uint256 listingId) external payable {
        Listing storage item = listings[listingId];
        require(!item.sold, "Already sold");
        require(msg.value >= item.price, "Insufficient funds");

        item.sold = true;

        (address royaltyReceiver, uint256 royaltyAmount) = ERC2981(item.nftContract).royaltyInfo(item.tokenId, item.price);

        if (royaltyAmount > 0) {
            payable(royaltyReceiver).transfer(royaltyAmount);
        }

        payable(item.seller).transfer(item.price - royaltyAmount);

        IERC721(item.nftContract).transferFrom(address(this), msg.sender, item.tokenId);
    }

    // مشاهده لیست NFTها
    function getListings() external view returns (Listing[] memory) {
        return listings;
    }
}
