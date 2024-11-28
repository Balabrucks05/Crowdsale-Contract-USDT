const { ethers } = require("hardhat");

async function main() {
    // // Get the signer's account
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

//     // // Get the contract factory for MyToken
//     const USDTToken = await ethers.getContractFactory("USDTToken");
//     const usdtToken = await USDTToken.deploy(); 
//     console.log("USDTToken deployed to:", usdtToken.address);

//     await usdtToken.deployed();

//     // console.log("USDTToken deployed to:", usdtToken.address);

//    // Deploy Sale TOken
//    const SaleToken = await ethers.getContractFactory("SaleToken");
//    const saleToken = await SaleToken.deploy();
//    await saleToken.deployed();
//    console.log("SaleToken deployed to:",saleToken.address );
   

//    const saleTokenAddress = saleToken.address; 
   
    // Deploy the crowdsale contract
    const Crowdsale = await ethers.getContractFactory("Crowdsale");
    //crowdsale configuration
    const rate = 100;
    const wallet = deployer.address; //Address to receive USDT
    const saletokenAddress = '0x5F2c897f9F88541D857cD04d2D949F4c04A9F516';//saleToken.address; // address of the deployed USDT token
    const usdtTokenAddress = '0x0C140424cB42c8318b1CF65b63BF70aA5ee218C4';//usdtToken.address;

//     USDTToken deployed to: 0x6605Ec5f7e6144350FbD6A9F4462CE3D43AA186E
// SaleToken deployed to: 0xcC611e418a82D052b3FF8C67dd42DbFADDF96b89
    //Deploy the crowdsale contract
    const crowdsale = await Crowdsale.deploy(rate, wallet, saletokenAddress,usdtTokenAddress);
    await crowdsale.deployed();

    console.log("Crowdsale contract deployed to:", crowdsale.address);

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
