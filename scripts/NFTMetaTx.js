async function main() {
  const [deployer] = await ethers.getSigners();

  //console.log("Deploying contracts with the account:", deployer.address);

  const NFTMetaTx = await ethers.getContractFactory("NFTMetaTx");
  const nftMetaTx = await NFTMetaTx.deploy();

  console.log("NFTMetaTx address:", nftMetaTx.address);
  console.log("Account balance:", (await deployer.getBalance()).toString());
  
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });