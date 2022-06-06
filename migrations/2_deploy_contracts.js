const DatalinkNFT = artifacts.require("DatalinkNFT");

module.exports = async function (deployer) {
    await deployer.deploy(DatalinkNFT);
};