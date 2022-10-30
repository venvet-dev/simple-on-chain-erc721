const hre = require("hardhat");

const availableSizes = [0, 1, 2];
const availableColors = [0, 1, 2];

async function main() {
  const [owner, addr1] = await ethers.getSigners();
  const factory = await hre.ethers.getContractFactory("VenvetItem");
  const token = await factory.deploy();

  await token.deployed();

  console.log("NFT Contract deployed to:", token.address);

  const _color = availableColors[Math.floor(Math.random() * availableColors.length)];
  const _size = availableSizes[Math.floor(Math.random() * availableSizes.length)];

  await token.createItem(addr1.address, _color, _size);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
