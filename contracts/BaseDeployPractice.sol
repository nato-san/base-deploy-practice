// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// OpenZeppelin gives us safe, well-tested NFT and ownership code.
// In Remix, these imports work directly from GitHub when you compile.
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/access/Ownable.sol";

/**
 * @title BaseDeployPractice
 * @notice A simple NFT contract for practicing deployment on Base Mainnet.
 *
 * This contract is intentionally small and beginner-friendly:
 * - There are only 100 NFTs.
 * - Minting is free.
 * - Each wallet can mint only one NFT.
 * - The owner can withdraw any ETH accidentally sent to the contract.
 */
contract BaseDeployPractice is ERC721, Ownable {
    // The maximum number of NFTs that can ever be minted.
    uint256 public constant MAX_SUPPLY = 100;

    // The number of NFTs minted so far.
    uint256 public totalSupply;

    // The metadata URL used by every NFT in this beginner project.
    string private _tokenURI;

    // Tracks whether an address has already minted an NFT.
    mapping(address => bool) public hasMinted;

    /**
     * @notice Sets the NFT collection name, symbol, and metadata URL.
     * @param initialTokenURI The metadata URL for the NFT.
     *
     * Example token URI:
     * ipfs://YOUR_METADATA_CID/metadata.json
     */
    constructor(string memory initialTokenURI)
        ERC721("Base Deploy Practice NFT", "BDP")
        Ownable(msg.sender)
    {
        _tokenURI = initialTokenURI;
    }

    /**
     * @notice Mint one free NFT.
     *
     * Rules:
     * - The collection cannot be sold out.
     * - Your wallet can only mint once.
     */
    function mint() public {
        require(totalSupply < MAX_SUPPLY, "Sold out");
        require(!hasMinted[msg.sender], "Already minted");

        // The next token ID starts at 1, which is easy to read on explorers.
        uint256 tokenId = totalSupply + 1;

        // Mark this wallet as used before minting.
        hasMinted[msg.sender] = true;

        // Increase the total supply.
        totalSupply = tokenId;

        // Mint the NFT to the wallet that called this function.
        _safeMint(msg.sender, tokenId);
    }

    /**
     * @notice Return the metadata URL for a token.
     * @param tokenId The NFT token ID.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // This checks that the token exists before returning metadata.
        _requireOwned(tokenId);

        return _tokenURI;
    }

    /**
     * @notice Update the metadata URL.
     * @dev Only the contract owner can call this function.
     */
    function setTokenURI(string memory newTokenURI) public onlyOwner {
        _tokenURI = newTokenURI;
    }

    /**
     * @notice Withdraw ETH from this contract to the owner's wallet.
     * @dev Minting is free, but this is useful if ETH is accidentally sent here.
     */
    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    /**
     * @notice Allow the contract to receive ETH.
     */
    receive() external payable {}
}
