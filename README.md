# Base Deploy Practice

Base Deploy Practice is a beginner-friendly educational project for learning how to deploy a simple NFT smart contract on Base Mainnet using Remix.

You will practice three important skills:

1. Deploying a smart contract on Base Mainnet
2. Verifying the contract on BaseScan
3. Minting one NFT from the deployed contract

This project is Remix-only. There is no frontend app, no deployment script, no Hardhat setup, and no Foundry setup.

## Visual Guide

This repository also includes a simple static page:

```text
index.html
```

Open `index.html` in your browser if you want a visual overview of the lesson.

Important: this page is only a learning guide. You still deploy, verify, and mint using Remix, BaseScan, and your wallet.

## What You Will Build

You will deploy an NFT contract called `BaseDeployPractice`.

The NFT collection has:

- Name: `Base Deploy Practice NFT`
- Symbol: `BDP`
- Maximum supply: `100`
- Free minting
- One mint per wallet
- A public `mint()` function
- `totalSupply` tracking
- `tokenURI` support
- Owner-only ETH withdrawal

## Required Tools

Before you begin, you need:

- [GitHub](https://github.com/) account
- [Remix IDE](https://remix.ethereum.org/)
- Rabby or MetaMask wallet
- A small amount of ETH on Base Mainnet for gas fees
- Optional IPFS upload service such as Pinata or Lighthouse
- The contract file: `contracts/BaseDeployPractice.sol`
- The metadata file: `metadata/metadata.json`

## Important: You Do Not Need To Copy This Repository

You do not need to fork, clone, or download this repository to practice deployment.

To practice with Remix:

1. Open [`contracts/BaseDeployPractice.sol`](https://github.com/nato-san/base-deploy-practice/blob/main/contracts/BaseDeployPractice.sol)
2. Copy the contract code
3. Paste it into Remix
4. Deploy using your own wallet

Each learner deploys a separate contract from their own wallet.

## Important: Base Mainnet ETH

Deploying on Base Mainnet requires real ETH for gas fees.

You need ETH on Base Mainnet.

```text
ETH on Ethereum Mainnet = not usable for Base gas
ETH on Base Mainnet     = usable for Base gas
```

Minting is free in this contract, but deployment and mint transactions still require gas.

## Guild Badge Note

If a Guild badge checks contract deployment, the badge is awarded to the wallet that sends the deployment transaction.

This means you can use this sample contract code and still deploy your own contract with your own wallet.

Each learner can earn their own badge by deploying the contract on Base Mainnet from their own wallet.

## Project Structure

```text
base-deploy-practice/
├── README.md
├── contracts/
│   └── BaseDeployPractice.sol
├── metadata/
│   └── metadata.json
└── .gitignore
```

## Before You Start

This project uses OpenZeppelin contracts through GitHub imports inside Remix.

The contract imports:

```solidity
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.2/contracts/access/Ownable.sol";
```

When Remix compiles the contract, it will load these files automatically.

## Metadata

The contract constructor asks for one value:

```text
initialTokenURI
```

This is the metadata URL for the NFT.

### What is IPFS?

IPFS is decentralized storage often used for NFT images and metadata.

Basic workflow:

1. Upload the image and `metadata.json` to IPFS.
2. Receive a CID.
3. Replace `YOUR_METADATA_FOLDER_CID` with your actual CID.

Example:

```text
ipfs://bafybeixxxxx/metadata.json
```

Beginner-friendly IPFS upload tools include Pinata and Lighthouse.

This project includes the NFT image here:

```text
metadata/base-deploy-practice-nft.png
```

The sample metadata file points to that image with an IPFS-style folder path:

```json
"image": "ipfs://YOUR_METADATA_FOLDER_CID/base-deploy-practice-nft.png"
```

For a real NFT display, upload the whole `metadata` folder to IPFS. After upload, replace `YOUR_METADATA_FOLDER_CID` with your real folder CID.

Your constructor value should point to the uploaded metadata file:

```text
ipfs://YOUR_METADATA_FOLDER_CID/metadata.json
```

Example metadata:

```json
{
  "name": "Base Deploy Practice NFT",
  "description": "A practice NFT for learning how to deploy a contract on Base Mainnet, verify it on BaseScan, and mint your own NFT using Remix.",
  "image": "ipfs://YOUR_METADATA_FOLDER_CID/base-deploy-practice-nft.png"
}
```

## Lesson 1 — Deploy Contract with Remix

### Step 1: Open Remix

Go to [https://remix.ethereum.org/](https://remix.ethereum.org/).

Remix is a browser-based tool for writing, compiling, deploying, and testing smart contracts.

### Step 2: Create or Import the Solidity File

In Remix, open the file explorer.

Create a new file named:

```text
contracts/BaseDeployPractice.sol
```

Copy the code from this project's `contracts/BaseDeployPractice.sol` file and paste it into Remix.

### Step 3: Compile the Contract

Open the Solidity Compiler tab in Remix.

Choose a compiler version that matches the contract:

```text
0.8.20 or newer 0.8.x version
```

The contract uses:

```solidity
pragma solidity ^0.8.20;
```

Click **Compile BaseDeployPractice.sol**.

If the compile button succeeds, you are ready to deploy.

### Step 4: Connect Your Wallet

Open the **Deploy & Run Transactions** tab in Remix.

Under **Environment**, choose:

```text
Injected Provider
```

Your wallet, such as Rabby or MetaMask, should ask for permission to connect.

Approve the connection.

### Step 5: Switch Wallet to Base Mainnet

In your wallet, switch the network to:

```text
Base Mainnet
```

Make sure Remix also shows the Base Mainnet network after you connect with Injected Provider.

You need a small amount of ETH on Base Mainnet to pay the deployment gas fee.

### Step 6: Deploy

In the Remix deployment panel, select the contract:

```text
BaseDeployPractice
```

The constructor needs one value:

```text
"ipfs://YOUR_METADATA_FOLDER_CID/metadata.json"
```

Keep the quotation marks when entering a string in Remix.

Click **Deploy**.

Your wallet will open a transaction confirmation.

Check the network and gas fee, then confirm the transaction.

After the transaction is confirmed, Remix will show the deployed contract in the **Deployed Contracts** section.

Save the deployed contract address. You will need it for BaseScan verification.

## Lesson 2 — Verify Contract on BaseScan

### Step 1: Open BaseScan

Go to [https://basescan.org/](https://basescan.org/).

Paste your deployed contract address into the search bar.

Open the contract page.

### Step 2: Start Verification

On the contract page, look for a button or link similar to:

```text
Verify and Publish
```

Open the verification page.

### Step 3: Enter Compiler Details

Use settings that match your Remix compilation.

Typical settings:

- Contract address: your deployed contract address
- Compiler type: Solidity Single File
- Compiler version: the same version you used in Remix
- Open source license type: MIT

Important: the compiler version must match the version used during deployment. If you deployed with `0.8.20`, verify with `0.8.20`.

### Step 4: Paste the Source Code

Paste the full contents of:

```text
contracts/BaseDeployPractice.sol
```

Because this contract uses GitHub imports, BaseScan may ask you to flatten the file or provide all imported sources.

For a beginner workflow, the simplest path is usually:

1. Use Remix to flatten the contract if needed.
2. Paste the flattened source into BaseScan.
3. Keep the license as MIT.

### Step 5: Constructor Arguments

This contract has one constructor argument:

```solidity
constructor(string memory initialTokenURI)
```

That means BaseScan may need the constructor argument value you used during deployment.

Example:

```text
ipfs://YOUR_METADATA_CID/metadata.json
```

If BaseScan asks for ABI-encoded constructor arguments, use the value exactly as deployed and use BaseScan or Remix tools to encode it correctly.

### Step 6: Finish Verification

Submit the verification form.

If everything matches, BaseScan will show the contract as verified.

After verification, people can read the source code and interact with the contract directly on BaseScan.

## Lesson 3 — Mint NFT

### Step 1: Open the Deployed Contract in Remix

Return to Remix.

Open the **Deploy & Run Transactions** tab.

Find your deployed `BaseDeployPractice` contract under **Deployed Contracts**.

### Step 2: Click `mint()`

Open the deployed contract panel.

Find the orange button named:

```text
mint
```

Click it.

### Step 3: Confirm the Transaction

Your wallet will open a transaction confirmation.

Check that the network is Base Mainnet.

Confirm the transaction.

Minting is free, but you still pay the network gas fee.

### Step 4: Check the NFT or Transaction on BaseScan

After the transaction is confirmed, copy the transaction hash from Remix or your wallet.

Open [https://basescan.org/](https://basescan.org/) and search for the transaction hash.

You can also open your contract page on BaseScan and check:

- Token transfers
- The `totalSupply` value
- Your wallet address
- The minted token ID

The first minted NFT should have token ID `1`.

## Useful Contract Functions

### `mint()`

Mints one free NFT to your wallet.

Rules:

- You can only mint once.
- Minting stops when `totalSupply` reaches `100`.

### `totalSupply()`

Shows how many NFTs have been minted so far.

### `hasMinted(address)`

Shows whether a wallet has already minted.

### `tokenURI(uint256 tokenId)`

Shows the metadata URL for a token.

Example:

```text
tokenURI(1)
```

### `setTokenURI(string newTokenURI)`

Allows the contract owner to update the metadata URL.

Only the owner can call this.

### `withdraw()`

Allows the owner to withdraw ETH from the contract.

Minting is free, so this is mainly for ETH accidentally sent to the contract.

## Common Errors

### Wrong network

Problem:

Your wallet is not connected to Base Mainnet.

Fix:

Switch Rabby or MetaMask to Base Mainnet, then reconnect Remix using Injected Provider.

### Not enough ETH for gas

Problem:

Even though minting is free, deployment and minting still require gas.

Fix:

Add a small amount of ETH to your wallet on Base Mainnet.

### Compiler version mismatch

Problem:

BaseScan verification fails because the compiler version does not match.

Fix:

Use the same Solidity compiler version on BaseScan that you used in Remix.

### Already minted

Problem:

The transaction fails with:

```text
Already minted
```

Fix:

Each wallet can mint only once. Use a different wallet only if you are intentionally testing another mint.

### Sold out

Problem:

The transaction fails with:

```text
Sold out
```

Fix:

The collection has reached the maximum supply of 100 NFTs. No more NFTs can be minted.

## Important Notes

- This is an educational Remix-only project.
- Do not use a frontend app.
- Do not use Next.js, wagmi, viem, or Tailwind.
- Do not use Hardhat or Foundry.
- Always check that your wallet is on Base Mainnet before deploying or minting.
- Deploying to Base Mainnet uses real ETH for gas, even for practice.

## License

Code:

MIT License.

Images / Artwork:

Educational use only unless otherwise stated. Commercial redistribution of artwork is not allowed without permission.

## Learning Goal

By the end of this project, you should understand the basic flow of:

1. Writing a simple NFT smart contract
2. Compiling it in Remix
3. Deploying it to Base Mainnet
4. Verifying it on BaseScan
5. Minting an NFT from Remix
