
# NFT Marketplace (ERC721 + ERC2981)

A decentralized NFT marketplace built with Solidity, supporting ERC721 NFTs with on-chain royalty payments using ERC2981.

This project demonstrates professional NFT smart contract development, royalty standards, and marketplace design patterns.

---

##  Overview

This project consists of an ERC721 NFT contract integrated with ERC2981 royalty standard.
It enables creators to mint NFTs while ensuring they receive royalties on secondary sales.

The marketplace logic is designed to be compatible with modern NFT platforms and standards.

---

##  Features

- ERC721 compliant NFT contract
- ERC2981 royalty support
- On-chain royalty calculation
- Creator royalty enforcement
- Secure minting logic
- OpenZeppelin-based implementation

---

##  Architecture

### MyNFT.sol
- ERC721 NFT implementation
- Royalty configuration per token
- Minting functionality
- Metadata URI management

---

##  Standards Used

- ERC721 – Non-fungible token standard
- ERC2981 – NFT royalty standard
- OpenZeppelin Contracts

---

## Deployment (Remix IDE)

1. Open Remix IDE
2. Create a new workspace
3. Add the contract to the `contracts` folder
4. Compile using Solidity version `0.8.x`
5. Deploy `MyNFT.sol`
6. Mint NFTs using the `mint` function
7. Verify royalty info using `royaltyInfo`

---

##  Example Usage

```text
mint(to, tokenURI)
royaltyInfo(tokenId, salePrice)
